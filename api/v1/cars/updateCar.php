<?php

use Service\CarService;

require $_SERVER['DOCUMENT_ROOT']
    . '/bitrix/modules/main/include/prolog_before.php';

header('Content-Type: application/json; charset=UTF-8');

$carId = (int)($_GET['carId'] ?? 0);

if ($carId <= 0) {
    http_response_code(400);
    echo json_encode([
        'success' => false,
        'error' => 'Car id is required'
    ]), JSON_UNESCAPED_UNICODE;

    exit;
}

$rawBody = file_get_contents('php://input');

$data = json_decode($rawBody, true);

if (!is_array($data)) {
    http_response_code(400);

    echo json_encode([
        'success' => false,
        'error' => ['Invalid JSON'],
    ], JSON_UNESCAPED_UNICODE);

    exit;
}

$carService = new CarService();

$result = $carService->update($carId, $data);

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