<?php
use Entity\User;

class IndexController extends  AbstractController {

    public function indexAction(){
        $this->addBlockToView('Common', 'header');
        $this->setViewAttributes('headerTitle', 'Easy Ride');
        $this->setViewAttributes('add_js', array('addroute.js'));
        $this->setViewAttributes('add_css', array('index.css', 'svg.scss', 'font-awesome.css'));
//        $this->addBlockToView('Common', 'footer');
        $this->initView($this->getActionUrl())->renderView();
    }

    public function routeAction()
    {
        $request = new Request();
        $request->initRequest();
        $post = $request->getPost();
        ErSession::saveToSession('start', $post['start']);
        ErSession::saveToSession('finish', $post['finish']);
            if($post['findaction']){
                ErApplication::redirect(ErApplication::getBaseUrl() . 'road/index');
            }else{
                ErApplication::redirect(ErApplication::getBaseUrl() . 'road/addroute');
            }
    }

    public function page404Action() {
        $this->addBlockToView('Common', 'header');
        $this->initView($this->getActionUrl())->renderView();
    }

    public function getMessageAction()
    {
        $request = new Request();
        $request->initRequest();
        $post = $request->getPost();
        $uri = $post['requestUri'];
        $msg = array();
            $messenger = ErMessenger::getInstance();
        if(isset($post)){
            $msg['succeed_msg'] = $messenger->getSucceedMessage($uri);
            $msg['error_msg'] = $messenger->getErrMessage($uri);
            $msg['notes_msg'] = $messenger->getNotesMessage($uri);
            echo json_encode($msg);
        }
    }

    public function testAction()
    {
//        $user = new Entity\User();
//        $mapper = new UserMapper();
//        $mapper = new RoadMapper();
//        $user->email = 'df@e.ua';
//        $user->userpassword = hash('md5', '111');
//        $user->crdate = '2015-12-12';
//        $user->access = 'ps';
//        $user->rate = '200';
//        echo ($mapper->validate($user)) ? "OK" : "BAD";
//        $user = $mapper->getUserByEmail('john@i.ua');
//        var_dump($user);
//        echo $user->getAge();
//        $road = $mapper->getRoutPointsByRoad('20150221');
//        var_dump($road);

    }
}