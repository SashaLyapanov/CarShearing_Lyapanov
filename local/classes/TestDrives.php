<?php

class TestDrives {

    private int $id;

    private string $model;

    private int $year;

    private string $vin;

    private Status $status;

    private int $price_per_day;

    function __construct($id, $model, $year, $vin, $price_per_day)
    {
        $this->id = $id;
        $this->model = $model;
        $this->year = $year;
        $this->vin = $vin;
        $this->price_per_day = $price_per_day;
    }

}