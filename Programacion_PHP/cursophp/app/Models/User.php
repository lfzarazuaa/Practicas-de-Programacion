<?php
    namespace App\Models;
    use Illuminate\Database\Eloquent\Model;
    //require_once 'BaseElement.php';
    
    class User extends Model{
        protected $table = 'users';

        public function setValues($datos){
            $this->attributes['email'] = $datos['email'];
            $this->attributes['password'] = password_hash($datos['password'],PASSWORD_DEFAULT);
        }
    }
?>