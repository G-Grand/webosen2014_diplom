<?php

class FrontController
{
    private static  $_instance;
    private static  $_maincfg;

    private function __construct() {
        self::$_maincfg = ERApplication::getMainCfg();
    }

    private function __clone() {}

    /**
     * @return FrontController
     */

    public static function getInstance()
    {
        if (self::$_instance === null) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    /**
     * Get default controller name
     */

    private function getDefaultController(){
        return self::$_maincfg["routing"]["default_controller"];
    }

    /**
     * Get default action name
     */

    private function getDefaultAction(){
        return self::$_maincfg["routing"]["default_action"];
    }

    /**
     * Initialise controller from request
     */

    public function run()
    {
        $request = new Request();
        $request->initRequest();
        $path = explode("/", $request->getPath());
        $ctrl =  (!empty($path[0])) ? (ucfirst($path[0]) . "Controller") : $this->getDefaultController();
        $action =  (!empty($path[1])) ? ($path[1] . "Action") : $this->getDefaultAction();
//        echo $ctrl . "<br />" . $action;
        $render = RenderView::getInstance();
        if (class_exists($ctrl)) {
            $controller = new $ctrl();
            if (method_exists($ctrl, $action)) {
                $controller->$action();
                echo $render->renderBody();
            }else{
                $render->setViews('IndexController', 'error404');
                echo $render->renderBody();
            }
        }else {
            $render->setViews('IndexController', 'error404');
            echo $render->renderBody();
        }
    }
}