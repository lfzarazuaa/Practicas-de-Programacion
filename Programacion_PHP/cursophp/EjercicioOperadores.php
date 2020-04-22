<?php
    //Ejercicio 1
    $res = 32+3;
    echo '32+3='.$res;
    $res = 3*(2+3);
    echo ' <br>3(2+3)='.$res;
    //Ejercicio 2
    // $valor es mayor que 5 pero menor que 10
    // $valor es mayor o igual a 0 pero menor o igual a 20
    // $valor es igual a “10” asegurando que el tipo de dato sea cadena
    // $valor es mayor a 0 pero menor a 5 o es mayor a 10 pero menor a 15
    $valor=rand(1,25);
    echo '<br>El valor es: ' . $valor; 
    if ($valor>5 and $valor<10) {
        echo '<br>Valor cumple la primera condición.';
    } else {
        echo '<br>Valor no cumple la primera condición.';
    }
    if ($valor>=0 && $valor<=20) {
        echo '<br>Valor cumple la segunda condición.';
    } else {
        echo '<br>Valor no cumple la segunda condición.';
    }
    if ($valor==="10") {
        echo '<br>Valor cumple la tercera condición.';
    } else {
        echo '<br>Valor no cumple la tercera condición.';
    }
    if ($valor>0 and $valor<5 || $valor>10 and $valor<15) {
        echo '<br>Valor cumple la cuarta condición.';
    } else {
        echo '<br>Valor no cumple la cuarta condición.';
    } 
?>