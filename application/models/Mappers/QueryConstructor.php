<?php

class QueryConstructor
{
    public $_query = "";
    public $_bindVal = array();
    private $queryScopes = array();
    private $queryConditions = array();
    private $queryAction;

    function __construct($queryAction, $queryScopes, $queryConditions)
    {
        $this->queryAction = $queryAction;
        $this->queryScopes = (isset($queryScopes)) ? $queryScopes : null;
        $this->queryConditions = (isset($queryConditions)) ? $queryConditions : null;
    }

    /**
     * INIT query by action name
     *
     */

    public function queryInit()
    {
        $queryAction = $this->queryAction;
        $this->$queryAction();
    }

    /**
     * Make WHERE query string
     *
     */

    private function setWhereBlock()
    {
        $where = " WHERE ";
        foreach ($this->queryConditions as $queryCondition){
            $dbTable = $queryCondition->getDbTable();
            foreach ($queryCondition->getConditions() as $qcond) {
                if ($qcond->clause != "") {
                    $where = (substr($where, -2) != ", ") ? $where : substr($where, 0, -2) . " ";
                    $where .= strtoupper($qcond->clause) . " ";
                };
                switch ($qcond->operator) {
                    case "in":
                        $whereStr = "";
                        $i = 1;
                        $whereStr .= $dbTable . "." . $qcond->field . " IN(";
                        foreach ($qcond->value as $val) {
                            $whereStr .= ":" . $dbTable . "_" . $qcond->field . $i . ", ";
                            $bindVal[$dbTable . "_" . $qcond->field . $i] = $val;
                            $i++;
                        }
                        $where .= substr($whereStr, 0, -2) . "), ";
                        break;

                    case "like":
                        $where .= $dbTable . "." . $qcond->field . " LIKE :" . $dbTable . "_" . $qcond->field . ", ";
                        $bindVal[$dbTable . "_" . $qcond->field] = $qcond->value;
                        break;

                    case "between":
                        $where .= $dbTable . "." . $qcond->field . " BETWEEN :" . $dbTable . "_" . $qcond->field . "1" .
                            " AND :" . $dbTable . "." . $qcond->field . "2" . ", ";
                        $bindVal[$dbTable . "_" . $qcond->field . "1"] = $qcond->value[0];
                        $bindVal[$dbTable . "_" . $qcond->field . "2"] = $qcond->value[1];
                        break;

                    default :
                        $where .= $dbTable . "." . $qcond->field . $qcond->operator . " :" . $dbTable . "_" . $qcond->field . ", ";
                        $bindVal[$dbTable . "_" . $qcond->field] = $qcond->value;

                }
            }
            return array(substr($where, 0, -2), $bindVal);
        }
    }

    /**
     * Make SELECT query string
     *
     */

    private function select()
    {
        $query = "SELECT ";
        $from = " FROM ";
        $bindVal = array();
        foreach ($this->queryScopes as $qscope){
            $dbTable = $qscope->getDbTable();
            $from .= $dbTable . ", ";
            foreach($qscope->getFields() as $field) {
                $query .= $dbTable . "." . $field . ", ";
            }
        }
        $query = substr($query, 0, -2);
        $where = $this->setWhereBlock();
        $this->_query = $query . substr($from, 0, -2) . $where[0];
        $this->_bindVal = $where[1];
    }

    /**
     * Make INSERT query string
     *
     */

    private function insert()
    {
        $query = "INSERT INTO " . $this->queryScopes[0]->getDbTable() . " (";
        $values = " VALUES (";
        $bindVal = array();
        $scopeVals = array();

        foreach ($this->queryScopes as $qscope){
            $i = 0;
            $scopeVals = $qscope->getValues();
            foreach($qscope->getFields() as $field) {
                $query .= $field . ", ";
                $values .= ":" . $field . ", ";
                $bindVal[$field] = $scopeVals[$i];
                $i++;
            }
        }
        $this->_query = substr($query, 0, -2) . ") " . substr($values, 0, -2) . ")";
        $this->_bindVal = $bindVal;
    }

    /**
     * Make DELETE query string
     *
     */

    private function remove()
    {
        $query = "DELETE FROM " . $this->queryConditions[0]->getDbTable();
        $where = $this->setWhereBlock();
        $this->_query = $query . $where[0];
        $this->_bindVal = $where[1];
    }

    /**
     * Make UPDATE query string
     *
     */

    private function update()
    {

        $query = "UPDATE " . $this->queryScopes[0]->getDbTable() . " SET ";
        $scopeVals = array();

        foreach ($this->queryScopes as $qscope){
            $i = 0;
            $scopeVals = $qscope->getValues();
            foreach($qscope->getFields() as $field) {
                $query .= $field . "=:" . $field . ", ";
                $bindVal[$field] = $scopeVals[$i];
                $i++;
            }
        }
        $query = substr($query, 0, -2);

        $where = $this->setWhereBlock();
        $this->_query = $query . $where[0];

        foreach($where[1] as $field => $val){
            $bindVal[$field] = $val;
        }
        $this->_bindVal = $bindVal;
    }
}