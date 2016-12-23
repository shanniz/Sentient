<?php

namespace App\Validation;

use Respect\Validation\Validator as Respect;
use Respect\Validation\Exceptions\NestedValidationException;


class Validator ///extends AnotherClass
{
	protected $errors;
	
	public function validate($request, $rules){
		foreach ($rules as $field => $rule) {
			try{
				$rule->setName(ucFirst($field))->assert($request->getParam($field));
				//$rule->setName($field)->assert($request->getParam($field));
			}catch(NestedValidationException $e){
				$this->errors[$field] = $e->getMessages();
			}

		}
		//simple way is to store in session error
		$_SESSION['errors'] = $this->errors;
		return $this;
	}

	public function failed(){
		return !empty($this->errors);
	}

}

?>