<?php

class DatabaseCon {
    static private $_instance = null;
    public $connDB;
    private function __construct()
    {
        $mainCfg = ERApplication::getMainCfg();
        $host = $mainCfg["dbsettings"]["host"];
        $name = $mainCfg["dbsettings"]["name"];
        $login = $mainCfg["dbsettings"]["login"];
        $password = $mainCfg["dbsettings"]["password"];
        try {
            $this->connDB = new PDO("mysql:host=" . $host . ";dbname=" . $name , $login, $password);
//            $this->connDB = new PDO("mysql:host=localhost;dbname=easyride_db", "root", "");
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