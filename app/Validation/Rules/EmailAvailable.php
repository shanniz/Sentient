<?php

namespace App\Validation\Rules;

use App\Models\User;	//for user db validation

use Respect\Validation\Rules\AbstractRule;

class EmailAvailable extends AbstractRule
{
	public function validate($inputEmail){
		//var_dump($this->db);
		if(User::get('email', $inputEmail )){	//email already taken
			return false;
		}
		return true;
	}

}

?>