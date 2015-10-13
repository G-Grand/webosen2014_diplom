<?php
/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

class RoadController extends AbstractController
{
    public function indexAction()
    {
        $this->addBlockToView('Common', 'header');
        $this->addBlockToView('Common', 'footer');
        $this->initView($this->getActionUrl())->renderView();
    }

    public function addrouteAction()
    {
        if (ErSession::getFromSession('user')) {
            $carMapper = new CarMapper();
            $cars = $carMapper->getByUser(ErSession::getFromSession('user'));
            if (!empty($cars)){
                $this->addBlockToView('Common', 'header');
                $this->addBlockToView('Common', 'footer');
                $this->initView($this->getActionUrl(), $cars)->renderView();
            }else {
                $message = ErMessenger::getInstance();
                $message->setNotesMessage('302', 'index/index');
                ErApplication::redirect(ErApplication::getBaseUrl() . 'index/index');
            }
        }else {
            $message = ErMessenger::getInstance();
            $message->setNotesMessage('301', 'user/signin');
            ErApplication::redirect(ErApplication::getBaseUrl() . 'user/signin');
        }
    }

    public function findAction(){
        $request = new Request();
        $request->initRequest();
        $post = $request->getPost();
        $roadMapper = new RoadMapper();
        $roads = $roadMapper->getByStartFinish($post['departure_point'], $post['destination_point'], "opened");
        $userMapper = new UserMapper();
        $carMapper = new CarMapper();
        $result = array();
        if($roads){
            foreach($roads as $road){
                $user = $userMapper->getUserByEmail($road->driverid);
                $car = $carMapper->getByAutoId($road->autoid);
                $roadMapper->clear();
                $getPoints = $roadMapper->getRoutPointsByRoad($road->id);
                $routPoints = array();
                foreach($getPoints as $point){ $routPoints[$point->pointqueue] = $point->point; }
                $result[] = array(
                    'startdate' => $road->startdate,
                    'start' => $road->start,
                    'start_adress' => $road->start_adress,
                    'finish' => $road->finish,
                    'finish_adress' => $road->finish_adress,
                    'freeseats' => $road->freeseats,
                    'price' => $road->price,
                    'terms' => $road->terms,
                    'rout_points' => $routPoints,
                    'username' => $user->username,
                    'surname' => $user->surname,
                    'rate' => $user->rate,
                    'photo' => $user->photo,
                    'age' => $user->getAge(),
                    'car_brand' => $car->brand,
                    'car_model' => $car->model
                );
                $userMapper->clear();
                $carMapper->clear();
                $roadMapper->clear();
            }
        }
        echo json_encode($result);

    }
}