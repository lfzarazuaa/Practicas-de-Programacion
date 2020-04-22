<?php
    namespace App\Models;
    use Illuminate\Database\Eloquent\Model;
    //require_once 'BaseElement.php';
    
    class Job extends Model{
        protected $table = 'jobs';

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
            $cadena = 'Duración del trabajo: ' . ($years>0? $years . $stryears : '') . ($extraMonths>0? $extraMonths . $strmonths : '');
            return $cadena;
        }
        
    }

    // class Job extends BaseElement{
        
    //     public function __construct($titulo,$descripcion){
    //         $newTitle='Trabajo: ' . $titulo;
    //         parent::__construct($newTitle, $descripcion);
    //     }

    //     function getDurationAsString(){
    //         $years = floor($this->months/12);
    //         $extraMonths = $this->months%12;
    //         $stryears = $years!=1?" años ":" año ";
    //         $strmonths = $extraMonths!=1?" meses ":" mes ";
    //         $cadena = 'Duración del trabajo: ' . ($years>0? $years . $stryears : '') . ($extraMonths>0? $extraMonths . $strmonths : '');
    //         return $cadena;
    //     }
        
    // }
?>