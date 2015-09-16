<?php

/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

class ErMessenger
{
    private static $_instance;
    protected static $_msgstorage;

    private function __construct() {
        $maincfg = ErApplication::getMainCfg();
        self::$_msgstorage = $maincfg['application']['session']['messagestorage'];
    }
    private function __clone() {}

    /**
     * @return ErMessenger
     */

    public static function getInstance()
    {
        if (self::$_instance === null) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    public function setErrMessage($message)
    {
        ErSession::saveToSession('error', $message, self::$_msgstorage);
    }

    public function getErrMessage()
    {
        if(ErSession::getFromSession('error', self::$_msgstorage)){
            return ErSession::getFromSession('error', self::$_msgstorage);
        }
        return null;
    }

    public function setSucceedMessage($message)
    {
        ErSession::saveToSession('succeed', $message, self::$_msgstorage);
    }

    public function getSucceedMessage()
    {
        if(ErSession::getFromSession('succeed', self::$_msgstorage)){
            return ErSession::getFromSession('succeed', self::$_msgstorage);
        }
        return null;
    }

    public function setNotesMessage($message)
    {
        ErSession::saveToSession('notes', $message, self::$_msgstorage);
    }

    public function getNotesMessage()
    {
        if(ErSession::getFromSession('notes', self::$_msgstorage)){
            return ErSession::getFromSession('notes', self::$_msgstorage);
        }
        return null;
    }

    public function getAllMessages()
    {
        return ErSession::getStorage(self::$_msgstorage);
    }

    public function clearAllMessages()
    {
        ErSession::removeFromSession('error', self::$_msgstorage);
        ErSession::removeFromSession('succeed', self::$_msgstorage);
        ErSession::removeFromSession('notes', self::$_msgstorage);
    }
}