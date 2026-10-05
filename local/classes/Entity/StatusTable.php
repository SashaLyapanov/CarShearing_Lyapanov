<?php

use Bitrix\Main\ORM\Data\DataManager;
use Bitrix\Main\ORM\Fields\IntegerField;
use Bitrix\Main\ORM\Fields\StringField;

class StatusTable extends DataManager
{

    public static function getTableName(): string
    {
        return 'b_statuses';
    }

    public static function getMap(): array
    {
        return [
            (new IntegerField('ID'))
                ->configurePrimary(true)
                ->configureAutocomplete(true),
            
            (new StringField('UF_NAME'))
                ->configureTitle('UF_NAME')
                ->configureRequired(true),

            (new StringField('UF_CODE'))
                ->configureTitle('UF_CODE')
                ->configureRequired(true),
        ];
    }
}