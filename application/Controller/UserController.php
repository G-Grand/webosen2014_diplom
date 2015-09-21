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
        $msg->setNotesMessage('Massage from User Index', 'user/index');
        $this->addBlockToView('Common', 'header');
        ErApplication::redirect(ErApplication::getBaseUrl());
    }

    public function loginAction(){
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
        $givenPassword = trim(strip_tags($post["userpassword"]));
        $givenPassword = hash("md5", $givenPassword);
        if($user->userpassword === $givenPassword){
            ErSession::saveToSession('user',$user->email);
            ErSession::saveToSession('username',$user->username);
            ErApplication::redirect(ErApplication::getBaseUrl() . 'index/index');
        }else{
            ErApplication::redirect(ErApplication::getBaseUrl() . 'user/signin');
        }
    }

//    public function registerAction()
//    {
//        $userMapper = new UserMapper();
//        $message = ErMessenger::getInstance();
//        $request = new Request();
//        $request->initRequest();
//        $post = $request->getPost();
//        $user = new User();
//        $user->email = $post['email'];
//        $user->crdate = date("Y-m-d");
//        $user->access = 'ps';
//        $givenPassword = trim(strip_tags($post["userpassword"]));
//        $user->userpassword = hash("md5", $givenPassword);
//        if($userMapper->insertNewUser($user)){
//            ErSession::saveToSession('user',$user->email);
//            ErSession::saveToSession('username',$user->username);
//            $message->setSucceedMessage('HURAAAAAAA!!!!!!!');
//            ErApplication::redirect(ErApplication::getBaseUrl() . 'index/index');
//        }else{
//            echo "Error create new user ";
//        }
//    }

    public function registerAction() {
        if(isset($_SERVER['HTTP_X_REQUESTED_WITH'])
            && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'){
            $ajax = true;
        }
        $request = new Request();
        $request->initRequest();
        $post = $request->getPost();
        if(isset($post)){
            if (!empty($post['email']) && !empty($post['password']) && !empty($post['pass_confirm'])
                && !empty($post['captcha'])) {
                $userMapper = new UserMapper();
                $user = $userMapper->getUserByEmail($post["email"]);
                if(!$user){
                    $user = new User();
                    $userMapper = new UserMapper();
                    $user->email = $post['email'];
                    $user->crdate = date("Y-m-d");
                    $user->access = 'ps';
                    $givenPassword = trim(strip_tags($post["password"]));
                    $user->userpassword = hash("md5", $givenPassword);
                    if ($userMapper->insertNewUser($user)) {
                        echo '{"response": "ok"}';
                    } else {
                        echo '{"response": "bad"}';
                    }
                }else {
                    echo '{"response": {"status":"bad","msg":"Ай вай такой юзер уже есть!!!"}}';
                }
            }
        }
    }

    public function logoutAction()
    {
        ErSession::dieSession();
        ErApplication::redirect(ErApplication::getBaseUrl() . 'index/index');
    }

    public function findAction(){
        $userMapper = new UserMapper();
        $request = new Request();
        $request->initRequest();
        $post = $request->getPost();
        $params = $userMapper->getUserByEmail($post["email"]);
        $this->addBlockToView('Common', 'header');
        $this->addBlockToView('Common', 'footer');
        $this->setViewAttributes('headerTitle', 'Find by email');
        $this->initView(__FUNCTION__, null, $params)->renderView();
    }

    public function findOldAction()
    {
        $userMapper = new UserMapper();
        $userScope = new QueryScope("user");
        $userScope->setFields(array("email", "username", "birthday"));

        $userCond = new QueryCondition("user");
        $userCond->setConditions(array(
            new QueryConditionMember("email", "j@i.ua", "="),
            new QueryConditionMember("username", "John", "=", "and"),
//            new QueryConditionMember("surname", array("Петров", "Лепс"), "in", "or")
        ));

        $userMapper->addQueryScope($userScope);
        $userMapper->addQueryCondition($userCond);
        $userMapper->select();
    }

    public function showAllAction()
    {
    }

    public function insertAction()
    {
        $userMapper = new UserMapper();
        $userScope = new QueryScope("user");
        $userScope->setFields(array("email", "userpassword", "crdate", "access"));
        $userScope->setValues(array("d@i.ua", "111", "2015-06-17", "ps"));
        $userMapper->addQueryScope($userScope);
        $userMapper->insert();
    }

    public function updateAction()
    {
        $userMapper = new UserMapper();
        $userScope = new QueryScope("user");
        $userScope->setFields(array("username", "birthday"));
        $userScope->setValues(array("Kolya", "2000-06-20"));

        $userCond = new QueryCondition("user");
        $userCond->setConditions(array(
            new QueryConditionMember("email", "d@i.ua", "="),
        ));

        $userMapper->addQueryScope($userScope);
        $userMapper->addQueryCondition($userCond);

        $userMapper->update();

    }

    public function removeAction()
    {
        $userMapper = new UserMapper();

        $userCond = new QueryCondition("user");
        $userCond->setConditions(array(
            new QueryConditionMember("email", "d@i.ua", "="),
        ));

        $userMapper->addQueryCondition($userCond);

        $userMapper->remove();
    }


}