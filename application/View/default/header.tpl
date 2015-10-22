<?php
$user = ErSession::getFromSession('username');
$user = (isset($user)) ? $user : ErSession::getFromSession('user');
?>
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
    <link rel="stylesheet" href="/application/data/css/style.css">
    <link rel="stylesheet" href="/application/data/css/index.css">

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
    <script src="/application/data/js/jquery.easing.min.js"></script>
    <script src="/application/data/js/index.js"></script>
    <?php
        if($this->add_js){
            foreach($this->add_js as $scr){
            echo '<script src="/' . $this->_dataPath . '/js/' . $scr . '" type="text/javascript"></script>'; }
        }
    ?>

</head>
<body>
    <div id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

        <!-- Navigation -->
        <nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="height: 80px;">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                        <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand page-scroll" href="/">
                        <span class="light">Easy</span><span> Ride</span>
                    </a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                    <div class="authorize">
                        <?php if (empty($user)): ?>
                            <a href="<?php echo 'user/signup'; ?>">регистрация</a><span> | </span>
                            <a href="<?php echo '/user/signin'; ?>">войти</a>
                        <?php else: ?>
                            <a href="<?php echo '/user/private' ; ?>"><?php echo $user; ?></a><span> | </span>
                            <a href="<?php echo '/user/logout'; ?>">выйти</a>
                        <?php endif;?>
                    </div>

                    <ul class="nav navbar-nav">
                        <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                        <li class="hidden">
                            <a href="#page-top"></a>
                        </li>
                        <li>
                            <a class="page-scroll" href="<?php echo '/'; ?>">Главная</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="<?php echo '/road'?>">Поймать попутку</a>
                        </li>
                        <li>
                            <a class="page-scroll" style="margin-right: -15px" href="<?php echo '/road/addroute'?>">Создать маршрут</a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
            </div>
        </nav>
    </div>
    <div class="clearfix"></div>
    <div class="container">
        <p id="succeed_msg" class="alert alert-success hidden"></p>
        <p id="notes_msg" class="alert alert-info hidden"></p>
        <p id="error_msg" class="alert alert-danger hidden"></p>
    </div>
    <div class="clearfix"></div>