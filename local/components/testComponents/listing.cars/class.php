<?php

use Bitrix\Main\ORM\Fields\Relations\Reference;
use Bitrix\Main\ORM\Query\Join;

use Models\CarTable;
use Models\TestDrivesTable;

if (!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true) {
    die();
}

class TestDrivesListComponent extends CBitrixComponent
{

    //Можно и напрямую через UF_CAR, которая уже есть в TestDrivesTable без runtime
    public function executeComponent()
    {
        $queryResult = TestDrivesTable::getList([
            'select' => [
                'ID',
                'UF_DATE_START',
                'UF_DATE_END',

                'CAR_NAME' => 'CAR.UF_MODEL',
            ],
            'order' => [
                'ID' => 'ASC',
            ],
        ]);

        $this->arResult['ITEMS'] = [];

        while ($testDrive = $queryResult->fetch()){
            $this->arResult['ITEMS'][] = [
                'ID' => $testDrive['ID'],
                'UF_DATE_START' => $testDrive['UF_DATE_START']->format('Y-m-d H:i:s'),
                'UF_DATE_END' => $testDrive['UF_DATE_END']->format('Y-m-d H:i:s'),
                'CAR_NAME' => $testDrive['CAR_NAME'],
            ];
        }

        $this->includeComponentTemplate();

    }

    private function initResult(): void
    {

    }


}