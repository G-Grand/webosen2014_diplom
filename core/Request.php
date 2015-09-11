<?php

class Request
{
    private $_requestParam;
    private $_path;
    private $_post;
    private $_get;

    public function initRequest()
    {
        if(!empty($_SERVER["REQUEST_URI"])){
            $request = explode("?", $_SERVER["REQUEST_URI"]);
            $this->_path = (!empty($request[0])) ? trim($request[0], "/") : "";
            $this->_requestParam = (!empty($request[1])) ? $request[1] : "";
            $this->_post = (!empty($_POST)) ? $_POST : null;
        }
    }

    public function setPath($path) {
        $this->_path = $path; }
    public function getPath() {
        return $this->_path;}

    public function setQueryStr($requestParam) {
        $this->_requestParam = $requestParam; }
    public function getQueryStr() {
        return $this->_requestParam; }


    public function getPost()
    {
        return $this->_post;
    }

    /**
     * @param mixed $post
     */
    public function setPost($post)
    {
        $this->_post = $post;
    }

}