<?php
use \Entity\User;

class UserMapper extends Mapper
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
//        return $this->select()->fetch(PDO::FETCH_ASSOC);
        return $this->select()->fetchObject('User');

    }

    public function authorizeUser(User $user, $password)
    {
        $password = hash("md5", $password);
        return ($user->userpassword === $password) ? true : false;
    }
}

