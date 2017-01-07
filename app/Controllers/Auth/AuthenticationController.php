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
		$verificationErrors =null;

		//or phone
		$creds = array('email' => $this->writeDoubleQuote($params['youremail']),
			//,'phone' => $params['phone'] 
			'password' => $params['password']);
		

		$logResp = User::authenticateUserLogin( $creds ) ;
		if ($logResp['error']) {
			$verificationErrors['loginError'] = $logResp['error'];
			//return $response->withRedirect($this->router->pathFor('auth.login'));
		}


		$validation = $this->validator->validate($request, [
			'youremail' => v::noWhitespace()->notEmpty(), //it may contain phone number now //->email(),
			'password' => v::noWhitespace()->notEmpty()
		]
		,$verificationErrors);
		if ($validation->failed()) {
			return $response->withRedirect($this->router->pathFor('auth.login'));
		}				

		return $response->withRedirect($this->router->pathFor('homepage')); 
	}


	public function getSignUp($request, $response){
		$this->view->render($response, 'auth/signup.twig');
	}

	public function postSignUp($request, $response){
		$params =  $request->getParams();
		$additionalValidErrors = null;
		if(//$request->getParam('reenteremail') &&  //reenter email for signup case
			($request->getParam('youremail')!= $request->getParam('reenteremail'))){
			$additionalValidErrors['reenteremail'] = 'Email must be the same, mismatch found';
			//$validation->errors['reenteremail'] = 'Email must be the same, mismatch found';
		}

		$validation = $this->validator->validate($request, [
			'phone' => v::noWhitespace()->notEmpty()->phone(),
			/////Email available is our custom EmailAvailable Rule; class name becomes rule name
			'youremail' => v::noWhitespace()->notEmpty()->email(), ////////->EmailAvailable(),
			//'youremail' => v::
			'first_name' => v::noWhitespace()->notEmpty()->alpha(),
			'last_name' => v::noWhitespace()->notEmpty()->alpha(),
			'password' => v::noWhitespace()->notEmpty()
		]
		, $additionalValidErrors);
		if ($validation->failed()) {
			return $response->withRedirect($this->router->pathFor('auth.signup'));
		}
		
		if(User::get('email', $this->writeDoubleQuote($params['youremail']) 
			//User::get('phone', $this->writeDoubleQuote($params['phone'])
			)){
			//return $response->withRedirect($this->router->pathFor('auth.signup'));	
			$additionalValidErrors['reregister'] = 'This email is already registered. Please enter a differnt Email.';
		}
		if(User::get('phone', $this->writeDoubleQuote($params['phone'])) ){
			$additionalValidErrors['reregister'] = 'This phone number is already registered. Please enter a differnt Phone number.';
		}

		$validation = $this->validator->validate($request, []
		, $additionalValidErrors);
		if ($validation->failed()) {
			return $response->withRedirect($this->router->pathFor('auth.signup'));
		}

		/*'firstname', 'middlename' ,  'lastname', 'youremail', 'reenteremail', 'password', 'dateofbirth' ,'sex' */

		///////var_dump( User::get('email', $this->writeDoubleQuote($params['youremail']) ) );
		
		$id = User::createUser( array (
			'first_name'=>$params['first_name'], 
			'last_name'=>$params['last_name'], 
			'middle_name'=>$params['middle_name'], 
			'gender'=>$params['sex'], 
			'dob'=> $params['dateofbirth'], 
			'phone'=> $params['phone'], 
		    'created'=>  date("Y-m-d H:i:s"), //'2016-09-30 09:54:44', 
		    'email'=> $params['youremail'], 
		    'password'=> $params['password']  
		    )
		);
		//var_dump($this->db->find('users', 'id=1'));
		////$this->view->render($response, 'auth/signup.twig');
		return $response->withRedirect($this->router->pathFor('homepage')); 
	}
}

?>