<?php

/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */


class RenderView extends ErObject
{
    /** @var RenderView */
    private static $_instanse;

    /** @var array */
    private $_tplConf;

    /** @var array */
    private $_ctrls = array();

    /** @var array */
    private $_blocks = array();

    /** @var array */
    private $_prepareView = array();

    private $_messages;

    private $_refererUrl;
    private $_dataPath;


    /** @var string */
    private $_renderCahe = "";


    private function __construct(){
        $this->_tplConf = (ErApplication::fileExists('template.cfg','php')) ? require_once "template.cfg.php" : null;
        if($this->_tplConf){
            $this->_blocks = $this->_tplConf["blocks"];
            $this->_ctrls = $this->_tplConf["Controller"];
            foreach($this->_blocks as $block){
                $this->_prepareView[$block] = array();
            }
        }
        $this->_messages = ErMessenger::getInstance();
        $config = ErApplication::getMainCfg();
        $this->_dataPath = $config['application']['paths']['data'];
    }
    private function __clone(){}

    public static function getInstance(){
        if(self::$_instanse == null){
            self::$_instanse = new self;
        }
            return self::$_instanse;
    }

    /**
     * @param string $ctrl
     * @param string $method
     * @param null mixed $params
     */
    public function setViews($ctrl, $method, $params=null){
        $view = (isset($this->_ctrls[$ctrl][$method])) ? $this->_ctrls[$ctrl][$method] :
                                                        $this->_ctrls['common']['error404'];

        if(is_array($this->_prepareView[$view['block']][$view['weight']])){
            if(!is_array($this->_prepareView[$view['block']][$view['weight']][1])) {
                $this->_prepareView[$view['block']][$view['weight']] =
                        array($this->_prepareView[$view['block']][$view['weight']],
                        array($params, $view['template']));
            }else{
                $this->_prepareView[$view['block']][$view['weight']][] = array($params, $view['template']);
            }

        }else{
            $this->_prepareView[$view['block']][$view['weight']] = array($params, $view['template']);
        }
    }

    /**
     * @return string
     */
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
                $tplFile = (ErApplication::fileExists($file,"tpl")) ? $file : "404";
                $params = $blockItem[0];
                ob_start();
                include $tplFile . ".tpl";
                $this->_renderCahe .= ob_get_clean();
            }else {
                $this->renderItem($blockItem);
            }

        }
    }


    /**
     * @param mixed $refererUrl
     */
    public function setRefererUrl($refererUrl)
    {
        $this->_refererUrl = $refererUrl;
    }

    /**
     * @return mixed
     */
    public function getRefererUrl()
    {
        return $this->_refererUrl;
    }


}