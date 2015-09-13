<?php

class QueryCondition
{
    private $conditions = array();
    private $dbTable;

    public function __construct($entity)
    {
        $mainCfg =ErApplication::getInstance()->getMainCfg();
        $this->dbTable =  $mainCfg["dbsettings"]["tableprefix"] . strtolower($entity);
    }

    public function getConditions() { return $this->conditions; }
    public function setConditions(array $conditions) { $this->conditions = $conditions; }

    public function getDbTable() { return $this->dbTable; }




}