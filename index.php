<?php

require_once "application/ERApplication.php";

$app = ERApplication::getInstance();
$app ->init();
$_fc = $app->getFC();
$_fc->run();

