<?php

/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

class ErMessenger
{
    private static $_instance;
    protected $messages = array();

    private function __construct() {
        $this->messages = array(
            'error' => '',
            'succeed' => '',
            'notes' => ''
        );
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

    public function setErrMessage($errMessage)
    {
        $this->messages['error'] = $errMessage;
    }

    public function getErrMessage()
    {
        if(isset($this->messages['error'])){
            return $this->messages['error'];
        }
        return null;
    }

    public function setSucceedMessage($errMessage)
    {
        $this->messages['succeed'] = $errMessage;
    }

    public function getSucceedMessage()
    {
        if(isset($this->messages['succeed'])){
            return $this->messages['succeed'];
        }
        return null;
    }

    public function setNotesMessage($errMessage)
    {
        $this->messages['notes'] = $errMessage;
    }

    public function getNotesMessage()
    {
        if(isset($this->messages['notes'])){
            return $this->messages['notes'];
        }
        return null;
    }
}