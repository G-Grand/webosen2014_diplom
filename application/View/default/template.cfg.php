<?php
return array(
    "blocks"=>array(
      "header",
      "content",
      "footer"
    ),
    "Controller"=>array(
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
            "loginAction"=>array(
                "block"=>"content",
                "template"=>"signin_form",
                "weight"=>1
            ),
            "signupAction"=>array(
                "block"=>"content",
                "template"=>"register",
                "weight"=>1
            )
        ),
        "IndexController"=>array(
            "indexAction"=>array(
                "block"=>"content",
                "template"=>"index",
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