<?php
    class User
    {
        function clientInfo()
        {
            return 'Parámetros del cliente';
        }

        function ValidateUser( $user, $password )
        {
            $nombreUsuario = "user1";
            $nombrePassword = "onePlayer";

            if ($user==$nombreUsuario && $password==$nombrePassword)
                return true;
            else
                return false;
        }

        function bringUser( $id )
        {
            $idBd=count('sql where id= $id');
            if ($id==$idBd)
                return [$nombre, $edad];
            else
                return '';
        }
    }
    
?>