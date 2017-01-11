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
		return '"'.$v.'"';
	}


	public function getSignOut($request, $response){
		$this->authentication->logout();
		return $response->withRedirect($this->router->pathFor('auth.signin'));
	}

	public function getSignIn($request, $response){
		////$this->flash->addMessage('error', 'this is error test');
		return $this->view->render($response, 'auth/signin.twig');
	}
	public function postSignIn($request, $response){
		$auth = $this->authentication->attempt(
			$request->getParam('youremail'),
			$request->getParam('password')
		);
		$verificationErrors =null;
		if (!$auth) {
			$this->flash->addMessage('error', 'Invalid email/phone/password');
			//$verificationErrors['loginError'] = 'Invalid email/phone/password';
			//$validation = $this->validator->addAdditionalErrors($verificationErrors);
			return $response->withRedirect($this->router->pathFor('auth.signin'));
		}

		return $response->withRedirect($this->router->pathFor('homepage'));
	}

	public function getSignUp($request, $response){
		return $this->view->render($response, 'auth/signup.twig');
	}

	public function postSignUp($request, $response){
		$params =  $request->getParams();
		
		$validation = $this->validator->validate($request, [
			'phone' => v::noWhitespace()->notEmpty()->phone(),
			/////Email available is our custom EmailAvailable Rule; class name becomes rule name
			'youremail' => v::noWhitespace()->notEmpty()->email(), ////////->EmailAvailable(),
			//'youremail' => v::
			'first_name' => v::noWhitespace()->notEmpty()->alpha(),
			'last_name' => v::noWhitespace()->notEmpty()->alpha(),
			'password' => v::noWhitespace()->notEmpty()
		]);
		if ($validation->failed()) {
			return $response->withRedirect($this->router->pathFor('auth.signup'));
		}
		
		$additionalValidErrors = false;
		if( ($request->getParam('youremail')!= $request->getParam('reenteremail'))) {
			$this->flash->addMessage('error', 'Re-entered Email must be the same, mismatch found');
			return $response->withRedirect($this->router->pathFor('auth.signup'));
		}

		if(User::get('email', $this->writeDoubleQuote($params['youremail']) )){
			//$additionalValidErrors['reregister'] = 'This email is already registered. Please enter a different Email.';
			$this->flash->addMessage('error', 'This email is already registered. Please enter a different Email.');
			$additionalValidErrors = true;
		}
		if(User::get('phone', $this->writeDoubleQuote($params['phone'])) ){
			$this->flash->addMessage('error', 'This phone number is already registered. Please enter a different Phone number.');
			$additionalValidErrors = true;
		}

		//$validation = $this->validator->addAdditionalErrors($additionalValidErrors);
		if ($additionalValidErrors == true) {
			return $response->withRedirect($this->router->pathFor('auth.signup'));
		}

		/*'firstname', 'middlename' ,  'lastname', 'youremail', 'reenteremail', 'password', 'dateofbirth' ,'sex' */

		$id = User::createUser( array (
			'first_name'=>$params['first_name'], 
			'last_name'=>$params['last_name'], 
			'middle_name'=>$params['middle_name'], 
			'gender'=>$params['sex'], 
			'dob'=> $params['dateofbirth'], 
			'phone'=> $params['phone'], 
		    'created'=>  date("Y-m-d H:i:s"), //'2016-09-30 09:54:44', 
		    'email'=> $params['youremail'], 
		    'password'=> password_hash($params['password'], PASSWORD_DEFAULT)  
		    )
		);

		$this->flash->addMessage('info', 'You have successfully signed up to the sentient education!');
		//Login now
		$this->authentication->attempt($params['youremail'], $params['password']);
		//var_dump($this->db->find('users', 'id=1'));
		////$this->view->render($response, 'auth/signup.twig');
		return $response->withRedirect($this->router->pathFor('homepage')); 
	}
}

?>