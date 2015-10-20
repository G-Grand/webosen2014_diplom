<?php
/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

use \Entity\Car;

class CarController extends AbstractController
{
    public function indexAction(){}

    public function saveAction()
    {
        $message = ErMessenger::getInstance();
        $userEmail = ErSession::getFromSession('user');
        $request = new Request();
        $request->initRequest();
        $post = $request->getPost();
        if(isset($post)){
            $autoId = $this->clearStr($post['regnumber']);
            $carMapper = new CarMapper();
            $carExist = $carMapper->getByAutoId($autoId);
            $car = ($carExist) ? $carExist : new Car();
            $carMapper->clear();
            $car->brand = $this->clearStr($post['brand']);
            $car->model = $this->clearStr($post['model']);
            $car->color = $this->clearStr($post['color']);
            $car->seats = $this->clearStr($post['seats']);
            $car->fuelrate = $this->clearStr($post['fuelrate']);
            if(!$carExist){
                $car->regnumber = $this->clearStr($post['regnumber']);
                $car->userid = $this->clearStr($userEmail);
                $car->photo = "";
                if ($carMapper->insertNewCar($car)) {
                    $message->setSucceedMessage('202', 'user/private');
                } else {
                    $message->setErrMessage('100', 'user/private');
                }
            } else{
                if ($carMapper->updateCar($car)) {
                    $message->setSucceedMessage('202', 'user/private');
                } else {
                    $message->setErrMessage('100', 'user/private');
                }
            }
            echo  json_encode($this->fetchUserCars($userEmail));
        }
    }

    protected function fetchUserCars($userEmail)
    {
        $carMapper = new CarMapper();
        $userCars = $carMapper->getByUser($userEmail);
        $cars = array();
        foreach($userCars as $car){ $cars[] = get_object_vars($car); }
        return $cars;
    }
}