<?php
/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

use \Entity\Car;

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

        return $this->select()->fetchAll(PDO::FETCH_CLASS, 'Entity\Car');
    }

    public function getByAutoId($autoId)
    {
        $carScope = new QueryScope("car");
        $carScope->setFields(array("*"));

        $carCond = new QueryCondition("car");
        $carCond->setConditions(array(
            new QueryConditionMember("regnumber", $autoId, "="),
        ));

        $this->addQueryScope($carScope);
        $this->addQueryCondition($carCond);

        return $this->select()->fetchObject('\Entity\Car');
    }

    public function updateCar(Car $car)
    {
        if($this->validate($car)){

            $carScope = new QueryScope("car");
            $carScope->setFields(array(
                "brand",
                "model",
                "color",
                "seats",
                "fuelrate"
            ));
            $carScope->setValues(array(
                $car->brand,
                $car->model,
                $car->color,
                $car->seats,
                $car->fuelrate
            ));

            $carCond = new QueryCondition("car");
            $carCond->setConditions(array(
                new QueryConditionMember("regnumber", $car->regnumber, "="),
            ));

            $this->addQueryScope($carScope);
            $this->addQueryCondition($carCond);
            return $this->update();
        }
        return false;
    }

    public function insertNewCar(Car $car)
    {
        if($this->validate($car)){
            $carScope = new QueryScope("car");
            $carScope->setFields(array("regnumber", "userid", "brand", "model", "color", "seats", "photo", "fuelrate"));
            $carScope->setValues(array($car->regnumber, $car->userid, $car->brand, $car->model, $car->color, $car->seats, $car->photo, $car->fuelrate));
            $this->addQueryScope($carScope);
            return $this->insert();
        }
        return false;
    }
}