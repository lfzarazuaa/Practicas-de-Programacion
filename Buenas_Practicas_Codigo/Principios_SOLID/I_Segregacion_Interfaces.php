<?php
    //Ejemplo no aplicando el principio de segregación de interfaces.
    interface Workable 
    {
        public function canCode();//Función de más.
        public function code();//Función reemplazable en otra interfaz.
        public function test();//Función reemplazable en otra interfaz.
    }

    class Programmer implements Workable //Implementa a Workable.
    {
        public function canCode()
        {
            return true;
        }

        public function code()
        {
            return 'coding';
        }

        public function test()
        {
            return 'testing in localhost';
        }
    }

    class Tester implements Workable
    {
        //La función canCode sirve para describir al objeto lo cual puede hacerse mediante una interfaz.
        public function canCode()
        {
            return false;
        }
        //La función code no tiene ninguna funcionalidad
        public function code()
        {
            throw new Exception("Opps! I can\'t code");
        }

        public function test()
        {
            return 'testing in test server';
        }
    }

    class ProjectManagment
    {
        public function processCode(Workable $member)
        {
            if ($member->canCode()) {//Primero debe verficar un método repetitivo (se declara en cada workable) antes de poderlo ejecutar. 
                echo $member->code();//
            }
        }
    }
    
    //Ejemplo aplicando el principio de segregación de interfaces.
    interface CodeAble 
    {
        public function code();//Declaración de una sola función para codificar.
    }

    interface testAble 
    {
        public function test();//Declaración de una sola función para programar.
    }

    class ProgrammerI implements CodeAble, TestAble
    {
        public function code()
        {
            return 'coding';
        }

        public function test()
        {
            return 'testing in localhost';
        }
    }
    
    class TesterI implements CodeAble
    {
        public function code()
        {
            return 'coding';
        }
    }

    class ProjectManagmentI
    {
        public function processCode(CodeAble $member)//En el mismo tipo se verifica si soporta procesar código.
        {
                echo $member->code();
        }
    }

    $testerguy = new Tester();
    $programerguy = new Programmer();
    $manager = new ProjectManagment();
    $manager->processCode($testerguy);
    $manager->processCode($programerguy);
    
    $testerguyI = new TesterI();
    $programerguyI = new ProgrammerI();
    $managerI = new ProjectManagmentI();

    $managerI->processCode($testerguyI);
    $managerI->processCode($programerguyI);

?>