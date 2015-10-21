<?php
/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

use \Entity\User;

class UserController extends  AbstractController
{

    public function indexAction(){
        $msg = ErMessenger::getInstance();
        $msg->setNotesMessage('101', 'user/index');
        $this->addBlockToView('Common', 'header');
        ErApplication::redirect(ErApplication::getBaseUrl());
    }

    public function signinAction(){
        $this->addBlockToView('Common', 'header_no_menu');
        $this->setViewAttributes('headerTitle', 'Sign in');
        $this->setViewAttributes('add_js', array('registr.js'));
        $this->initView($this->getActionUrl())->renderView();
    }

    public function signupAction(){
        $this->addBlockToView('Common', 'header_no_menu');
        $this->setViewAttributes('headerTitle', 'Sign up');
        $this->setViewAttributes('add_js', array('registr.js'));
        $this->initView($this->getActionUrl())->renderView();
    }

    public function forgotAction(){
        $this->addBlockToView('Common', 'header_no_menu');
        $this->setViewAttributes('headerTitle', 'Forgot');
        $this->initView($this->getActionUrl())->renderView();
    }

    public function privateAction(){
        $this->addBlockToView('Common', 'header');
        $this->addBlockToView('Common', 'footer');
        $this->setViewAttributes('headerTitle', 'Private');
        $this->setViewAttributes('add_js', array('private.js'));
        $this->setViewAttributes('add_css', array('animate.css'));
        $this->initView($this->getActionUrl())->renderView();

    }

    public function authoriseAction()
    {
        $message = ErMessenger::getInstance();
        $userMapper = new UserMapper();
        $request = new Request();
        $request->initRequest();
        $post = $request->getPost();
        $user = $userMapper->getUserByEmail($post["email"]);
        $givenPassword = $this->clearStr($post["userpassword"]);
        $givenPassword = hash("md5", $givenPassword);
        $response = array();
        if(!empty($user)){
            if($user->userpassword === $givenPassword){
                ErSession::saveToSession('user',$user->email);
                ErSession::saveToSession('username',$user->username);
//                ErApplication::redirect(ErApplication::getBaseUrl() . 'index/index');
                $response['signin'] = 'true';
            }else{
                $response['signin'] = 'false';
                $message->setErrMessage('105', 'user/signin');
//                ErApplication::redirect(ErApplication::getBaseUrl() . 'user/signin');
            }
        }else{
            $response['signin'] = 'false';
            $message->setErrMessage('105', 'user/signin');
        }
        echo json_encode($response);
    }

    public function registerAction() {
        Request::ajax();
        $message = ErMessenger::getInstance();
        $request = new Request();
        $request->initRequest();
        $post = $request->getPost();
        if(isset($post)){
            if (!empty($post['email']) && !empty($post['password']) && !empty($post['pass_confirm'])
                && !empty($post['captcha'])) {
                $userMapper = new UserMapper();
                $user = $userMapper->getUserByEmail($post["email"]);
                if(!$user){
                    if(Captcha::verify()) {
                        $givenEmail = $this->clearStr($post['email']);
                        $givenPassword = $this->clearStr($post["password"]);
                        if(filter_var($givenEmail, FILTER_VALIDATE_EMAIL)){
                            $user = new User();
                            $userMapper = new UserMapper();
                            $user->email = $givenEmail;
                            $user->crdate = date("Y-m-d");
                            $user->access = 'ps';
                            $user->userstatus = 1;
                            $user->userpassword = hash("md5", $givenPassword);
                            if ($userMapper->insertNewUser($user)) {
                                $message->setSucceedMessage('201', 'index/index');
                                ErSession::saveToSession('user',$user->email);
                                if($user->username != null){
                                    ErSession::saveToSession('username',$user->username);
                                }
                            } else {
                                $message->setErrMessage('101', 'user/signup');
                            }
                        }else $message->setErrMessage('103', 'user/signup');;
                    }else $message->setErrMessage('104', 'user/signup');;
                }else {
                    $message->setErrMessage('102', 'user/signup');
                }
            }
        }
    }

    public function logoutAction()
    {
        ErSession::dieSession();
        ErApplication::redirect(ErApplication::getBaseUrl());
    }

    protected function fetchUserData($userEmail)
    {
        $result = array();
        $userMapper = new UserMapper();
        $carMapper = new CarMapper();
        $routeMapper = new RoadMapper();
        $currentUser = $userMapper->getUserByEmail($userEmail);
        $userCars = $carMapper->getByUser($userEmail);
        $userRoutes = $routeMapper->getByUser($userEmail);
        $routes = array();
        $carMapper->clear();
        $i = 0;
        foreach($userRoutes as $route){
            $routes[$i] = get_object_vars($route);
            $_car = $carMapper->getByAutoId($route->autoid);
            $routes[$i]['car'] = get_object_vars($_car);
            $carMapper->clear();
            ++$i;
        }
        $cars = array();
        foreach($userCars as $car){ $cars[] = get_object_vars($car); }
        $result['user'] = get_object_vars($currentUser);
        $result['user']['age'] = $currentUser->getAge();
        $result['cars'] = $cars;
        $result['routes'] = $routes;
        return $result;
    }

    public function getPersonalDataAction()
    {
        $message = ErMessenger::getInstance();
        $userEmail = ErSession::getFromSession('user');
        if (isset($userEmail)) {
            echo  json_encode($this->fetchUserData($userEmail));
        } else {
            $message->setNotesMessage('303', 'index/index');
            ErApplication::redirect(ErApplication::getBaseUrl());
        }

    }

    public function saveAction()
    {
        $message = ErMessenger::getInstance();
        $request = new Request();
        $request->initRequest();
        $post = $request->getPost();
        if(isset($post)){
            $userEmail = ErSession::getFromSession('user');
            $userMapper = new UserMapper();
            $user = $userMapper->getUserByEmail($userEmail);
            $user->username = $this->clearStr($post['username']);
            $user->surname = $this->clearStr($post['surname']);
            $user->birthday = $this->clearStr($post['birthday']);
            $user->gendor = $this->clearStr($post['gendor']);
            $user->phone = $this->clearStr($post['phone']);
            if ($post['password_changed']){
                $user->userpassword = hash("md5", $this->clearStr($post['userpassword']));
            }
            $userMapper->clear();
            if ($userMapper->updateUser($user)) {
                $message->setSucceedMessage('202', 'user/private');
            } else {
                $message->setErrMessage('100', 'user/private');
            }
            echo  json_encode($this->fetchUserData($userEmail));
        }
    }

}