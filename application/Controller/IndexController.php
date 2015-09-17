<?php

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
}