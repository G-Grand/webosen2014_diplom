<?php
use \Entity\User;

class UserMapper extends AbstractMapper
{

    function __construct() { parent::__construct(); }

    public function getUserByEmail($email)
    {
        $userScope = new QueryScope("user");
        $userScope->setFields(array("*"));

        $userCond = new QueryCondition("user");
        $userCond->setConditions(array(
            new QueryConditionMember("email", $email, "="),
        ));

        $this->addQueryScope($userScope);
        $this->addQueryCondition($userCond);
        return $this->select()->fetchObject('\Entity\User');

    }

    public function insertNewUser(User $user)
    {
        $userScope = new QueryScope("user");
        $userScope->setFields(array("email", "userpassword", "crdate", "access"));
        $userScope->setValues(array($user->email, $user->userpassword, $user->crdate, "ps"));
        $this->addQueryScope($userScope);
        return $this->insert();
    }
}

