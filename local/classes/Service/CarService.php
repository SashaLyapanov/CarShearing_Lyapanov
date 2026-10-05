<?php

namespace Service;

use Bitrix\Main\Error;
use Bitrix\Main\Result;
use Local\Entity\CarTable;
use Local\Entity\StatusTable;
use Local\Entity\TestDriveTable;

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
            $result->addError(new Error('Model already exists.'));
            return $result;
        }

        $status = StatusTable::getList([
            'select' => ['ID'],

            'filter' => [
                '=UF_NAME' => $data['status'],
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
            'id' => $addResult->getData(),
        ]);


        return new Result();
    }
}