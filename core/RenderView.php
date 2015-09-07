<?php

class RenderView
{   private static $_instanse;
    private $_attributes = array();
    private $_tplConf;
    private $_ctrls = array();
    private $_blocks = array();
    private $_prepareView = array();
    private $_renderCahe = "";

    private function __construct(){
        $this->_tplConf = require_once "template.cfg.php";
        $this->_blocks = $this->_tplConf["blocks"];
        $this->_ctrls = $this->_tplConf["controllers"];
        foreach($this->_blocks as $block){
            $this->_prepareView[$block] = array();
        }
    }
    private function __clone(){}

    public static function getInstance(){
        if(self::$_instanse == null){
            self::$_instanse = new self;
        }
            return self::$_instanse;
    }

    public function __set($attrName, $attribute)
    {
            $this->_attributes[$attrName] = $attribute;
    }

    public function __get($attrName)
    {
        if (array_key_exists($attrName, $this->_attributes)) {
            return $this->_attributes[$attrName];
        }
    }

    public function setViews($ctrl, $method, $params=null){
        $view = $this->_ctrls[$ctrl][$method];
        if(is_array($this->_prepareView[$view['block']][$view['weight']])){
            if(!is_array($this->_prepareView[$view['block']][$view['weight']][1])) {
                $this->_prepareView[$view['block']][$view['weight']] = array($this->_prepareView[$view['block']][$view['weight']],
                                                                        array($params, $view['template']));
            }else{
                $this->_prepareView[$view['block']][$view['weight']][] = array($params, $view['template']);
            }

        }else{
            $this->_prepareView[$view['block']][$view['weight']] = array($params, $view['template']);
        }
    }

    public function setMainHeader(){
        $this->setViews('Common', 'header');
    }

    public function setMainFooter(){
        $this->setViews('Common', 'footer');
    }

    public function renderBody()
    {
        foreach($this->_prepareView as $block){
            $this->renderItem($block);
        }
        return $this->_renderCahe;
    }

    private function renderItem(array $block){
        foreach($block as $blockItem){
            if(!is_array($blockItem[1])){
                $file = $blockItem[1];
                $tplFile = (ERApplication::fileExists($file,"tpl")) ? $file : "404";
                $params = $blockItem[0];
                ob_start();
                include $tplFile . ".tpl";
                $this->_renderCahe .= ob_get_clean();
            }else {
                $this->renderItem($blockItem);
            }

        }
    }
}