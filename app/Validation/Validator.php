<?php

namespace App\Validation;

use Respect\Validation\Validator as Respect;
use Respect\Validation\Exceptions\NestedValidationException;


class Validator
{
	protected $errors;
	
	public function validate($request, $rules////, $additionalErrors
		){
		foreach ($rules as $field => $rule) {
			try{
				$rule->setName(ucFirst($field))->assert($request->getParam($field));
			}catch(NestedValidationException $e){
				$this->errors[$field] = $e->getMessages();
			}
		}
		//include any additional errors pointed by the caller
		/*if($additionalErrors){ foreach ($additionalErrors as $err => $msg) {$this->errors[$err] = $msg; }	}*/
		
		//simple way is to store in session error
		$_SESSION['errors'] = $this->errors;
		return $this;
	}

	public function failed(){
		return !empty($this->errors);
	}

	//mine, 
	public function addAdditionalErrors($additionalErrors){
		if($additionalErrors){
			foreach ($additionalErrors as $err => $msg) {
					$this->errors[$err] = $msg;			
			}
		}
		$_SESSION['errors'] = $this->errors;
		return $this;
	}

}

?>