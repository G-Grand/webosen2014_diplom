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

    public function findAction(){
        $request = new Request();
        $request->initRequest();
        $post = $request->getPost();
        $roads = new \Entity\Roadrout();
        $roadMapper = new RoadMapper();
        var_dump($roadMapper->getByStartFinish($post['departure_point'], $post['destination_point']));
//        $roadMapper->getByStartFinish($post['departure_point'], $post['destination_point']);


//        echo '{"response":"' . $post['departure_point'] . '"}';
    }
}