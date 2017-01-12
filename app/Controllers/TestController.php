<?php

namespace App\Controllers;

use \Slim\Views\Twig as View;

use App\Models\User;
/**
* 
*/
class TestController extends Controller{
	
	//protected $view;
	/*function __construct(View $view){
		$this->view = $view;
	}*/

	//public function redirectHome($request, $response){}
	public function getTest($request, $response){
		$this->container->view->render($response, 'templates/testResponsive.twig');
		/////return json_encode(  array('Home controller-Name ' => $request->getParam('name')) );
	}

	
}

?>