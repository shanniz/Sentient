<?php

namespace App\Controllers\Auth;

use App\Models\User;

use App\Controllers\Controller;
use Respect\Validation\Validator as v;


/**
* 
*/
class PasswordController extends Controller{

	public function getChangePassword($request, $response){
		if(!$_SESSION['user']){
			return $response->withRedirect($this->router->pathFor('auth.signin'));
		}
		return $this->view->render($response, 'auth/changepassword.twig');
	}

	public function postChangePassword($request, $response){
		
		$validation = $this->validator->validate($request, [
			'current_password' => v::noWhitespace()->notEmpty()->matchesPassword($this->authentication->user()->password),
			'new_password' => v::noWhitespace()->notEmpty()
		]);

		if($validation->failed()){
			return $response->withRedirect($this->router->pathFor('auth.changepassword'));
		}
		
		$id = User::setPassword($request->getParam('new_password'), $this->authentication->user()->id);
		//$this->authentication->user()->setPassword($request->params('new_password'), $this->authentication->user()->id);
		$this->flash->addMessage('info', 'Your password changed successfully.');
		return $response->withRedirect($this->router->pathFor('homepage'));

	}

}

?>