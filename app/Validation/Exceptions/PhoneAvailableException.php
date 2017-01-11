<?php

namespace App\Validation\Exceptions;

use Respect\Validation\Exceptions\ValidationException;



class PhoneAvailableException extends ValidationException
{
	public static $defaultTemplates = [
		self::MODE_DEFAULT => [
			self::STANDARD => 'This phone number is already registered. Please enter a different phone number.'		 
		]
	];

	
}

?>