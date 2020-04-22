<?php
    namespace App\Models;
    
    class BaseElement implements Printable{
        public $title;
        public $description;
        public $visible;
        public $months;
        
        public function __construct($titulo,$descripcion){
            $this->setTitle($titulo);
            $this->description = $descripcion;
            $this->visible = true;
        }

        public function setTitle($titulo){
            if ($titulo=='') {
                $this->title='N/A';
            } else {
                $this->title = $titulo;
            }
        }

        public function getTitle(){
            return $this->title;
        }

        function getDurationAsString(){
            $years = floor($this->months/12);
            $extraMonths = $this->months%12;
            $stryears = $years!=1?" años ":"año ";
            $strmonths = $extraMonths!=1?" meses ":"mes ";
            $cadena = ($years>0? $years . $stryears : '') . ($extraMonths>0? $extraMonths . $strmonths : '');
            return $cadena;
        }
        
        public function getDescription(){
            return $this->description;
        }
    }
?>