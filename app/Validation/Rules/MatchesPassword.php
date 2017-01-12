<?php

namespace App\Validation\Rules;

use App\Models\User;	//for user db validation

use Respect\Validation\Rules\AbstractRule;

class MatchesPassword extends AbstractRule
{
	protected $password;

	public function __construct($password){
		$this->password = $password;		
	}
	public function validate($inputPassword){
		return password_verify($inputPassword, $this->password);
		//return true;
	}

}

?>