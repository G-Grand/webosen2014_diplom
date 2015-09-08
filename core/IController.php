<?php
abstract class IController
{
    abstract public function indexAction();

    protected  function getMethodName($method){
        $result = explode("::", $method);
        return $result[1];
    }

    public function initView($method)
    {
        $render = RenderView::getInstance();
        $render->setViews(get_class($this),$this->getMethodName($method));
        return $this;
    }

    public function renderView()
    {
        $render = RenderView::getInstance();
        echo $render->renderBody();
    }

}