<?php

namespace Models;

use Bitrix\Main\ORM\Data\DataManager;
use Bitrix\Main\ORM\Fields\DatetimeField;
use Bitrix\Main\ORM\Fields\IntegerField;
use Bitrix\Main\ORM\Fields\Relations;
use Bitrix\Main\ORM\Query\Join;

class TestDrivesTable extends DataManager
{

    public static function getTableName(): string
    {
        return 'test_drives';
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

            (new DatetimeField('UF_DATE_START'))
                ->configureTitle('UF_DATE_START')
                ->configureRequired(true),

            (new DatetimeField('UF_DATE_END'))
                ->configureTitle('UF_DATE_END')
                ->configureRequired(true),

            (new IntegerField('UF_TOTAL_COST'))
                ->configureTitle('UF_TOTAL_COST')
                ->configureDefaultValue(0),

            (new Relations\Reference(
                'CAR',
                CarTable::class,
                Join::on('this.UF_CAR', 'ref.ID'),
            ))->configureJoinType('left')
        ];
    }

}