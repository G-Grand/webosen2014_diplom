<?php

class IndexController extends  IController {

    public function indexAction(){
        $render = RenderView::getInstance();
        $render->headerTitle = "EasyRide";
        $render->setMainHeader();
        $render->setMainFooter();
        $render->setViews(__CLASS__,$this->getMethodName(__METHOD__));
    }
}