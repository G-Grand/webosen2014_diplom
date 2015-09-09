<?php

/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */

class ERSession
{
    public static function startSession()
    {
        if(!$_SESSION) { session_start(); }
    }
}