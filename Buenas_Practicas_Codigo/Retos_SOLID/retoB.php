<?php
    //Problema: No cumple con el principio abierto-cerrado ya que para agregar una nueva clase además de generarla se debe módificar la clase ProjectManagment.
    //Solución: Implementar que la función proccess de Project Managment requiera cumplir con una interfaz.
    class Programmer
    {
        public function code()
        {
            return 'coding';
        }
    }
    class Tester
    {
        public function test()
        {
            return 'testing';
        }
    }
    class ProjectManagement
    {
        public function process($member)
        {
            if ($member instanceof Programmer) {
                $member->code();
            } elseif ($member instanceof Tester) {
                $member->test();
            };
            throw new Exception('Invalid input member');
        }
    }
?>