<?php

namespace App\Middleware;


/**
* Handles whole range of things in middlw ware, like rendering errors on views, generated from the backend
*/
class Middleware
{
	protected $container;
	public function __construct($container)
	{
		$this->container = $container;
	}
}


?>