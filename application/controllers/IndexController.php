<?php

class IndexController extends  IController {

    public function indexAction(){
        $this->initView(__METHOD__)->renderView();
    }
}