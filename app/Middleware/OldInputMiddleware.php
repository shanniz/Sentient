<?php

namespace App\Middleware;


/**
* @Copyright
* @Author: Shan
* @Created: 2017-12-23
* @Description: Retains old values in the form, after an input error returned by the server
*/
class OldInputMiddleware extends Middleware
{
	public function __invoke($request, $response, $next){
		//Make old fields data accessible inside the views
		$this->container->view->getEnvironment()->addGlobal('oldInputData', $_SESSION['oldInputData']);
		//setting session after setting views is because we don't wanna save anything during the very first request
		$_SESSION['oldInputData'] = $request->getParams();

		$response = $next($request, $response);
		return $response;
	}
}


?>