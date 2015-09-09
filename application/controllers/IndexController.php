<?php

class IndexController extends  IController {

    public function indexAction(){
        $this->addBlockToView('Common', 'header');
        $this->addBlockToView('Common', 'footer');
        $this->initView(__FUNCTION__)->renderView();
    }
}