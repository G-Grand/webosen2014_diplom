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
            "data" => "data",
            "templateDirectory" => "./application/View/default"
        ),
        'session' => array(
            'mainstorage' => 'erapp',
            'messagestorage' => 'ermessage'
        ),
        'BASE_URL' => 'webosen2014_diplom/'
    ),
    "dbsettings" => array(
        "host" => "localhost",
        "name" => "easyride_db",
        "login" => "root",
        "password" => "",
        "tableprefix" => "er_"
    ),
    "routing" => array(
        "default_controller" => "IndexController",
        "default_action" => "IndexAction"
    )
);