<?php

namespace App\Validation\Rules;

use App\Models\User;	//for user db validation

use Respect\Validation\Rules\AbstractRule;

class PhoneAvailable extends AbstractRule
{
	public function validate($inputPhone){
		if(User::get('phone', $inputPhone)){
			return false;
		}
		return true;
	}

}

?>