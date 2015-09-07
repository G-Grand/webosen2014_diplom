<?php
abstract class IController
{
    abstract public function indexAction();

    protected  function getMethodName($method){
        $result = explode("::", $method);
        return $result[1];
    }

}