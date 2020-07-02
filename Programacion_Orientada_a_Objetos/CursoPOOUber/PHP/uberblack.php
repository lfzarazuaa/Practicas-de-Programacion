<?php
require_once("car.php");
class UberBlack extends Car
{
    public $typeCarAcepted;
    public $seatsMaterial;

    public function __construct(String $name, Account $driver, $typeCarAcepted, $seatsMaterial)
    {
        parent::__construct($license, $driver);
        $this->typeCarAcepted = $typeCarAcepted;
        $this->seatsMaterial = $seatsMaterial;
    }
}
    
?>