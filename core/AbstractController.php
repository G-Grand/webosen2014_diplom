<?php
abstract class AbstractController extends ErObject
{
    protected $viewCollection = array();

    abstract public function indexAction();

    public function addBlockToView($class, $method)
    {
        $this->viewCollection[] = array($class, $method);
    }

    public function setViewAttributes($attrName, $attrValue)
    {
        $render = RenderView::getInstance();
        $render->$attrName = $attrValue;
    }

    public function initView($refererUrl, $params=null)
    {
        $render = RenderView::getInstance();
        if(!empty($this->viewCollection)){
            foreach($this->viewCollection as $view){
                $render->setViews($view[0], $view[1]);
            }
        }
        $template = explode('/', $refererUrl);
        $class = ucfirst($template[0]) . 'Controller';
        $action = $template[1] . 'Action';
        $render->setRefererUrl($refererUrl);
        $render->setViews($class, $action, $params);
        return $this;
    }

    public function renderView()
    {
        $render = RenderView::getInstance();
        echo $render->renderBody();
    }

    public function getActionUrl()
    {
        $trace=debug_backtrace();
        $caller=$trace[1];
        $url = strtolower(substr(get_class($this),0,-10)) . '/' . substr($caller['function'],0,-6);

        return $url;
    }



}