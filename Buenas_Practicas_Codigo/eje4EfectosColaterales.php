<?php
    $nombre = 'Mauro';
    $edad = 18;

    imprimirDatos();

    if ( esMayorDeEdad( $edad ) ) {

        echo 'Es mayor!';
    }

    function esMayorDeEdad( int $edad )
    {
        return $edad > 18;
    }

    function imprimirDatos()
    {
        GLOBAL $edad, $nombre;

        echo "$nombre: $edad";
        $edad++;
    }
?>