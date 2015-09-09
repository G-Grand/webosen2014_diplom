<?php

//error_reporting(E_ALL & ~E_NOTICE);
//if(!$_SESSION) { session_start(); }

require_once "application/ERApplication.php";


$app = ERApplication::getInstance();
$app ->init();
$_fc = $app->getFC();
$_fc->run();

