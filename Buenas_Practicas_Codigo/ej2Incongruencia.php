<?php
    if (isset($_GET['p']))
        $p = $_GET['p'];
    else
        $p = 1;

    $t = '';
    if (isset($_GET['t']))
        $t = $_GET['t'];
    else if(isset($_GET['codigo']))
        $t = $_GET['codigo'];
    else if(isset($_POST['TxtBuscar']))
        $t = $_POST['TxtBuscar'];

    if (!empty($_POST['TxtBuscar'])) {

        $cadena = $valor[0];
    }