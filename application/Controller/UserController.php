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
        $this->addBlockToView('Common', 'header');
        $this->setViewAttributes('headerTitle', 'Login');
        $this->initView($this->getActionUrl())->renderView();
    }

    public function signupAction(){
        $this->addBlockToView('Common', 'header');
        $this->addBlockToView('Common', 'footer');
        $this->setViewAttributes('headerTitle', 'Sign up');
        $this->setViewAttributes('login_flag', false);
        $this->initView($this->getActionUrl())->renderView();
    }

    public function forgotAction(){
        $this->addBlockToView('Common', 'header');
        $this->addBlockToView('Common', 'footer');
        $this->setViewAttributes('headerTitle', 'Forgot');
        $this->initView($this->getActionUrl())->renderView();
    }

    public function authoriseAction()
    {
        $userMapper = new UserMapper();
        $request = new Request();
        $request->initRequest();
        $post = $request->getPost();
        $user = $userMapper->getUserByEmail($post["email"]);
        $givenPassword = $this->clearStr($post["userpassword"]);
        $givenPassword = hash("md5", $givenPassword);
        if($user->userpassword === $givenPassword){
            ErSession::saveToSession('user',$user->email);
            ErSession::saveToSession('username',$user->username);
            ErApplication::redirect(ErApplication::getBaseUrl() . 'index/index');
        }else{
            ErApplication::redirect(ErApplication::getBaseUrl() . 'user/signin');
        }
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
                                ErSession::saveToSession('username',$user->username);
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
        ErApplication::redirect(ErApplication::getBaseUrl() . 'index/index');
    }
}