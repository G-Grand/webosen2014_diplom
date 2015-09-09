<?php

use \Entity;

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
        if($userMapper->authorizeUser($user, $post["password"]));

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