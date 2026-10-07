<?php

use Bitrix\Main\Loader;

try {
    Loader::registerAutoLoadClasses(null, [
        'Models\\CarTable' => '/local/classes/Models/CarTable.php',

        'Models\\StatusTable' => '/local/classes/Models/StatusTable.php',

        'Models\\TestDrivesTable' => '/local/classes/Models/TestDrivesTable.php',

        'Service\\CarService' => '/local/classes/Service/CarService.php',

        'Service\\TestDriveService' => '/local/classes/Service/TestDriveService.php',
    ]);
} catch (\Bitrix\Main\LoaderException $e) {
    echo $e->getMessage();
}