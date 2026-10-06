<?php

namespace Service;

use Bitrix\Main\Application;
use Bitrix\Main\Error;
use Bitrix\Main\Result;
use Entity\CarTable;
use Entity\StatusTable;
use Throwable;

require_once __DIR__ . '/../Entity/constants.php';


class CarService
{

    public static function create(array $data): Result
    {
        $result = new Result();

        if (empty($data['model'])) {
            $result->addError(new Error('Value of model is required.'));
            return $result;
        }

        $exists = CarTable::getList([
            'select' => ['ID'],

            'filter' => [
                '=UF_VIN' => $data['vin'],
            ],

            'limit' => 1,
        ])->fetch();

        if ($exists) {
            $result->addError(new Error('Model with such VIN already exists.'));
            return $result;
        }

        if ($data['year'] > ACTUAL_YEAR) {
            $result->addError(new Error('Year must not be greater than current year.'));
            return $result;
        }

        $status = StatusTable::getList([
            'select' => ['ID'],

            'filter' => [
                '=UF_CODE' => $data['status'],
            ],

            'limit' => 1,
        ])->fetch();

        if (!$status) {
            $result->addError(new Error('No such status in DB for creating car.'));
            return $result;
        }

        $addResult = CarTable::add([
            'UF_MODEL' => $data['model'],
            'UF_YEAR' => $data['year'] ?? null,
            'UF_VIN' => $data['vin'],
            'UF_STATUS' => $status,
            'UF_PRICE_PER_DAY' => $data['price_per_day'],
        ]);

        if (!$addResult->isSuccess()) {
            $result->addErrors($addResult->getErrors());

            return $result;
        }

        $result->setData([
            'model' => $data['model'],
        ]);


        return $result;
    }

    public function createMultipleCars(array $cars): Result
    {
        $result = new Result();

        if (empty($cars)) {
            $result->addError(new Error('Value of model is required.'));
        }

        $connection = Application::getConnection();

        $connection->startTransaction();

        $createdCars = [];

        try {
            foreach ($cars as $index => $carData) {
                $createResult = self::create($carData);

                if (!$createResult->isSuccess()) {
                    $errors = implode(
                        ";",
                        $createResult->getErrorMessages()
                    );

                    throw new \RuntimeException(
                        'Ошибка при создании автомобиля №'
                        . ($index + 1)
                        . ': '
                        . $errors
                    );
                }

                $createdData = $createResult->getData();

                $createdCars[] = $createdData['model'];
            }

            $connection->commitTransaction();

            $result->setData([
                'models' => $createdCars,
            ]);

            return $result;

        } catch (Throwable $exception) {
            $connection->rollbackTransaction();

            throw $exception;
        }
    }


    /**
     * Изменение данных об автомобиле
     * Можно менять только статус и цену аренды за день
    */
    public function update(int $id, array $data): Result
    {
        $result = new Result();

        if (empty($id) || empty($data)) {
            $result->addError(new Error('Id and data for changing are required.'));

            return $result;
        }

        $car = CarTable::getById($id)->fetch();

        if (empty($car)) {
            $result->addError(new Error('Car with such id not found.'));
            return $result;
        }

//        echo "Нашли машину: " . $car['UF_MODEL'] . "\n";

        if (isset($data['status'])) {
            $status = StatusTable::getList([
                'select' => ['ID'],
                'filter' => [
                    '=UF_CODE' => $data['status'],
                ]
            ])->fetch();

            if (!$status) {
                $result->addError(
                    new Error('Status not found.')
                );

                return $result;
            }

            $statusId = (int)$status['ID'];
        }

        $updatedCar = CarTable::update($id, [
//            'UF_MODEL' => $data['model'] ?? $car['UF_MODEL'],
//            'UF_YEAR' => $data['year'] ?? $car['year'],
//            'UF_VIN' => $data['vin'] ?? $car['UF_VIN'],
            'UF_STATUS' => $statusId ?? $car['UF_STATUS'],
            'UF_PRICE_PER_DAY' => $data['price_per_day'] ?? $car['UF_PRICE_PER_DAY'],
        ]);

        if ($updatedCar->isSuccess()) {
//            echo ("Запись c id =" . $car['ID'] . " в БД обновлена");
            $result->setData([
                'model' => $car['UF_MODEL'],
                'year' => $car['UF_YEAR'],
                'vin' => $car['UF_VIN'],
                'status' => $data['status'] ?? $car['UF_STATUS'],
                'price_per_day' => $data['price_per_day'] ?? $car['UF_PRICE_PER_DAY'],
            ]);
        } else {
            $result->addErrors($updatedCar->getErrors());
        }

        return $result;
    }

    public function delete(int $id): Result
    {
        $result = new Result();
        if (empty($id) || $id <= 0) {
            $result->addError(new Error('Id is required and should be greater than 0.'));
            return $result;
        }

        //todo (проверять будущие бронирования)

        $result = CarTable::delete($id);

        return $result;
    }



}