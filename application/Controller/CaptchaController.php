<?php
/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

class CaptchaController extends  AbstractController {

    public function indexAction(){
        Captcha::generate();
    }


}