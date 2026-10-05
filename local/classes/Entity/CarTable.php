<?php

use Bitrix\Main\ORM\Fields\IntegerField;
use Bitrix\Main\ORM\Fields\StringField;

class CarTable
{

    public static function getTableName(): string
    {
        return 'b_cars';
    }

    public static function getMap(): array
    {
        return [
            (new IntegerField('ID'))
                ->configurePrimary(true)
                ->configureAutocomplete(true),

            (new StringField('UF_MODEL'))
                ->configureTitle('UF_MODEL')
                ->configureRequired(true),

            (new IntegerField('UF_YEAR'))
                ->configureTitle('UF_YEAR'),

            (new StringField('UF_VIN'))
                ->configureTitle('UF_VIN')
                ->configureRequired(true)
                ->configureUnique(true),

            (new IntegerField('UF_STATUS'))
                ->configureTitle('UF_STATUS')
                ->configureRequired(true),

            (new IntegerField('UF_PRICE_PER_DAY'))
                ->configureTitle('UF_PRICE_PER_DAY')
                ->configureRequired(true),

            (new \Bitrix\Main\ORM\Fields\Relations\Reference(
                'UF_STATUS',
                StatusTable::class,
                Join::on('this.UF_STATUS', 'ref.ID')
            ))->configureJoinType('left'),
        ];
    }
}