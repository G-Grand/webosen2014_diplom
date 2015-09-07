<?php

class ERApplication{
    private static  $_instance = null;
    private $_paths = array();
    private static $_mainCfg = array();
    private $_fc = null;

    private function __construct()
    {
        self::$_mainCfg = require_once "config/main.cfg.php";
    }
    private function __clone() {}

    /**
     * Get ERApplication instance
     */

    public static  function getInstance()
    {
        if (self::$_instance === null) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    /**
     * File e
     */

    public static function fileExists($file, $ext)
    {
        $includePath = get_include_path();
        $pathes = explode(PATH_SEPARATOR, $includePath);
        foreach($pathes as $path){
            $path = $path . DIRECTORY_SEPARATOR . $file . "." . $ext;
            if (file_exists($path)){
                return true;
            }
        }
        return false;
    }

    /**
     * Autoload class method
     */

    private function setAutoload()
    {
        spl_autoload_register(function($className){
            $className = str_replace("\\", DIRECTORY_SEPARATOR, $className);
            if(ERApplication::fileExists($className,"php")){
                spl_autoload($className);
            }
        });
    }

    /**
     * Initialise application
     */

    public function init()
    {
        $this->_paths = self::$_mainCfg['application']['paths'];
        $this->setIncludePath($this->_paths);
        $this->setAutoload();
        $this->_fc = FrontController::getInstance();
    }

    /**
     * Set include path for application
     */

    private function setIncludePath(array $paths)
    {
        $pathStr = "";
        foreach ($paths as $path) {
            $pathStr .= PATH_SEPARATOR.$path;
        }
        set_include_path(get_include_path().$pathStr);
    }

    /**
     * Get FrontController instance
     */

    public function getFC() {return $this->_fc;}

    /**
     * Get main configuration data
     */

    public static function getMainCfg() {return self::$_mainCfg;}


}