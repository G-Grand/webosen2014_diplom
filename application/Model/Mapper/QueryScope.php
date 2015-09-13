<?php

class QueryScope
{
    private $fields;
    private $values;
    private $dbTable;

    public function __construct($entity)
    {
        $mainCfg =ErApplication::getInstance()->getMainCfg();
        $this->dbTable =  $mainCfg["dbsettings"]["tableprefix"] . strtolower($entity);
    }

    public function setFields(array $fields) { $this->fields = $fields; }
    public function getFields() { return $this->fields; }

    public function setValues(array $values) { $this->values = $values; }
    public function getValues() { return $this->values; }

    public function getDbTable() { return $this->dbTable; }
}