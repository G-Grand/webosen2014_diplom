<?php

class IndexController extends  AbstractController {

    public function indexAction(){
        $message = ErMessenger::getInstance();
        $message->setSucceedMessage('Good news, its steel working!!!!' );
        $this->addBlockToView('Common', 'header');
        $this->addBlockToView('Common', 'footer');
        $this->initView(__FUNCTION__, null)->renderView();
    }


}