<?php



/*$app->get('/', function($request, $response){
    $response->getBody()->write(json_encode( array('error_code' => '404', 'message' => 'Page not found' ) ));
    return $response;
});*/

$app->get('/',  'HomeController:getHome');

$app->get('/home',  'HomeController:getHome')->setName('homepage');
$app->get('/test',  'TestController:getTest')->setName('testpage');
//$app->post('/home',  'HomeController:post');

$app->get('/auth/signup', 'AuthenticationController:getSignUp')->setName('auth.signup');
$app->post('/auth/signup', 'AuthenticationController:postSignUp');

$app->get('/auth/signin', 'AuthenticationController:getSignIn')->setName('auth.signin');
$app->post('/auth/signin', 'AuthenticationController:postSignIn');
$app->get('/auth/changepassword', 'PasswordController:getChangePassword')->setName('auth.changepassword');
$app->post('/auth/changepassword', 'PasswordController:postChangePassword');

$app->get('/auth/signout', 'AuthenticationController:getSignOut')->setName('auth.signout');


//$app->get('/auth/login', 'AuthenticationController:getLogin')->setName('auth.login');
//$app->post('/auth/login', 'AuthenticationController:postLogin');

//

/*$app->get('/home', function($request, $response){
    //return json_encode( array('landing page' => 'home' ) );
    //$response->getBody()->write(json_encode( array('landing' => 'home' ) ));
    //return $response; return $this->view->render($response,'home.twig');
});*/

$app->get('/users/getall', function($request, $response){
    //$users = R::find('users'); 
    //return json_encode(R::exportAll($users)); 
    ///$users = $rb->find('users'); ///return json_encode($rb->exportAll($users));
});

//require __DIR__ .'/modules/user.php';
/*
class Router{
	//public $authRoutes = array('users' => 'users/getall', 'property' => 'value');
	//public $App;
	public function __constructor(){
		echo 'router __constructor';
		//$this->App = $sApp;
	}

	public function initAppRoutes ($app, $APIversion){
		//echo $APIversion;
		$self = $this;
		$app->get('/', function (Request $req,  Response $res, $args = []) {
		    return $res->withStatus(400)->write('Bad Request');
		});
		$app->get('/{something}', function (Request $req,  Response $res, $args = []) {
		    return $res->withStatus(400)->write('Bad Request');
		});

		$app->get('/'.$APIversion.'/home/get', function ($request, $response) {
		    $response->getBody()->write('home');
		    return $response;
		});

		
	}
   
}*/

/*
$app->get('/[{name}]', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");
    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});
*/

?>