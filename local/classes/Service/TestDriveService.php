<?php

namespace Service;

use Bitrix\Main\Error;
use Bitrix\Main\Result;

use Bitrix\Main\Type\DateTime;
use Entity\CarTable;
use Entity\StatusTable;
use Entity\TestDrivesTable;

class TestDriveService
{

    public static function create(int $carId, array $data): Result
    {
        //Находим авто
        // +  Смотрим, чтобы авто не был на ТО
        //Смотрим, чтобы данный авто не имел бронирований на указанные даты в $data
        //Если все гуд, то создаем бронирование и рассчитываем стоимость по формуле $car.cost_per_day * (endData-startDate)

        $result = new Result();

        if ($carId <= 0 || empty($carId)) {
            $result->addError(new Error("You should choose some car."));
            return $result;
        }

        //Проверяем, что пользователь заполнил даты бронироваия
        //Если не заполнил, то не получится вычислить стоимость и забронировать, поэтому отказ
        if (empty($data['UF_DATE_START']) || empty($data['UF_DATE_END'])) {
            $result->addError(new Error("You should choose some date."));
            return $result;
        }


        $car = CarTable::getById($carId)->fetch();

        if (!$car) {
            $result->addError(new Error("Car not found."));
            return $result;
        }

        $status = StatusTable::getById(
            $car['UF_STATUS']
        )->fetch();

        if (!$status) {
            $result->addError(new Error("Status not found."));
            return $result;
        }

        if ($status['UF_CODE'] === 'repair') {
            $result->addError(new Error("Car is repair and could not be rent."));
            return $result;
        }

        //Вот тут проверяем, нет ли у автомобиля пересечений по бронированиям.
        $dateStart = new DateTime(
            $data['UF_DATE_START'],
            'Y-m-d H:i:s'
        );

        $dateEnd = new DateTime(
            $data['UF_DATE_END'],
            'Y-m-d H:i:s'
        );

        $existingBooking = TestDrivesTable::getList([
            'select' => ['ID'],

            'filter' => [
                '=UF_CAR' => $carId,
                '<UF_DATE_START' => $dateEnd,
                '>UF_DATE_END' => $dateStart,
            ],
            'limit' => 1,
        ])->fetch();

        if ($existingBooking) {
            $result->addError(new Error("Car has already testDrive on choosing dates and could not be rent."));
            return $result;
        }

        // Количество дней (переводим из секунд в дни
        $dayRentQuantity = ($dateEnd->getTimestamp() - $dateStart->getTimestamp()) / 86400;

        if ($dayRentQuantity <= 0) {
            $result->addError(new Error("Start day later end day."));
            return $result;
        }

        $totalCost = (int)$car['UF_PRICE_PER_DAY'] * $dayRentQuantity;

        if ($totalCost < 0) {
            $result->addError(new Error("Car price is less than zero."));
            return $result;
        }

        $createdTestDrive = TestDrivesTable::add([
            'UF_CAR' => $carId,
            'UF_DATE_START' => $dateStart,
            'UF_DATE_END' => $dateEnd,
            'UF_TOTAL_COST' => $totalCost,
        ]);

        if (!$createdTestDrive->isSuccess()) {
            $result->addErrors($createdTestDrive->getErrors());
            return $result;
        }

        $result->setData([
            'ID' => $createdTestDrive->getId(),
            'UF_CAR' => $carId,
            'UF_DATE_START' => $dateStart,
            'UF_DATE_END' => $dateEnd,
            'UF_TOTAL_COST' => $totalCost,
            'dayRentQuantity' => $dayRentQuantity,
            'pricePerDay' => (int)$car['UF_PRICE_PER_DAY'],
        ]);

        return $result;
    }

}