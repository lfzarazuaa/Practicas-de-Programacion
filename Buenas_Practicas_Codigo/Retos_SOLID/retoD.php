<?php
    //Problema: Error al no alicar segregación de interfaz, ya que el consultor no puede realizar un método en específico.
    //Solución Separar en 3 Interfaces la interfaz Underling Interface para evitar posibles errores y al momento de construir ver si es del tipo de interfaz compuesto.
    interface UnderlingInterface
    {
        public function program();

        public function filetps();

        public function collate();
    }

    class Underling implements UnderlingInterface
    {
        public function program()
        {
            return 'Program initech systems to deposit fractions of pennies to private account';
        }

        public function filetps()
        {
            return 'Place cover sheet on TPS report before going out';
        }

        public function collate()
        {
            return 'Collect and combine texts, information, and figures in proper order.';
        }
    }

    class Consultant implements UnderlingInterface
    {
        public function program()
        {
            return 'Outsource task to India';
        }

        public function filetps()
        {
            return 'Place cover sheet on TPS report before going out';
        }

        public function collate()
        {
            return null; //El consultor no puede ejecutar collate.
        }
    }

    class Lumbergh
    {
        protected $underling;

        public function __construct(UnderlingInterface $underling)
        {
            $this->underling = $underling;//Inicializar subordinado.
        }

        public function harass()//Función hostigar.
        {
            $this->underling->program();//Método prgramar.
            $this->underling->filetps();//Método de acción a realizar.
            $this->underling->collate();//Método recopilar.
        }
    }


    ////////////Solución.

    interface WorkerInterface
    {
        public function work();
    }

    interface ConsultantInterface extends WorkerInterface
    {
        public function program();

        public function filetps();
    }

    interface UnderlingInterface extends ConsultantInterface
    {
        public function collate();
    }

    class Underling implements UnderlingInterface
    {
        public function program()
        {
            return'Program initech systems to deposit fractions of pennies to private account';
        }

        public function filetps()
        {
            return'Place cover sheet on TPS report before going out';
        }

        public function collate()
        {
            return'Collect and combine texts, information, and figures in proper order.';
        }
		
        public function work()
        {
            program();
			filetps();
			collate();
        }
    }

    class Consultant implements ConsultantInterface
    {
        public function program()
        {
            return'Outsource task to India';
        }

        public function filetps()
        {
            return'Place cover sheet on TPS report before going out';
        }

        public function work()
        {
            program();
			filetps();
        }
    }

    class Lumbergh
    {
        protected $underling;

        public function __construct(WorkerInterface $underling)
        {
            $this->underling = $underling;
        }

        public function harass()
        {
            $this->underling->work();
        }
    }
?>