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
        if($this->validate($user)){
            $userScope = new QueryScope("user");
            $userScope->setFields(array("email", "userpassword", "crdate", "access", "userstatus"));
            $userScope->setValues(array($user->email, $user->userpassword, $user->crdate, $user->access, $user->userstatus));
            $this->addQueryScope($userScope);
            return $this->insert();
        }
        return false;
    }

    public function updateUser(User $user)
    {
        if($this->validate($user)){

            $userScope = new QueryScope("user");
            $userScope->setFields(array(
                "username",
                "surname",
                "birthday",
                "gendor",
                "phone",
                "userpassword"
            ));
            $userScope->setValues(array(
                $user->username,
                $user->surname,
                $user->birthday,
                $user->gendor,
                $user->phone,
                $user->userpassword
            ));

            $userCond = new QueryCondition("user");
            $userCond->setConditions(array(
                new QueryConditionMember("email", $user->email, "="),
            ));

            $this->addQueryScope($userScope);
            $this->addQueryCondition($userCond);
            return $this->update();
        }
        return false;
    }
}

