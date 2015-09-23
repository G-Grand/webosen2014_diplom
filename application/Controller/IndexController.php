<?php
use Entity\User;

class IndexController extends  AbstractController {

    public function indexAction(){
        $message = ErMessenger::getInstance();
        $message->setErrMessage('101', $this->getActionUrl());
        $message->setSucceedMessage('202', $this->getActionUrl());
        $message->setNotesMessage('303', $this->getActionUrl());
        $this->addBlockToView('Common', 'header');
        $this->addBlockToView('Common', 'footer');
        $this->initView($this->getActionUrl())->renderView();
    }

    public function findAction() {
        $this->addBlockToView('Common', 'header');
        $this->initView($this->getActionUrl())->renderView();
    }

    public function testAction()
    {
//        $user = new Entity\User();
//        $mapper = new UserMapper();
        $mapper = new RoadMapper();
//        $user->email = 'df@e.ua';
//        $user->userpassword = hash('md5', '111');
//        $user->crdate = '2015-12-12';
//        $user->access = 'ps';
//        $user->rate = '200';
//        echo ($mapper->validate($user)) ? "OK" : "BAD";
//        $user = $mapper->getUserByEmail('john@i.ua');
//        var_dump($user);
//        echo $user->getAge();
        $road = $mapper->getRoutPointsByRoad('20150221');
        var_dump($road);

    }
}