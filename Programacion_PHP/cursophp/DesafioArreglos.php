<?php
    $arreglo = [
        'keyStr1' => 'lado',
        0 => 'ledo',
    
        'keyStr2' => 'lido',
        1 => 'lodo',
        2 => 'ludo'
    ];
    $narreglo[0]=$arreglo['keyStr1'];
    $narreglo[1]=$arreglo[0];
    $narreglo[2]=$arreglo['keyStr2'];
    for ($indice=0; $indice < 2; $indice++) {
        $narreglo[$indice+3]=$arreglo[$indice+1];
    }
    for ($indice=0; $indice < 5; $indice++) { 
        echo "$narreglo[$indice], ";
    }
    echo '<p>decirlo al revés lo dudo.</p>';
    while($indice>0)
    { 
        $indice--;
        echo "$narreglo[$indice], ";
    }
    echo '<p>¡Qué trabajo me ha costado!</p>';
    //Ejercicio 1 versión B.
    foreach ($arreglo as $value) { 
        echo "$value, ";
    }
    echo '<p>decirlo al revés lo dudo.</p>';
    arsort($arreglo);
    foreach ($arreglo as $value) { 
        echo "$value, ";
    }
    echo '<p>¡Qué trabajo me ha costado!</p>';
    
    //Ejercicio 2
    $Paises=[
        'Mexico' => ['Distro Federal', 'Guadalajara', 'Monterrey'],
        'Estados Unidos' => ['Detroit', 'Houston', 'Los Angeles'],
        'Alemania' => ['Berlin', 'Hamburgo', 'Fankfurt'],
        'Brasil' => ['Rio de Janeiro', 'Bahia', 'Brasilia'],
        'Italia' => ['Roma', 'Venecia', 'Milan'],
    ];

    foreach ($Paises as $pais => $Ciudades) {
        echo "<p> <b>$pais</b>: ";
        foreach ($Ciudades as $ciudad) {
            echo "$ciudad, ";
        }
        echo "<p>";
    }
    //Ejercicio 3
    $valores = [23, 54, 32, 67, 34, 78, 98, 56, 21, 34, 57, 92, 12, 5, 61];

    $indice=0;
    sort($valores);
    echo "<p>valores menores:";
    for ($i=0; $i < 3; $i++)
    {
        echo "$valores[$i]\n";
    }
    echo "</p> <p>valores mayores:";
    $ca=count($valores)-1;
    for ($i=0; $i < 3; $i++)
    {
        $num=$valores[$ca-$i];
        echo "$num\n";
    }
    echo '<p>';
?>

