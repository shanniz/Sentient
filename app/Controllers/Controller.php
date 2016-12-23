<?php

namespace App\Controllers;


///require  __DIR__ . '/../../resources/db/rb.php';
//$rb = new R();
//$rb->setup('mysql:host=localhost;dbname=elitedb', 'nodejsuser', 'node@123');

//die();
// set up database connection


/**
* 
*/
class Controller{
	
	protected $container;
	public function __construct($container){
		//var_dump($container->rb);
    	//die();  
		$this->container = $container;
		//$this->dbObj = $dbObj;
		///R::setup('mysql:host=localhost;dbname=elitedb', 'nodejsuser', 'node@123');
		///R::freeze(true);

	}

	//This function returns property if it exists, so eg access 
	//$this->container->view simply as $this->view in subclass
	public function __get($prop){
		if ($this->container->{$prop}) {
			return $this->container->{$prop};
		}
	}
}

?>