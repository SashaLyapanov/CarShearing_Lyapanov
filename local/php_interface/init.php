<?php

use Bitrix\Main\Loader;

try {
    Loader::registerAutoLoadClasses(null, [
        'Entity\\CarTable' => '/local/classes/Entity/CarTable.php',

        'Entity\\StatusTable' => '/local/classes/Entity/StatusTable.php',

        'Entity\\TestDrivesTable' => '/local/classes/Entity/TestDrivesTable.php',

        'Service\\CarService' => '/local/classes/Service/CarService.php',

        'Service\\TestDriveService' => '/local/classes/Service/TestDriveService.php',
    ]);
} catch (\Bitrix\Main\LoaderException $e) {
    echo $e->getMessage();
}