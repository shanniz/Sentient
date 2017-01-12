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
		if(isset($_SESSION['user'])){
			return $response->withRedirect($this->router->pathFor('homepage'));
		}
		return $this->view->render($response, 'auth/signin.twig');
	}
	public function postSignIn($request, $response){
		$auth = $this->authentication->attempt(
			$request->getParam('your_email'),
			$request->getParam('password')
		);


		if (!$auth) {
			$this->flash->addMessage('error', 'Invalid email/phone/password');
			//$verificationErrors['loginError'] = 'Invalid email/phone/password';
			return $response->withRedirect($this->router->pathFor('auth.signin'));
		}

		$this->flash->addMessage('info', 'Welcome to Sentient Eduction!');

		return $response->withRedirect($this->router->pathFor('homepage'));
	}

	public function getSignUp($request, $response){
		return $this->view->render($response, 'auth/signup.twig');
	}

	public function postSignUp($request, $response){
		$params =  $request->getParams();
		
		if( ($request->getParam('your_email')!= $request->getParam('reenter_email'))) {
			$this->flash->addMessage('error', 'Re-entered Email must be the same, mismatch found');
			return $response->withRedirect($this->router->pathFor('auth.signup'));
		}

		$validation = $this->validator->validate($request, [
			'phone' => v::noWhitespace()->notEmpty()->phone()->PhoneAvailable(),
			/////Email available is our custom EmailAvailable Rule; class name becomes rule name
			'your_email' => v::noWhitespace()->notEmpty()->email()->EmailAvailable(),
			'first_name' => v::noWhitespace()->notEmpty()->alpha(),
			'last_name' => v::noWhitespace()->notEmpty()->alpha(),
			'password' => v::noWhitespace()->notEmpty()
		]);
		if ($validation->failed()) {
			return $response->withRedirect($this->router->pathFor('auth.signup'));
		}
		

		/*if(User::get('email', $this->writeDoubleQuote($params['your_email']) )){
			$this->flash->addMessage('error', 'This email is already registered. Please enter a different Email.');
			$additionalValidErrors = true;
		}*/
		

		$id = User::createUser( array (
			'first_name'=>$params['first_name'], 
			'last_name'=>$params['last_name'], 
			'middle_name'=>$params['middle_name'], 
			'gender'=>$params['sex'], 
			'dob'=> $params['dateofbirth'], 
			'phone'=> $params['phone'], 
		    'created'=>  date("Y-m-d H:i:s"), //'2016-09-30 09:54:44', 
		    'email'=> $params['your_email'], 
		    'password'=> password_hash($params['password'], PASSWORD_DEFAULT)  
		    )
		);

		$this->flash->addMessage('info', 'You have successfully signed up to the sentient education!');
		//Login now
		$this->authentication->attempt($params['your_email'], $params['password']);
		return $response->withRedirect($this->router->pathFor('homepage')); 
	}
}

?>