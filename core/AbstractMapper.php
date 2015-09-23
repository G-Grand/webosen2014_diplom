<?php
use Entity\AbstractEntity;

abstract class AbstractMapper
{
    private $queryScopes = array();
    private $queryConditions = array();


    protected $db;

    function __construct()
    {
        $this->db = DatabaseCon::getInstance()->connDB;
    }

    public function validate(AbstractEntity $entity)
    {
        $entityTypes = $entity->getDataTypes();
        foreach($entityTypes as $key => $type){
            echo $key . '->' . gettype($entity->$key) . '==' . $type['type'] . '<br />';
            $type['nullable'] = (isset($type['nullable'])) ? $type['nullable'] : true;
            if(!$type['nullable'] && !isset($entity->$key)){
                return false;
            }
            if($type['nullable'] && empty($entity->$key)){continue;}
            switch($type['type']){
                case "date":
                    if(!preg_match('/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/',$entity->$key)){
                        return false;
                    }
                    break;
                case "datetime":
                    if(!preg_match('/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1]) (20|21|22|23|[0-1]?\d{1}):([0-5]?\d{1})$/',$entity->$key)){
                        return false;
                    }
                    break;
                case "time":
                    if(!preg_match('/^(20|21|22|23|[0-1]?\d{1}):([0-5]?\d{1})$/',$entity->$key)){
                        return false;
                    }
                    break;
                case "string":
                    if(gettype($entity->$key) != $type['type']){
                        return false;
                    }
                    break;
                case "int":
                    if(!preg_match('/\d+$/',$entity->$key)){
                        return false;
                    }
                    break;
                case "decimal":
                    if(!preg_match('^[0-9]+[\\.\\,]{1}[0-9]+$',$entity->$key)){
                        return false;
                    }
                    break;
            }

            if($type['size']){
                if(strlen($entity->$key) > $type['size']){return false;}
            }
        }
        return true;
    }

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
        }else {echo "<br /> BAAAAAD <br />" . $query->_query . "<br />"; var_dump($query->_bindVal);}
        return $prep;
    }

    public function clear()
    {
        unset($this->queryScopes);
        unset($this->queryConditions);
    }


}