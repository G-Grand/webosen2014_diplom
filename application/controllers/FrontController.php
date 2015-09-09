<?php

class FrontController
{
    private static  $_instance;
    private $defaultRoute = array();

    private function __construct() {
        $maincfg = ERApplication::getMainCfg();
        $this->defaultRoute['controller'] = $maincfg["routing"]["default_controller"];
        $this->defaultRoute['action'] = $maincfg["routing"]["default_action"];
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

    public function fetchController()
    {
        $request = new Request();
        $request->initRequest();
        $path = explode("/", $request->getPath());
        $ctrl =  (!empty($path[0])) ? (ucfirst($path[0]) . "Controller") : $this->defaultRoute['controller'];
        $action =  (!empty($path[1])) ? ($path[1] . "Action") : $this->defaultRoute['action'];
        return array('controller' => $ctrl, 'action' => $action);
    }

    public function run()
    {
        $controller = $this->fetchController();
        if (!ERApplication::runController($controller['controller'], $controller['action'])) {
            ERApplication::runController($this->defaultRoute['controller'], $this->defaultRoute['action']);
        }
    }
}