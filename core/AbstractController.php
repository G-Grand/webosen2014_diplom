<?php
abstract class AbstractController
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

    public function initView($method, $class, $params=null)
    {
        $render = RenderView::getInstance();
        if(!empty($this->viewCollection)){
            foreach($this->viewCollection as $view){
                $render->setViews($view[0], $view[1]);
            }
        }
        $class = ($class) ? $class : get_class($this);
        $render->setViews($class, $method, $params);
        return $this;
    }

    public function renderView()
    {
        $render = RenderView::getInstance();
        if($render->header) {header($render->header); }
        echo $render->renderBody();
    }



}