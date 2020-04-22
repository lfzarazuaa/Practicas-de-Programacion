<?php

    require_once __DIR__.'/config.inc.php';//Constante al directorio actual de la configuración y nombre del archivo.
    $configs=$cfg;
    $precioInicial = $argv[1];//Obtener el argumento 1 de entrada de la consola.
    $precioConIVA = $precioInicial * ( 1 + $configs['valor_iva'] / 100 );//Calculo del precio con IVA.

    echo "Valor del IVA: {$configs['valor_iva']}%".PHP_EOL;
    echo "Sin IVA: \$$precioInicial, con IVA: \$$precioConIVA".PHP_EOL;

?>