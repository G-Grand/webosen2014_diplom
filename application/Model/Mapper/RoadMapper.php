<?php
/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

class RoadMapper extends AbstractMapper
{
    public function getByStartFinish($start, $finish)
    {
        $roadScope = new QueryScope("roadrout");
        $roadScope->setFields(array("*"));

        $roadCond = new QueryCondition("roadrout");
        $roadCond->setConditions(array(
            new QueryConditionMember("start", $start, "="),
            new QueryConditionMember("finish", $finish, "=", 'AND')
        ));

        $this->addQueryScope($roadScope);
        $this->addQueryCondition($roadCond);

        return $this->select()->fetchAll(PDO::FETCH_ASSOC);
//        return $this->select();
    }
}