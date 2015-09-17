<?php

/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

class ErSession
{
    private static $_storage;
    public static function startSession()
    {
        if(!$_SESSION) { session_start(); }
        $maincfg = ErApplication::getMainCfg();
        self::$_storage = $maincfg['application']['session']['mainstorage'];
    }

    private static function initStorage($storage)
    {
        return ($storage) ? $storage : self::$_storage;
    }

    public static function dieSession()
    {
        setcookie(session_name(), '', time() - 42000);
        session_destroy();
    }

    public static function saveToSession($name, $value, $storage=null)
    {
        if(!$_SESSION){self::startSession(); }
        $storage = ($storage) ? $storage : self::$_storage;
        $_SESSION[$storage][$name] = $value;
    }

    public static function getFromSession($name, $storage=null)
    {
        $storage = self::initStorage($storage);
        if($_SESSION[$storage]){
            return $_SESSION[$storage][$name];
        }
        return null;
    }

    public static function removeFromSession($name, $storage=null)
    {
        $storage = self::initStorage($storage);
        if($_SESSION[$storage] && $_SESSION[$storage][$name]){
            unset($_SESSION[$storage][$name]);
        }
    }

    public static function getStorage($storage=null)
    {
        if(!$storage){
            return $_SESSION[self::$_storage];
        }
        return self::getFromSession($storage);
    }
}