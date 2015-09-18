<?php

abstract class AbstractMapper
{
    private $queryScopes = array();
    private $queryConditions = array();


    protected $db;

    function __construct()
    {
        $this->db = DatabaseCon::getInstance()->connDB;
    }

    abstract public function validate();

    public function addQueryScope(QueryScope $queryScope) { $this->queryScopes[] = $queryScope; }

    public function addQueryCondition(QueryCondition $queryCondition) { $this->queryConditions[] = $queryCondition; }


    /**
     * Prepare PDO statement
     *
     */

    private function initQueryStatement(QueryConstructor $query){
        $query->queryInit();
        $prepStmt = $this->db->prepare($query->_query);
        foreach ($query->_bindVal as $name => $value) {
            $prepStmt->bindValue(":$name", $value);
        }
        return $prepStmt;
    }

    /**
     * INSERT method
     *
     */

    public function insert()
    {
        $query = new QueryConstructor("insert", $this->queryScopes, $this->queryConditions);
        $prep = $this->initQueryStatement($query);

        if($prep->execute()){
            return true;
//            echo "<br /> OOOOOOOOOOOK <br />";
        }else {
//            echo "<br /> BAAAAAD <br />";
            return false;
        }
    }

    /**
     * REMOVE record method
     *
     */

    public function remove()
    {
        $query = new QueryConstructor("remove", $this->queryScopes, $this->queryConditions);
        $prep = $this->initQueryStatement($query);

        if($prep->execute()){
//            echo "<br /> OOOOOOOOOOOK <br />";
        }else echo "<br /> BAAAAAD <br />";
    }

    /**
     * UPDATE record method
     *
     */

    public function update()
    {
        $query = new QueryConstructor("update", $this->queryScopes, $this->queryConditions);
        $prep = $this->initQueryStatement($query);

        if($prep->execute()){
//            echo "<br /> OOOOOOOOOOOK <br />";
        }else echo "<br /> BAAAAAD <br />";
    }

/**
 * SELECT method
 * @queryScopes is array of QueryScope objects; @queryConditions is array of QueryConditions objects
 */
    public function select()
    {
        $query = new QueryConstructor("select", $this->queryScopes, $this->queryConditions);
        $prep = $this->initQueryStatement($query);

        if($prep->execute()){
//            echo "<br /> OOOOOOOOOOOK <br />";
        }else echo "<br /> BAAAAAD <br />";
        return $prep;
    }


}