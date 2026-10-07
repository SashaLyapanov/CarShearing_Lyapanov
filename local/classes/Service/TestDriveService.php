<?php

namespace Service;

use Bitrix\Main\Error;
use Bitrix\Main\ORM\Fields\Relations\Reference;
use Bitrix\Main\ORM\Query\Join;
use Bitrix\Main\Result;
use Bitrix\Main\Type\DateTime;
use Models\CarTable;
use Models\StatusTable;
use Models\TestDrivesTable;

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

        $carService = new CarService();
        $car = $carService->getCar($carId);

        if ($car['STATUS_CODE'] === 'repair') {
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
//        $dayRentQuantity = ($dateEnd->getTimestamp() - $dateStart->getTimestamp()) / 86400;
        $dayRentQuantity = $dateStart->getDiff($dateEnd)->days;

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


    public function getAllTestDrives(): Result
    {
        $result = new Result();

        $testDrives = TestDrivesTable::getList([
            'select' => [
                'ID',
                'UF_DATE_START',
                'UF_DATE_END',
                'UF_TOTAL_COST',

                'CAR_NAME' => 'CAR.UF_MODEL',
            ],
        ])->fetchAll();

        $items = [];

        foreach ($testDrives as $testDrive) {
            $items[] = [
                'ID' => $testDrive['ID'],
                'CAR_NAME' => $testDrive['CAR_NAME'],
                'UF_DATE_START' => $testDrive['UF_DATE_START']->format('Y-m-d H:i:s'),
                'UF_DATE_END' => $testDrive['UF_DATE_END']->format('Y-m-d H:i:s'),
            ];
        }

        $result->setData([
            'testDrives' => $items,
            ]
        );

        return $result;
    }

}