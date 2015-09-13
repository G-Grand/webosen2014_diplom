<?php

error_reporting(E_ALL & ~E_NOTICE);
//error_reporting(E_ALL);
//if(!$_SESSION) { session_start(); }

require_once "application/ErApplication.php";


$app = ErApplication::getInstance();
$app ->init();
$_fc = $app->getFC();
$_fc->run();

