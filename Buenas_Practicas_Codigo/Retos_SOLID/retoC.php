<?php
    //Problema: No cumple con el principio de susbtitución de Liskov al no realizar Dog lo mismo que su clase padre.
    //Solución: Quitarle a Animal el método fly, agregar una interfaz FlyerAnimal y en otra clase que asi lo requiera implementarla.
    class Animal
    {
        public function fly()
        {
        }
    }

    class Dog extends Animal
    {
        public function fly()
        {
            if (! $this->hasWings) {
                throw new Exception;
            }
        }
    }
?>