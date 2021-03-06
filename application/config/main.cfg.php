<?php
return array(
    "application" => array(
        "paths" => array(
            "Controller" => "application/Controller",
            "Model" => "application/Model",
            "Mapper" => "application/Model/Mapper",
            "View" => "application/View",
            "core" => "core",
            "modules" => "modules",
            "data" => "application/data",
            "templateDirectory" => "./application/View/default"
        ),
        'session' => array(
            'mainstorage' => 'erapp',
            'messagestorage' => 'ermessage'
        ),
        'BASE_URL' => 'step.com/'
    ),
    "dbsettings" => array(
        "host" => "localhost",
        "name" => "easyride_db",
        "login" => "root",
        "password" => "",
        "tableprefix" => "er_",
        "encoding" => "utf8"
    ),
    "routing" => array(
        "default_controller" => "IndexController",
        "default_action" => "IndexAction"
    )
);