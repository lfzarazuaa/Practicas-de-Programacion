<?php
    namespace App\Models;
    use Illuminate\Database\Eloquent\Model;
    //require_once 'BaseElement.php' ;

    class Project extends Model{
        protected $table = 'projects';

        public function setValues($datos){
            $this->attributes['title'] = $datos['title'];
            $this->attributes['description'] = $datos['description'];
            $this->attributes['months'] = $datos['months'];
            $this->attributes['visible'] = true;
        }
        
        function getDurationAsString(){
            $years = floor($this->months/12);
            $extraMonths = $this->months%12;
            $stryears = $years!=1?" años ":" año ";
            $strmonths = $extraMonths!=1?" meses ":" mes ";
            $cadena = 'Duración del proyecto: ' . ($years>0? $years . $stryears : '') . ($extraMonths>0? $extraMonths . $strmonths : '');
            return $cadena;
        }
    }
    
?>