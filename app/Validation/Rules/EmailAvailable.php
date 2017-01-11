<?php

namespace App\Validation\Rules;

use App\Models\User;	//for user db validation

use Respect\Validation\Rules\AbstractRule;

class EmailAvailable extends AbstractRule
{
	public function validate($inputEmail){
		if(User::get('email', '"' . $inputEmail . '"' )){	//email already taken
			///$this->flash->addMessage('error', 'This email is already registered. Please enter a different Email.');
			return false;
		}
		return true;
	}

}

?>