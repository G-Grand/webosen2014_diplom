<?php

/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

class ERSession
{
    private static $_storage;
    public static function startSession()
    {
        if(!$_SESSION) { session_start(); }
        $maincfg = ERApplication::getMainCfg();
        self::$_storage = $maincfg['application']['session']['mainstorage'];
    }

    public static function saveToSession($name, $value, $storage=null)
    {
        if(!$_SESSION){self::startSession(); }
        $storage = ($storage) ? $storage : self::$_storage;
        $_SESSION[$storage][$name] = $value;
    }

    public static function getFromSession($name, $storage=null)
    {
        $storage = ($storage) ? $storage : self::$_storage;
        if($_SESSION[$storage]){
            return $_SESSION[$storage][$name];
        }
        return null;
    }
}