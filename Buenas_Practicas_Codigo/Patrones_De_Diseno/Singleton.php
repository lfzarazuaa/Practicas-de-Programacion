<?php
    //Definir propiedades o métodos estáticos nos permiten crear métodos y propiedades
    // que son accesibles sin la necesidad de instanciar una clase.
    //Recordar que estos métodos no serán únicos para cada instancia,
    // es decir que si ustedes de alguna forma modifican la propiedad estática,
    //esta será cambiada para todos los objetos (global compartida entre todas las clases del mismo tipo).
    class Singleton{
        private static $theInstance = null;//Declara el dato como estatico y en nulo asegurando solo una variable para esta clase.
        public static function getInstance(){//Método para crear la instancia o hacer la petción para obtenerla.
            if ( self::$theInstance === null ) {//Si no ha sido creada.
                self::$theInstance = new self();//Le pasa como parámetro la clase misma.
            }
            return self::$theInstance;//Regresa la clase misma como un objeto único.
        }

        private function __contruct(){//Constructor de la clase que solo puede ser llamado por getInstance.
            // code..
        }
    }

    //Muchos nos habremos topado con la disyuntiva:
    //¿Por qué aplicar un diseño singleton si puedo hacerlo a través de una clase estática (Ej… en C#)?. 
    // En mi experiencia un motivo es que los objetos singleton se pueden pasar como parámetros a métodos y
    // otro es que las clases en diseño singleton pueden implementar interfaces, lo cual no es posible con
    // las clases estáticas.
?>