<?php
require_once("car.php");
class UberPool extends Car
{
    public $brand;
    public $model;

    public function __construct(String $name, Account $driver, String $brand, String $model)
    {
        parent::__construct($license, $driver);
        $this->brand = $brand;
        $this->driver = $driver;
    }
}
    
?>