<?php

use Service\CarService;

require $_SERVER['DOCUMENT_ROOT']
    . '/bitrix/modules/main/include/prolog_before.php';

header('Content-Type: application/json; charset=UTF-8');

$carId = (int)($_GET['carId'] ?? 0);

$result = (new Service\CarService)->delete($carId);

if (!$result->isSuccess()) {
    http_response_code(400);

    echo json_encode([
        'success' => false,
        'error' => $result->getErrorMessages(),
    ], JSON_UNESCAPED_UNICODE);

    exit;
}

echo json_encode([
    'success' => true,
    'data' => $result->getData(),
], JSON_UNESCAPED_UNICODE);