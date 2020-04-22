<?php
    ini_set('display_errors',1);//Ver la salida de errores.
    ini_set('display_startup_error',1);
    error_reporting(E_ALL);

    require_once '../vendor/autoload.php';//Carga las librerias de los paquetes.

    session_start();//Inicializa la sesión (no es lo mismo que estar logeado).

    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . "/..");
    $dotenv->load();
    
    use Illuminate\Database\Capsule\Manager as Capsule;//Espacio de nombres del ORM.
    use Aura\Router\RouterContainer;//Router.
    use App\Models\Job;//Espacio de nombres de la clase Job.
    $capsule = new Capsule;
        
    $capsule->addConnection([
        'driver'    => 'mysql',
        'host'      => getenv('DB_HOST'),
        'database'  => getenv('DB_NAME'),
        'username'  => getenv('DB_USER'),
        'password'  => getenv('DB_PASSWORD'),
        'charset'   => 'utf8',
        'collation' => 'utf8_unicode_ci',
        'prefix'    => '',
        'port'      => getenv('DB_PORT'),
    ]);
    //Hace que los metodos del ORM sean globales.
    $capsule->setAsGlobal();
    // Inicializa el ORM
    $capsule->bootEloquent();

    $request = Laminas\Diactoros\ServerRequestFactory::fromGlobals(
        $_SERVER,
        $_GET,
        $_POST,
        $_COOKIE,
        $_FILES
    );

    echo 'Ya ingresó por public/index.php y luego te redigirá al archivo que querías ingresar.';
    var_dump($request->getUri()->getPath());//Obtiene la ruta correcta.

    $routerContainer = new RouterContainer();

    $map = $routerContainer->getMap();

    /*Ruta para página principal*/
    $map->get('index', '/cursophp/', [
        'controller' => 'App\Controllers\IndexController',//Nombre de la clase a implementar.
        'action' => 'indexAction',//Nombre de la función a ejecutar en la clase del conntrolador.
        'auth' => true //Bit de autentificación.
    ]);
    
    /*Ruta para agregar Trabajos*/
    $rutaAddJobs=['controller' => 'App\Controllers\JobsController',//Nombre de la clase a implementar.
    'action' => 'getAddJobAction',//Nombre de la función a ejecutar en la clase del conntrolador.
    'auth' => true //Bit de autentificación.
    ];

    $map->get('addJobs', '/cursophp/jobs/Add', $rutaAddJobs);//Map para llamadas por get.
    $map->post('saveJobs', '/cursophp/jobs/Add', $rutaAddJobs);//Map para llamadas por post.
    
    /*Ruta para agregar Proyectos*/
    $rutaAddProjects=['controller' => 'App\Controllers\ProjectsController',//Nombre de la clase a implementar.
    'action' => 'getAddProjectAction',//Nombre de la función a ejecutar en la clase del conntrolador.
    'auth' => true //Bit de autentificación.
    ];
    
    $map->get('addProject', '/cursophp/projects/Add', $rutaAddProjects);//Map para llamadas por get.
    $map->post('saveProject', '/cursophp/projects/Add', $rutaAddProjects);//Map para llamadas por post.
    
    /*Ruta para agregar Usuarios*/
    $rutaAddUsers=['controller' => 'App\Controllers\UsersController',//Nombre de la clase a implementar.
    'action' => 'getAddUserAction',
    'auth' => true //Bit de autentificación.
    ];//Nombre de la función a ejecutar en la clase del conntrolador.

    $map->get('addUsers', '/cursophp/users/Add', $rutaAddUsers);//Map para llamadas por get.
    $map->post('saveUsers', '/cursophp/users/Add', $rutaAddUsers);//Map para llamadas por post.
    
    $map->get('loginForm', '/cursophp/login', ['controller' => 'App\Controllers\AuthController',
    'action' => 'getlogin']);//Map para llamadas por get.

    /*Ruta de login*/
    $map->post('auth', '/cursophp/auth', ['controller' => 'App\Controllers\AuthController',
    'action' => 'postLogin']);//Map para llamadas por post.
    
    $map->get('admin', '/cursophp/admin', ['controller' => 'App\Controllers\AdminController',
    'action' => 'getIndex',
     'auth' => true //Bit de autentificación.
    ]);//Map para llamadas por get.
    
     /*Ruta de Página de opciones*/
    $map->post('adminPost', '/cursophp/admin', ['controller' => 'App\Controllers\AdminController',
    'action' => 'getIndex',
    'auth' => true //Bit de autentificación.
    ]);//Map para llamadas por post.
    
    $map->get('logout', '/cursophp/logout', ['controller' => 'App\Controllers\AuthController',
    'action' => 'getLogout'
    ]);//Map para llamadas por get.

    $matcher = $routerContainer->getMatcher();

    $route = $matcher->match($request);

    if(!$route){
        echo 'No route';
    }
    else{
        $handlerData = $route->handler;//Ruta de salida o respuesta.
        $controllerName = $handlerData['controller'];//Nombre de la clase a llamar.
        $actionName = $handlerData['action'];//Nombre del método a llamar.
        //Autenticación.
        $needsAuth =$handlerData['auth'] ?? false;//Si Auth no está definido por default envía falso.
        $sesionUserId = $_SESSION['userId'] ?? null;//La negación de null da true y .
        if ($needsAuth && !$sesionUserId) {//Verifica si puede acceder a la ruta (La negación de un número da false).
            $controllerName = 'App\Controllers\AuthController';//Nombre de la clase a llamar.
            $actionName = 'getloginMsg';//Nombre del método a llamar.
        }
        //Redireccionar al controlador deseado.
        $controller = new $controllerName;//Crea la clase con base en el nombre de un string.
        $response = $controller->$actionName($request);//Ejecuta un método con base en una cadena.
        //Leer los headers y mandarlos a imprimir.
        foreach ($response->getHeaders() as $name => $values) {
            //Imprime cada encabezado
            foreach ($values as $value) {
                //Imprime cada valor.
                header(sprintf('%s: %s', $name, $value), false); //Encabezado-valor.
            }
        }
        //Obtener u establecer el código de estado de la respuesta HTTP.
        http_response_code($response->getStatusCode());//Obtiene el status para saber si no hubo error (200 OK).
        echo $response->getBody();//Imprime la respuesta (código html a ejecutar)
    }
?>