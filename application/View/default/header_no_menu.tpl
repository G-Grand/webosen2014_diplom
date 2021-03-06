<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php if($this->headerTitle){ echo $this->headerTitle; } ?></title>

    <link rel="stylesheet" href="/application/data/css/jquery-ui.css">
    <link rel="stylesheet" href="/application/data/css/jquery-ui.theme.css">
    <link rel="stylesheet" type="text/css" href="/application/data/css/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="/application/data/css/bootstrap.css">
    <link rel="stylesheet" href="/application/data/css/jquery.raty.css">
    <link rel="stylesheet" href="/application/data/css/style.css">
    <?php
        if($this->add_css){
            foreach($this->add_css as $style){
                echo '<link rel="stylesheet" href="/' . $this->_dataPath . '/css/' . $style . '">';
            }
        }
    ?>

    <script src="/application/data/js/jquery.js"></script>
    <script src="/application/data/js/bootstrap.min.js"></script>
    <script src="http://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
    <script src="/application/data/js/jquery.datetimepicker.js"></script>
    <script src="/application/data/js/jquery-ui.js"></script>
    <script src="/application/data/js/handlebars.js"></script>
    <script src="/application/data/js/messenger.js"></script>
    <?php
        if($this->add_js){
            foreach($this->add_js as $scr){
                echo '<script src="/' . $this->_dataPath . '/js/' . $scr . '" type="text/javascript"></script>';
            }
        }
    ?>

</head>
<body>
<div class="container">
    <p id="succeed_msg" class="alert alert-success hidden"></p>
    <p id="notes_msg" class="alert alert-info hidden"></p>
    <p id="error_msg" class="alert alert-danger hidden"></p>
</div>
