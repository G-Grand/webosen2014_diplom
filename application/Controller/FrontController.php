<?php

class FrontController
{
    private static  $_instance;
    private $defaultRoute = array();

    private function __construct() {
        $maincfg = ErApplication::getMainCfg();
        $this->defaultRoute['Controller'] = $maincfg["routing"]["default_controller"];
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
        $ctrl =  (!empty($path[0])) ? (ucfirst($path[0]) . "Controller") : $this->defaultRoute['Controller'];
        $action =  (!empty($path[1])) ? ($path[1] . "Action") : $this->defaultRoute['action'];
        return array('Controller' => $ctrl, 'action' => $action);
    }

    public function run()
    {
        $controller = $this->fetchController();
        if (!ErApplication::runController($controller['Controller'], $controller['action'])) {
            ErApplication::runController($this->defaultRoute['Controller'], 'page404Action');
        }
    }
}