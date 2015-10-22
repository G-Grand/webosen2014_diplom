<?php
/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

use Entity\User;
use Entity\Roadrout;
use Entity\RoutPoint;

class RoadMapper extends AbstractMapper
{
    public function getByStartFinish($start, $finish, $status)
    {
        $roadScope = new QueryScope("roadrout");
        $roadScope->setFields(array("*"));

        $roadCond = new QueryCondition("roadrout");
        $roadCond->setConditions(array(
            new QueryConditionMember("start", $start, "="),
            new QueryConditionMember("finish", $finish, "=", 'AND'),
            new QueryConditionMember("status", $status, "=", 'AND')
        ));

        $this->addQueryScope($roadScope);
        $this->addQueryCondition($roadCond);

        return $this->select()->fetchAll(PDO::FETCH_CLASS, 'Entity\Roadrout');
    }

    public function getRoutPointsByRoad($roadId)
    {
        $pointScope = new QueryScope("routpoint");
        $pointScope->setFields(array("*"));

        $pointCond = new QueryCondition("routpoint");
        $pointCond->setConditions(array(
            new QueryConditionMember("roadroutid", $roadId, "="),
        ));

        $this->addQueryScope($pointScope);
        $this->addQueryCondition($pointCond);

        return $this->select()->fetchAll(PDO::FETCH_CLASS, 'Entity\RoutPoint');
    }

    public function getByUser($email)
    {
        $roadScope = new QueryScope("roadrout");
        $roadScope->setFields(array("*"));

        $roadCond = new QueryCondition("roadrout");
        $roadCond->setConditions(array(
            new QueryConditionMember("driverid", $email, "=")
        ));

        $this->addQueryScope($roadScope);
        $this->addQueryCondition($roadCond);

        return $this->select()->fetchAll(PDO::FETCH_CLASS, 'Entity\Roadrout');
    }

    public function insertNewRoad(Roadrout $road)
    {
        if($this->validate($road)){
            $roadScope = new QueryScope("roadrout");
            $roadScope->setFields(array("id", "driverid", "start", "start_adress", "finish", "finish_adress", "terms", "autoid", "freeseats", "price", "startdate", "timetrip", "status"));
            $roadScope->setValues(array($road->id, $road->driverid, $road->start, $road->start_adress, $road->finish, $road->finish_adress, $road->terms, $road->autoid, $road->freeseats, $road->price, $road->startdate, $road->timetrip, $road->status));
            $this->addQueryScope($roadScope);
            return $this->insert();
        }
        return false;
    }
}