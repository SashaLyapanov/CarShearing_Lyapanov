<?php

use Bitrix\Main\Loader;

try {
    Loader::registerAutoLoadClasses(null, [
        'Local\\HighLoadBlockHelper' => '/local/classes/HighloadBlockHelper.php',

        'Local\\Car' => '/local/classes/Car.php',

        'Local\\TestDrive' => '/local/classes/TestDrive.php',
    ]);
} catch (\Bitrix\Main\LoaderException $e) {
    echo $e->getMessage();
}

