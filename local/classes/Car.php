<?php

class Car
{
    private int $id;

    private string $name;

    private string $code;

    function __constructot($id, $name, $code) {
        $this->id = $id;
        $this->name = $name;
        $this->code = $code;
    }

}