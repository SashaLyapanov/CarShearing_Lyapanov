<?php

use Bitrix\Main\ORM\Fields\DateField;
use Bitrix\Main\ORM\Fields\IntegerField;
use Bitrix\Main\ORM\Fields\Relations;

class TestDrivesTable
{

    public static function getTableName(): string
    {
        return 'b_test_drives';
    }

    public static function getMap(): array
    {
        return [
            (new IntegerField('ID'))
                ->configurePrimary(true)
                ->configureAutocomplete(true),

            (new IntegerField('UF_CAR'))
                ->configureTitle('UF_CAR')
                ->configureRequired(true),

            (new DateField('UF_DATE_START'))
                ->configureTitle('UF_DATE_START')
                ->configureRequired(true),

            (new DateField('UF_DATE_END'))
                ->configureTitle('UF_DATE_END')
                ->configureRequired(true),

            (new Relations\Reference(
                'UF_CAR',
                CarTable::class,
                Join::on('this.UF_CAR', 'ref.ID'),
            ))->configureJoinType('left')
        ];
    }

}