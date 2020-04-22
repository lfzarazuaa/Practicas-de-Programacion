<?php
    namespace App\Controllers;
    use \Twig\Loader\FilesystemLoader;
    use \Twig\Environment;
    use Laminas\Diactoros\Response\HtmlResponse;
    use Laminas\Diactoros\Response\RedirectResponse;
    use Respect\Validation\Validator;
    
    class BaseController{
        protected $templateEngine;//Para uso en clases hijas.

        public function __construct(){
            $loader = new FilesystemLoader('../views');//Carga con la carpeta de vistas.
            $this->templateEngine =  new Environment($loader, [
                'debug' => true,//Muestra errores en caso de encontrarlos.
                'cache' => false,
            ]);//Inicializa el ambiente de trabajo.
        }

        public function renderHTML($fileName, $data = []){ //Funcón con dato con valor por defecto para devolver el código html .
            return new HtmlResponse($this->templateEngine->render($fileName, $data));//El archivo a renderizar y los datos para el template.
        }
    }
?>