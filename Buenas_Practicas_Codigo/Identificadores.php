<?php
    
    for ($i=0; $i < 20; $i++) {
        $r = fibonacci($i);
        echo "fib($i) = $r, ";
    }
    $r = fibonacci($i++);
    echo "fib($i) = $r ";

    #region Identificadores en Funciones
        //Función declarada sin Identificadores.
        function f(int $a): int
        {
            if ($a==0 || $a==1){
                return $a;
            }  
            else {
                return f($a-1) + f($a-2);
            }
        }

        //Función declarada con Identificadores.
        function fibonacci(int $elemento): int
        {
            if ($elemento==0 || $elemento==1){
                return $elemento;
            }
            elseif ($elemento==2){
                return 1;
            }
            else{
                return 2*fibonacci($elemento-2)+fibonacci($elemento-3);
            }
        }
    #endregion

    #region Identificadores en funciones
        //Función sin identificadores.
        function f1(int $a, int $b) : float{
            return ($a * $b) / 2;
        }

        //Función con Identificadores para calcular el área de un triangulo.
        
         /* 
         * Regresa el area de un triangulo conociendo su base y su altura.
         * @param int $base Base del triangulo.
         * @param int $altura Altura del triangulo
         */
        function areaTriangulo(int $base, int $altura) : float{
            return ($base * $altura) / 2;
        }
        
        //Función con Identificadores que no dicen mucho.
        function calcular(int $base, int $altura) : float{
            return ($base * $altura) / 2;
        }

        //Función con Identificadores incorrecto y confuso (debido a la evolución del código).
        function areaReactangulo(int $base, int $altura) : float{
            return ($base * $altura) / 2;
        }
    #endregion
?>
