<?php

     $v = new Vehiculo();
     $s = new Scooter();//Scooter es realmente un vehiculo o le corresponde una relación que no sea de herencia.
     $vel = 150;
     //Para un corecto funcionamiento S debe tener el mismo funcionamiento que V.
     //Solo se puede añadir comportamiento no para modicar el ya existente.
     avanzarVehiculo($v, $vel);

     avanzarVehiculo($s, $vel);//Al ejecutarse no se está haciendo un buen manejo de la herencia ya que está sobrescribiendo el método del padre.

    function avanzarVehiculo(Vehiculo $v, int $vel)
    {
        $v->avanzar($vel);
    }

    class Vehiculo
    {
        private $position = 0;

        public function avanzar(int $velocidad)
        {
            if ($velocidad <0 || $velocidad >200)
            {
                throw new OutOfBoundsException();
            }

            $this->position += $velocidad;
        }
    }

    class Scooter extends Vehiculo
    {
        private $position = 0;
        //Se sobrescribe el método violoando el principio de substitución de Liskov.
        public function avanzar(int $velocidad)
        {
            if ($velocidad > 100)
            {
                throw new OutOfBoundsException();
            }

            $this->position += $velocidad;
        }
    }
?>