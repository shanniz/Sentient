<?php

namespace App\Middleware;


/**
* Handles whole range of things in middlw ware, like rendering errors on views, generated from the backend
*/
class ValidationErrorsMiddleware extends Middleware
{
	public function __invoke($request, $response, $next){
		//Make errors globally accessible inside the views
		///var_dump($this->container->view->getEnvironment()->addGlobal);
		///die();
		$this->container->view->getEnvironment()->addGlobal('errors', $_SESSION['errors']);
		unset($_SESSION['errors']);
		//This must return next callable middleware
		$response = $next($request, $response);
		return $response;
	}
}


?>