<?php

class IndexController extends  AbstractController {

    public function indexAction(){
        $this->addBlockToView('Common', 'header');
        $this->addBlockToView('Common', 'footer');
        $this->initView(__FUNCTION__, null)->renderView();
    }


}