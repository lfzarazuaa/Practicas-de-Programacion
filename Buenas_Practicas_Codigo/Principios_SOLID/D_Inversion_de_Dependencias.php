<?php
    
    class User
    {
        private $name; 
        private $email;
        private $cellPhone;

        public function __construct( $name , $email , $cellPhone )   
        {
            $this->name = $name;
            $this->email = $email;
            $this->cellPhone = $cellPhone;
        }

        function getEmail()
        {
            return "El email es $this->email.";
        }

        function getCellPhone()
        {
            return "El celular es $this->cellPhone.";
        }
    }
    interface Sender  
    {
        public function send( $meansOfContact , $msg );
    }

    class WhatsappSender implements Sender
    {
        public function send( $meansOfContact , $msg)
        {
            return "Enviado por Whatsapp : ($msg) al número $meansOfContact";
        }
    }
    
    class EmailSender implements Sender
    {
        public function send( $meansOfContact , $msg)
        {
            return "Enviado por Email : ($msg) al email $meansOfContact";
        }
    }

    class SMSSender implements Sender
    {
        public function send( $meansOfContact , $msg)
        {
            return "Enviado por SMS : ($msg) al número $meansOfContact";
        }
    }

    //Definición de clase notificador donde se envian los mensajes no acepta mas que un tipo de clase ya definida
    //para cada tipo de envió violando asi el principio de inversión de dependencias, ya que para modificar
    // uno de los métodos de envió también se modifica la clase Notifier creando asi una dependecia de la clase. 
    class Notifier  
    {
        private $emailSender;
        private $smsSender;
        private $whatsappSender;

        //Constructor donde se da la dependencia de un objeto.
        public function __construct()   
        {
            $this->emailSender = new EmailSender();
            $this->smsSender = new SMSSender();
            $this->whatsappSender = new WhatsAppSender();
        }
        
        public function notify( $user, int $severity , $msg)
        {
            $BajaPrioridad = 0;
            $MediaPrioridad = 1;
            $AltaPrioridad = 2;
            //Declaración de la lógica de negocio propuesta.
            if ( $severity >= $BajaPrioridad ) 
            {
                echo $this->emailSender->send( $user->getEmail() , $msg ) . "\n";
            }
            if( $severity >= $MediaPrioridad )
            {
                echo $this->whatsappSender->send( $user->getCellPhone() , $msg ) . "\n";
            }
            if( $severity >= $AltaPrioridad )
            {
                echo $this->smsSender->send( $user->getCellPhone() , $msg ) . "\n";
            } 
        }   
    }

    interface SenderEmail
    {
        public function send( $email , $msg );
    }

    interface SenderSms
    {
        public function send( $cellPhone , $msg );
    }

    interface SenderWhatsapp
    {
        public function send( $cellPhone , $msg );
    }
    
    class WhatsappSenderRehydrated implements SenderWhatsapp
    {
        public function send( $meansOfContact , $msg)
        {
            return "Enviado por Whatsapp Rehidratado (mas rapido): ($msg) al número $meansOfContact";
        }
    }
    
    class EmailSenderRehydrated implements SenderEmail
    {
        public function send( $meansOfContact , $msg)
        {
            return "Enviado por Email Rehidratado (mas rapido): ($msg) al email $meansOfContact";
        }
    }

    class SMSSenderRehydrated implements SenderSms
    {
        public function send( $meansOfContact , $msg)
        {
            return "Enviado por SMS Rehidratado (mas rapido): ($msg) al número $meansOfContact";
        }
    }

    class NotifierCorrect  
    {
        private $emailSender;
        private $smsSender;
        private $whatsappSender;

        public function __construct(SenderEmail $emailSender, SenderSms $smsSender, SenderWhatsapp $whatsappSender)   
        {
            $this->emailSender = $emailSender;
            $this->smsSender = $smsSender;
            $this->whatsappSender = $whatsappSender;
        }
        
        public function notify( $user, int $severity , $msg)
        {
            $BajaPrioridad = 0;
            $MediaPrioridad = 1;
            $AltaPrioridad = 2;
            //Declaración de la lógica de negocio propuesta.
            if ( $severity >= $BajaPrioridad ) 
            {
                echo $this->emailSender->send( $user->getEmail() , $msg ) . "\n";
            }
            if( $severity >= $MediaPrioridad )
            {
                echo $this->whatsappSender->send( $user->getCellPhone() , $msg ) . "\n";
            }
            if( $severity >= $AltaPrioridad )
            {
                echo $this->smsSender->send( $user->getCellPhone() , $msg ) . "\n";
            } 
        }   
    }

    $username1 = "El usuario principal";
    $email1 = 'jkduserprin@php.com.mx';
    $cellPhone1 = '55-45-24-56-93';
    $msg = 'Este es el mensaje de espera durante tiempos de crisis.';
    $prioridad=2;//Prioridad alta.

    $user1 = new User( $username1 , $email1 , $cellPhone1 ); //Creación del usuario con sus datos de contacto.
    
    $notificador = new Notifier(); //Instancia el notificador por donde se enviaran los mensajes.

    $notificador->notify( $user1, $prioridad , $msg);//Manda las notificaciones.

    //Notificador respetando la inversión de dependecias.
    $emailSender = new EmailSenderRehydrated();
    $smsSender = new SmsSenderRehydrated();
    $whatsappSender = new WhatsappSenderRehydrated();

    $notificador2 = new NotifierCorrect($emailSender,$smsSender,$whatsappSender); //Instancia el notificador corregido por donde se enviaran los mensajes aceptando actualizaciones.

    $notificador2->notify( $user1, $prioridad , $msg);//Manda las notificaciones.
    
?>