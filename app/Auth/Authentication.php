<?php

namespace App\Auth;

use App\Models\User;




/**
* 
*/
class Authentication{

	//returns currently loggedin user
	public function user(){
		if(!$_SESSION['user']){
			return null;
		}
		return User::get('id', $_SESSION['user']); //->email;
	}
	//if user is logged in
	public function check(){
		return isset($_SESSION['user']);
	}

	public function attempt($email, $password){
		//get user by phone/email
		$user = User::get('email', '"'.$email.'"');
		if (is_numeric($email)){
		  $user = $user ? $user : User::get('phone', $email);
		}
		
		if(!$user){
			return false;
		}

		if(password_verify($password, $user->password)){
		//if($password == $user->password){
			$_SESSION['user'] = $user->id;
			return true;
		}
		return false;
	}

	public function logout(){

		unset($_SESSION['user']);
	}

}

?>