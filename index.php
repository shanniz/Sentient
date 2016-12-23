<?php

//use \Psr\Http\Message\ServerRequestInterface as Request;
//use \Psr\Http\Message\ResponseInterface as Response;

//spl_autoload_register(function ($classname) { //autoload files, eg. middleware, models, etc
//    require ("../src/classes/" . $classname . ".php");
//});


///require __DIR__ . '/../bootstrap/app.php';
require __DIR__ . '/bootstrap/app.php';
/******require  __DIR__ . '/../resources/db/rb.php';
// set up database connection
R::setup('mysql:host=localhost;dbname=elitedb', 'nodejsuser', 'node@123');
R::freeze(true);*************/


$app->run();


/*// Set up dependencies
require __DIR__ . '/../src/dependencies.php';
// Register middleware
require __DIR__ . '/../src/middleware.php';
// Register routes
require __DIR__ . '/../src/routes.php';*/

?>