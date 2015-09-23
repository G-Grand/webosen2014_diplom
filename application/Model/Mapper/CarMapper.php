<?php
/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */


class CarMapper extends AbstractMapper
{
    public function getByUser($userId)
    {
        $carScope = new QueryScope("car");
        $carScope->setFields(array("*"));

        $carCond = new QueryCondition("car");
        $carCond->setConditions(array(
            new QueryConditionMember("userid", $userId, "="),
        ));

        $this->addQueryScope($carScope);
        $this->addQueryCondition($carCond);

        return $this->select()->fetchObject('\Entity\Car');
    }
}