<?php
    require_once("account.php");

    class Car{
        public $id;
        public $license;
        public $driver;
        public $passenger;
        public $password;

        public function __construct(String $license,Account $driver)
        {
            $this->license=$license;
            $this->driver=$driver;
        }

        public function printDataCar()
        {
            echo "License: $this->license";
            echo " Driver: " . $this->driver->name;
        }
    }
?>