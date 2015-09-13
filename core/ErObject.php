<?php
/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

abstract class ErObject
{
    /** @var array */
    private $_attributes = array();

    /**
     * @param string $attrName
     * @param mixed $attribute
     */
    public function __set($attrName, $attribute)
    {
        $this->_attributes[$attrName] = $attribute;
    }

    /**
     * @param string $attrName
     * @return null
     */
    public function __get($attrName)
    {
        if (array_key_exists($attrName, $this->_attributes)) {
            return $this->_attributes[$attrName];
        }
        return null;
    }

    public function getAttributes()
    {
        return $this->_attributes;
    }
}