<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once 'vendor/autoload.php';

require_once 'Task.php';

use Relay\Relay;

use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule;

$capsule->addConnection([
    'driver'    => 'mysql',
    'host'      => 'localhost',
    'database'  => 'todo',
    'username'  => 'root',
    'password'  => '',
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => '',
    'port'      => '3307',
]);

// Make this Capsule instance available globally via static methods... (optional)
$capsule->setAsGlobal();

// Setup the Eloquent ORM... (optional; unless you've used setEventDispatcher())
$capsule->bootEloquent();

$request = Zend\Diactoros\ServerRequestFactory::fromGlobals(
    $_SERVER,
    $_GET,
    $_POST,
    $_COOKIE,
    $_FILES
);

$loader = new Twig_Loader_Filesystem('.');
$twig = new \Twig_Environment($loader, array(
    'debug' => true,
    'cache' => false,
));

$router = new Aura\Router\RouterContainer();
$map = $router->getMap();
$map->get('todo.list', '/', function ($request) use ($twig) {
    $tasks = Task::all();
        
    $response = new Zend\Diactoros\Response\HtmlResponse($twig->render('template.twig', [
        'tasks' => $tasks
    ]));
    return $response;
});

$map->post('todo.add', '/add', function ($request){
    $data = $request->getParsedBody();
    $tasks = new Task();
    $tasks->description = $data['description'];
    $tasks->save();
    $response = new Zend\Diactoros\Response\RedirectResponse('/');
    return $response;
});

$map->get('todo.check', '/check/{id}', function ($request){//redirecciona a add/id
    $id = $request->getAttribute('id');
    $task = Task::find($id);
    $task->done = true;
    $task->save();
    $response = new Zend\Diactoros\Response\RedirectResponse('/');
    return $response;
});

$map->get('todo.uncheck', '/uncheck/{id}', function ($request){//redirecciona a add/id
    $id = $request->getAttribute('id');
    $task = Task::find($id);
    $task->done = false;
    $task->save();
    $response = new Zend\Diactoros\Response\RedirectResponse('/');
    return $response;
});

$map->get('todo.delete', '/delete/{id}', function ($request){//redirecciona a add/id
    $id = $request->getAttribute('id');
    $task = Task::find($id);
    $task->delete();
    $response = new Zend\Diactoros\Response\RedirectResponse('/');
    return $response;
});

$relay = new Relay([
    new Middlewares\AuraRouter($router),
    new Middlewares\RequestHandler()
]);

$response = $relay->handle($request);

foreach ($response->getHeaders() as $name => $values) {
    foreach ($values as $value) {
        header(sprintf('%s: %s', $name, $value), false);
    }
}
echo $response->getBody();