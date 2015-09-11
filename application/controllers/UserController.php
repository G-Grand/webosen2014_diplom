<?php

use \Entity\User;

class UserController extends  IController
{

    public function indexAction(){

    }

    public function loginAction()
    {
        $userMapper = new UserMapper();
        $request = new Request();
        $request->initRequest();
        $post = $request->getPost();
        $user = $userMapper->getUserByEmail($post["email"]);
        if($userMapper->authorizeUser($user, $post["userpassword"])){
            ERSession::saveToSession('user',$user->email);
            ERSession::saveToSession('username',$user->username);
            $this->setViewAttributes('header', 'Location: http://webosen2014_diplom/');
//            ERApplication::runController('IndexController', 'indexAction');
//            $url = 'http://' . ERApplication::getBaseUrl() . '/index/index';
            $url = 'http://' . ERApplication::getBaseUrl() . 'index/index';

            $ch = curl_init($url);

            curl_setopt($ch, CURLOPT_POST, 1);
//            curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
//            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            $response = curl_exec($ch);
            curl_close($ch);
        }else{
//            ERApplication::runController('UserController', 'signinAction');
        }
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