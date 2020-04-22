<?php

    for ($i = 0; $i < $total; $i++) {
        $rows = oci_fetch_array($rss, OCI_NUM);
        $empl_num = $rows[0];
        $nombre = $rows[1];
        $apaterno = $rows[2];
        $amaterno = $rows[3];
        $fecha = $rows[4];
        $hora = $rows[5];
        $horario = $rows[6];

        $empl_num = str_replace("?", 'Ñ', $empl_num);
        $nombre = str_replace("?", 'Ñ', $nombre);
        $apaterno = str_replace("?", 'Ñ', $apaterno);
        $amaterno = str_replace("?", 'Ñ', $amaterno);
        $fecha = str_replace("?", 'Ñ', $fecha);

        $trabajo = '14:00:00';//Variable hardcodeada.

        if ($hora < $trabajo) {
            $horaentrada = $hora;
            $horae = $horaentrada;
            $horas = '00:00:00';//Hora hardcodeada.
        } else {
            $horasalida = $hora;
            $horae = '00:00:00';
            $horas = $horasalida;
        }
        
        $horae = str_replace("?", 'Ñ', $horae);//Uso de recursividad.
        $horas = str_replace("?", 'Ñ', $horas);
        $horario = str_replace("?", 'Ñ', $horario);

        echo "$empl_num, $nombre, $apaterno, $amaterno, $fecha, $horae, $horas, $horario".PHP_EOL;
    }