<?php

namespace App\Controllers;

use \Slim\Views\Twig as View;

use App\Models\User;
/**
* 
*/
class HomeController extends Controller{
	
	//protected $view;
	/*function __construct(View $view){
		$this->view = $view;
	}*/

	//public function redirectHome($request, $response){}

	public function getHome($request, $response){
		//$this->container->rb->find('users');
		//var_dump($this->db->find('users', 'id=1'));  var_dump($this->db->findOne('users', 'id=1'));
		//In case of using eloquent DB
		//User::get([ 'id' =>1]);
		///$id = User::create( array ('f_name'=>'Ftest11', 'l_name'=>'Ltest11', 'm_name'=>'sdf', 'gender'=>'F', 'dob'=>'2002-08-26', 
		///	'created'=>  date("Y-m-d H:i:s"), //'2016-09-30 09:54:44', 
		///	'email'=>'a@a.c', 'password'=>'123'));
		//global $rb;
		//$user = User::where('email', 'email@domain.com')->first();
		//var_dump($rb->findOne('users', 'email="email@domain.com"'));
		//die();
		if(!isset($_SESSION['user'])){
			return $response->withRedirect($this->router->pathFor('auth.signin'));
		}
		$this->container->view->render($response, 'home.twig');
		/////return json_encode(  array('Home controller-Name ' => $request->getParam('name')) );
	}

	
}

?>