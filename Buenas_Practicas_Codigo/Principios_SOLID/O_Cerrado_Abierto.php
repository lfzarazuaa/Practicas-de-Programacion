<?php
    //Ejemplo que no respeta el principio Open-Close pues se debe de modifcar una clase que no será la que ejecute la funcionalidad (DocProcessor).
    //Clase para Factura
    class Invoice
    {
        public function sendToClient()
        {
            return 'Factura enviada al cliente.';
        }
    }

    //Clase para Recibo
    class Receipt
    {
        public function archive()
        {
            return 'Recibo enviado.';
        }
    }

    //Clase para Memorandum
    class Memo
    {
        public function markAsRead()
        {
            return "Memorandum leído.";
        }
    }

    //Clase para procesar un arreglo de documentos.
    class DocProcessor
    {
        public function process(array $docs)
        {
            foreach ($docs as $doc) 
            {
                //Para procesar un nuevo tipo de documento debe verificar si es del nuevo tipo.
                if ($doc instanceof Invoice)
                {
                    echo $doc->sendToClient() . "\n";
                }
                elseif ($doc instanceof Receipt)
                {
                    echo $doc->archive() . "\n";
                }
                elseif ($doc instanceof Memo)
                {
                    echo $doc->markAsRead() . "\n";
                }
            }
        }
    }
    //Ejemplo aplicanndo el Principio de abierto-cerrado.
    interface Document{
        public function process();
    }
    
    //Clase para Factura
    class InvoiceNew implements Document
    {
        public function sendToClient()
        {
            return 'Factura enviada al cliente (nuevo).';
        }

        public function process()
        {
            return $this->sendToClient();
        }
    }

    //Clase para Recibo
    class ReceiptNew implements Document
    {
        public function archive()
        {
            return 'Recibo enviado (nuevo).';
        }

        public function process()
        {
            return $this->archive();
        }
    }

    //Clase para Memorandum
    class MemoNew implements Document
    {
        public function markAsRead()
        {
            return "Memorandum leído (nuevo).";
        }

        public function process()
        {
            return $this->markAsRead();
        }
    }

    //Clase para procesar un arreglo de documentos.
    class DocProcessorNew
    {
        public function process(array $docs)
        {
            foreach ($docs as $doc) 
            {
                //Para procesar un nuevo tipo de documento basta con ver si implementa la interfaz para ejecutar el método.
                if ($doc instanceof Document)
                {
                    echo $doc->process() . "\n";
                }
            }
        }
    }
    //Ejecución del programa.
    $documents=[new Invoice(), new Receipt(), new Memo()];
    $docProcesor = new DocProcessor();
    $docProcesor->process($documents);

    //Ejecución del programa aceptando nuevos tipo de documentos sin modificar la clase docProcesor.
    $documentsN=[new InvoiceNew(), new ReceiptNew(), new MemoNew(),'Hola Mundo'];
    $docProcesorN = new DocProcessorNew();
    $docProcesorN->process($documentsN);
?>