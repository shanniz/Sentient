<?php

/*Every request lands at index.php file, 
which redirects it here, to bootstrap, on app.php. 
From here it finally serves the route from from routes.php */
/*// Instantiate the app
$settings = require __DIR__ . '/../src/settings.php';
$app = new \Slim\App($settings);*/

session_start();

//$path = '/../vendor/respect/validation/library/';
//set_include_path(get_include_path() . PATH_SEPARATOR . $path);

require __DIR__ . '/../vendor/autoload.php';

//For the webhosting server
////require __DIR__ . '/../vendor/respect/validation/library/Validator.php';


/////PSR-4 Autoload
//$user = new \App\models\User;
//var_dump($user); die();

require  __DIR__ . '/../app/DB/rb.php';
$rb = new R();
$rb->setup('mysql:host=localhost;dbname=sentient_elitedb', 'sentient_nodejsu', 'node@123');
//$rb::setup('mysql:host=localhost;dbname=elitedb', 'nodejsuser', 'node@123');
$rb::freeze(true);
//var_dump();
///die();

$app = new \Slim\App([
        'settings' => [
            'displayErrorDetails' => true
        ],
        'db' => [
            'driver' => 'mysql',
            'host' => 'localhost',
            'database' => 'elitedb',
            'username' => 'nodejsuser',
            'password' => 'node@123',
            'charset' => 'utf-8',
            'collation' => 'utf8_unicode_ci'
        ]
]);


$container = $app->getContainer();
$container['view']=function($container){
    //initialize view path so dont need provide path everytime
    $view = new \Slim\Views\Twig(__DIR__ . '/../resources/views', 
        [   //view options, in production change it to cache views dir
        'cache' => false
    ]);

    $view->addExtension(new \Slim\Views\TwigExtension(
        $container->router,
        $container->request->getUri()
    ));
    return $view;
};

//Pass DB object on, to the controllers
//$container['rb']=$rb;
//Or, make it globally available
$container['db'] = function($container) use ($rb){
    return $rb;
};


$container['validator'] = function($container) {
    return new App\Validation\Validator;
};


$container['HomeController'] = function($container){
    //return new \App\Controllers\HomeController($container->view); //will be passed to base class Controller
    return new \App\Controllers\HomeController($container);
};

$container['AuthenticationController'] = function($container){
    //return new \App\Controllers\HomeController($container->view); //will be passed to base class Controller
    return new \App\Controllers\Auth\AuthenticationController($container);
};

$app->add(new \App\Middleware\ValidationErrorsMiddleware($container));
$app->add(new \App\Middleware\OldInputMiddleware($container));

require __DIR__ . '/../app/routes.php';

?>