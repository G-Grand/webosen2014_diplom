<?php


namespace Entity;


abstract class AbstractEntity {
    public static $_dataTypes = array();

    abstract public function _construct();
    public function __construct()
    {
        $this->_construct();
    }

    /**
     * @return array
     */
    public function getDataTypes()
    {
        return self::$_dataTypes;
    }


}