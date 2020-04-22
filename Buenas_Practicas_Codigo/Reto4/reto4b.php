<?php
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
                return $member->code();
            } elseif ($member instanceof Tester) {
                return $member->test();
            }
            else {
                throw new Exception('Invalid input member');
            }
        }
    }

    $programador = new Programmer();
    $probador = new Tester();
    $manejador = new ProjectManagement();
    echo $manejador->process($programador). "\n";
    echo $manejador->process($probador). "\n";
    try {
        $manejador->process('Mi String');
    } catch (Exception $ex) {
        echo "Error";
    }
?>