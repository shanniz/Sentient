<?php

namespace App\Controllers\Auth;

use App\Models\User;

use App\Controllers\Controller;
use Respect\Validation\Validator as v;
/**
* 
*/
class AuthenticationController extends Controller{

	public function writeDoubleQuote($v){
		//return $v;
		return '"'.$v.'"';
	}

	public function getLogin($request, $response){
		$this->view->render($response, 'auth/login.twig');
	}

	public function postLogin($request, $response){
		$params =  $request->getParams();		
		$validation = $this->validator->validate($request, [
			'youremail' => v::noWhitespace()->notEmpty()->email(),
			'password' => v::noWhitespace()->notEmpty()
		]);
		if ($validation->failed()) {
			return $response->withRedirect($this->router->pathFor('auth.login'));
		}		
		
		$creds = array('email' => $this->writeDoubleQuote($params['youremail']), 
			'password' => $params['password']);
		
		if(!User::authenticateUserLogin( $creds ) ){
			//Invalid email/password
			return $response->withRedirect($this->router->pathFor('auth.login'));	
			//return 'This email is already registered'; 
		}

		return $response->withRedirect($this->router->pathFor('homepage')); 
	}


	public function getSignUp($request, $response){
		$this->view->render($response, 'auth/signup.twig');
	}

	public function postSignUp($request, $response){
		$params =  $request->getParams();
		
		$validation = $this->validator->validate($request, [
			'youremail' => v::noWhitespace()->notEmpty()->email(),
			'first_name' => v::noWhitespace()->notEmpty()->alpha(),
			'last_name' => v::noWhitespace()->notEmpty()->alpha(),
			'password' => v::noWhitespace()->notEmpty()
		]);
		if ($validation->failed()) {
			return $response->withRedirect($this->router->pathFor('auth.signup'));
		}

		if($params['youremail']!=$params['reenteremail']){
			return "Email mismatch";
		}
		
		if(User::get('email', $this->writeDoubleQuote($params['youremail']) ) ){
			var_dump('This email is already registered');
			return $response->withRedirect($this->router->pathFor('auth.signup'));	
			//return 'This email is already registered'; 
		}


		/*'firstname', 'middlename' ,  'lastname', 'youremail', 'reenteremail', 'password', 'dateofbirth' ,'sex' */

		///////var_dump( User::get('email', $this->writeDoubleQuote($params['youremail']) ) );
		
		$id = User::createUser( array (
			'f_name'=>$params['first_name'], 
			'l_name'=>$params['last_name'], 
			'm_name'=>$params['middle_name'], 
			'gender'=>$params['sex'], 
			'dob'=> $params['dateofbirth'], 
		    'created'=>  date("Y-m-d H:i:s"), //'2016-09-30 09:54:44', 
		    'email'=> $params['youremail'], 
		    'password'=> $params['password']  
		    )
		);

		var_dump(User::get('id', $id));
		//var_dump($this->db->find('users', 'id=1'));
		////$this->view->render($response, 'auth/signup.twig');
		return $response->withRedirect($this->router->pathFor('homepage')); 
	}
}

?>