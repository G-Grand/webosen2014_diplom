<?php

class CaptchaController extends  AbstractController {

    public function indexAction(){
        Captcha::generate();
    }


}