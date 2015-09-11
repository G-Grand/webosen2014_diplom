<?php
return array(
    "application" => array(
        "paths" => array(
            "controllers" => "application/controllers",
            "models" => "application/models",
            "mappers" => "application/models/mappers",
            "views" => "application/views",
            "core" => "core",
            "modules" => "modules",
            "data" => "data",
            "templateDirectory" => "./application/views/default"
        ),
        'session' => array(
            'mainstorage' => 'erapp'
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