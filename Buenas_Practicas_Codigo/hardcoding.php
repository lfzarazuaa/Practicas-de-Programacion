<?php

    $precioInicial = $argv[1];
    $precioConIVA = $precioInicial * 1.21;

    echo "Valor del IVA: 21%".PHP_EOL;
    echo "Sin IVA: \$$precioInicial, con IVA: \$$precioConIVA".PHP_EOL;
    
?>