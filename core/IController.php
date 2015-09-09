<?php
abstract class IController
{
    protected $viewCollection = array();

    abstract public function indexAction();

    public function addBlockToView($class, $method)
    {
        $this->viewCollection[] = array($class, $method);
    }

    public function initView($method, $class=null)
    {
        $render = RenderView::getInstance();
        if(!empty($this->viewCollection)){
            foreach($this->viewCollection as $view){
                $render->setViews($view[0], $view[1]);
            }
        }
        $class = ($class) ? $class : get_class($this);
        $render->setViews($class, $method);
        return $this;
    }

    public function renderView()
    {
        $render = RenderView::getInstance();
        echo $render->renderBody();
    }

}