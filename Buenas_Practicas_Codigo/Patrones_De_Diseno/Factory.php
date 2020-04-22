<?php 
    //Clase que se quiere crear.
    class Automobile {

        private $vehicleMake;
        private $vehicleModel;

        public function __construct($make, $model) {
            $this->vehicleMake = $make;
            $this->vehicleModel = $model;
        }

        public function getMakeAndModel() {
            return $this->vehicleMake.' - '.$this->vehicleModel;
        }
    }

    //Clase auxiliar para crear instancias de la clase que se quiere crear (Automobile) con los parámetros por defecto que se quieran.
    class AutomobileFactory {

        private static $model;

        public static function create($make) {
            self::$model = date('Y');
            return new Automobile($make, self::$model);
        }
    }

    //Generación de objetos.
    $renault = new Automobile("Renault", 2019);
    $toyota = AutomobileFactory::create("Toyota");//Ayuda a que si la clase cambia de nombre o tiene clases hijas solo con cambiar está clase se modifican todas las instancias.

    //Impresión de resultados.
    echo $renault->getMakeAndModel().PHP_EOL;
    echo $toyota->getMakeAndModel().PHP_EOL;
?>