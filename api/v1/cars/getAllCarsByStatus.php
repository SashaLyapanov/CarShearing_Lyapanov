<?php

use Service\CarService;

require $_SERVER['DOCUMENT_ROOT']
    . '/bitrix/modules/main/include/prolog_before.php';

header('Content-Type: application/json; charset=UTF-8');

$params = [];

$statusCode = (string)($_GET['statusCode'] ?? null);

if ($statusCode) {
    $params['statusCode'] = $statusCode;
}

$result = (new Service\CarService)->getCars($params);

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