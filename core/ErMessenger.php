<?php

/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

class ErMessenger extends ErObject
{
    private static $_instance;
    protected static $_msgstorage;
    private $msgData = array();

    private function __construct() {
        $maincfg = ErApplication::getMainCfg();
        self::$_msgstorage = $maincfg['application']['session']['messagestorage'];
        $msgPath = ErApplication::fileExists('msg.data', 'php');
        if(!empty($msgPath)){$this->msgData = require_once $msgPath;}
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

    private function fetchMessage($type, $msgKey)
    {
        $msgData = $this->msgData;
        return array_search($msgKey, $msgData[$type]);
    }

    private function setMessage($type, $message, $url)
    {
        $allMessages = $this->getAllMessages();
        $allMessages[$type][$url] = $message;
        $this->clearAllMessages();
        ErSession::saveToSession(self::$_msgstorage, $allMessages);
    }

    private function getMessage($type, $url)
    {
        $allMessages = $this->getAllMessages();
        if(isset($allMessages[$type][$url])){
            $msgKey = $this->arrayCut($allMessages[$type], $url);
            $this->clearAllMessages();
            ErSession::saveToSession(self::$_msgstorage, $allMessages);
            return $this->fetchMessage($type, $msgKey);
        }
        return null;
    }

    public function setErrMessage($message, $url)
    {
        $this->setMessage('error', $message, $url);
    }

    public function getErrMessage($url)
    {
        return $this->getMessage('error',$url);
    }

    public function setSucceedMessage($message, $url)
    {
        $this->setMessage('succeed', $message, $url);
    }

    public function getSucceedMessage($url)
    {
        return $this->getMessage('succeed',$url);
    }

    public function setNotesMessage($message, $url)
    {
        $this->setMessage('notes', $message, $url);
    }

    public function getNotesMessage($url)
    {
        return $this->getMessage('notes',$url);
    }

    public function getAllMessages()
    {
        return ErSession::getFromSession(self::$_msgstorage);
    }

    public function clearAllMessages()
    {
        $messages = $this->getAllMessages();
        if(isset($messages)){
            foreach($messages as $key => $val){
              ErSession::removeFromSession($key, self::$_msgstorage);
            }
        }
    }
}