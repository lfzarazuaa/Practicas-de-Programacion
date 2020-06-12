<?php
    require_once("account.php");
    require_once("car.php");

    $car = new Car("AMS234", new Account("Andres Herrera", "ANDA876"));
    $car->printDataCar();
?>