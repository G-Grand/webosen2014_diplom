<?php

class DatabaseCon {
    static private $_instance = null;
    public $connDB;
    private function __construct()
    {
        $mainCfg = ErApplication::getMainCfg();
        $host = $mainCfg["dbsettings"]["host"];
        $name = $mainCfg["dbsettings"]["name"];
        $login = $mainCfg["dbsettings"]["login"];
        $password = $mainCfg["dbsettings"]["password"];
        try {
            $this->connDB = new PDO("mysql:host=" . $host . ";dbname=" . $name , $login, $password);

            $stmt = $this->connDB->prepare("set_client='utf8'");
            $stmt->execute();
            $stmt = $this->connDB->prepare("set character_set_results='utf8'");
            $stmt->execute();
            $stmt = $this->connDB->prepare("set collation_connection='utf8_general_ci'");
            $stmt->execute();
            $stmt = $this->connDB->prepare("SET NAMES utf8");
            $stmt->execute();
        } catch (PDOException $e) {
            echo "Error!: " . $e->getMessage() . "<br/>";
            die();
        }
    }
    private function __clone() {}

    public static function getInstance()
    {
        if (null === self::$_instance) {
            self::$_instance = new self;
        }
        return self::$_instance;
    }
}