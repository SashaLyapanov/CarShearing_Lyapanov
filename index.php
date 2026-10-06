<?php

require $_SERVER['DOCUMENT_ROOT']
    . '/bitrix/header.php';

$APPLICATION->SetTitle('Бронирование автомобилей');

$APPLICATION->IncludeComponent(
	"testComponents:listing.cars", 
	".default", 
	[
		"COMPONENT_TEMPLATE" => ".default"
	],
	false
);

require $_SERVER['DOCUMENT_ROOT']
. '/bitrix/footer.php';

