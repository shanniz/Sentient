<?php

namespace App\Models;

class User{
	//users table in the database (in case of eloquent db)
	protected $table = 'users';

	public function toJson($arr){
		return json_encode($arr);
	}
	public function get($col, $val){
		///return $this->db->find('users');
		return $this->db->findOne('users', $col.'='.$val);
	}
	public function getSpecific( $cols ){
		$str = '';
		foreach ($cols as $key => $value) {
			$str.= $key .'='. $value .' AND ';
		}
		return $this->db->findOne('users', substr($str,0,-5) );
		//return null;
	}

	public function authenticateUserLogin($cols){
		$user = $this->db->findOne('users',  'email='. $cols['email'] );
		$error = 'Invalid username/password';
		$success="Authenticated";
		//$resp = array('success' => null, 'error'=>null );
		/*if(!$user){
			return $response['error'] = $error;
		}*/
		//if (password_verify( $cols['password'] , $user->password ) ) {
		if ( $user && $cols['password'] == $user->password  ) {
			return array('success' => $success);	//return $resp['success']=$success;
		}		
		//return $resp['error'] = $error;
		return array('error' => $error);
	}

	public function createUser($user){
		$usr = $this->db->dispense('users');
  		$usr->f_name = $user['first_name'];
  		$usr->l_name = $user['last_name'];
  		$usr->m_name = $user['middle_name'];
  		$usr->gender = $user['gender'];
  		$usr->dob = $user['dob'];
  		$usr->created = $user['created'];
  		$usr->email = $user['email'];
  		//$usr->password = password_hash($user['password'], PASSWORD_DEFAULT );
  		$usr->password = $user['password'];

  		//'f_name'=>'Ftest11', 'l_name'=>'Ltest11', 'm_name'=>'sdf', 'gender'=>'F', 'dob'=>'2002-08-26', 
		//	'created'=>'2016-09-30 09:54:44', 'email'=>'a@a.c', 'password'=>'123')
  		$id = $this->db->store( $usr );
  		return $id;
	}
}

?>