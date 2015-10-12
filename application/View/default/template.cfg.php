<?php
return array(
    "blocks"=>array(
      "header",
      "content",
      "footer"
    ),
    "Controller"=>array(
        "IndexController"=>array(
            "indexAction"=>array(
                "block"=>"content",
                "template"=>"index",
                "weight"=>1
            ),
            "findAction"=>array(
                "block"=>"content",
                "template"=>"find_car",
                "weight"=>1
            )
        ),
        "UserController"=>array(
            "indexAction"=>array(
                "block"=>"content",
                "template"=>"index",
                "weight"=>1
            ),
            "findAction"=>array(
                "block"=>"content",
                "template"=>"finduserbyemail_form",
                "weight"=>10
            ),
            "signinAction"=>array(
                "block"=>"content",
                "template"=>"signin",
                "weight"=>1
            ),
            "signupAction"=>array(
                "block"=>"content",
                "template"=>"signup",
                "weight"=>1
            ),
            "forgotAction"=>array(
                "block"=>"content",
                "template"=>"forgot",
                "weight"=>1
            ),
            "privateAction"=>array(
                "block"=>"content",
                "template"=>"private",
                "weight"=>1
            )
        ),
        "RoadController"=>array(
            "indexAction"=>array(
                "block"=>"content",
                "template"=>"find_car",
                "weight"=>1
            ),
            "addrouteAction"=>array(
                "block"=>"content",
                "template"=>"addroute",
                "weight"=>1
            )
        ),
        "Common"=>array(
            "error404"=>array(
                "block"=>"content",
                "template"=>"404",
                "weight"=>1
            ),
            "header"=>array(
                "block"=>"header",
                "template"=>"header",
                "weight"=>1
            ),
            "footer"=>array(
                "block"=>"footer",
                "template"=>"footer",
                "weight"=>1
            )
        )
    )
);