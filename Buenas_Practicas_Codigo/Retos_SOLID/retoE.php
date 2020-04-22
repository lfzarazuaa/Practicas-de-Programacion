<?php
    //Problema: No respeta el principio de Inversión de dependencias al no recibir un Interfaz sino un tipo de clase en concreto en el constructor.
    //Solución: Cambiar el constructor para que reciba una interfaz de IManzano y que la clase Manzano la implemente.
    class Manzano
    {
        private $manzanas = [];

        public function getManzanas()
        {
            return $this->manzanas;
        }
    }

    class ContadorDeManzanas
    {
        private $manzano;

        public function __contsruct(Manzano $manzano)
        {
            $this->manzano = $manzano;
        }

        public function cuantas()
        {
            return count($this->manzano->getManzanas());
        }
    }
?>