<div id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

    <header class="intro">

        <div class="intro-body" id="top">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2" id="svg">
                        <h1 class="brand-heading">
                            <svg viewBox="0 0 800 600">
                                <symbol id="s-text">
                                    <text text-anchor="middle" x="20%" y="25%" class="text--line">
                                        Easy
                                    </text>
                                    <text text-anchor="middle" x="70%" y="25%" class="text--line2">
                                        Ride
                                    </text>

                                </symbol>

                                <g class="g-ants">
                                    <use xlink:href="#s-text" class="text-copy"></use>
                                    <use xlink:href="#s-text" class="text-copy"></use>
                                    <use xlink:href="#s-text" class="text-copy"></use>
                                    <use xlink:href="#s-text" class="text-copy"></use>
                                    <use xlink:href="#s-text" class="text-copy"></use>
                                </g>


                            </svg>
                        </h1>

                        <div class="intro-anime">
                        </div>

                        <a href="#create-catch" class="btn btn-circle page-scroll">
                            <i class="fa fa-angle-double-down animated"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>

    </header>

    <!-- create-catch -->
    <section id="create-catch" class="container content-section text-center">
        <div class="seek-rout">
            <form id="data" action="/index/route" method="POST"></form>
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12 text-center">
                        пункт отправления
                        <div class="input-group center-block" style="width:60%">
                            <div class="droplist">
                                    <span class="input-group-addon routpoints pull-left"><i
                                                class="glyphicon glyphicon-map-marker"></i></span>

                                <input id="inputStart" type="text" class="form-control pull-left" style="width: 80%" form="data" name="start"
                                       placeholder="Ваш пункт отправления">
                                <div id="start_list" class="list"></div>
                            </div>
                        </div>
                        <!--
                        <div class="form-group">
                            <input class="point1 form-control" type="text" form="get_rt_form" name="departure_point"
                                   placeholder="пункт отправления">
                        </div>
                        -->
                    </div>

                    <div class="col-md-6 col-sm-6 col-xs-12 text-center">
                        пункт назначения
                        <div class="input-group center-block" style="width:60%">
                            <div class="droplist">
                                    <span class="input-group-addon routpoints pull-left"><i
                                                class="glyphicon glyphicon-map-marker"></i></span>

                                <input id="inputFinish" type="text" class="form-control" style="width: 80%" form="data" name="finish"
                                       placeholder="Ваш пункт прибытия">
                                <div id="finish_list" class="list"></div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="clearfix"></div>

        </div>
        <div class="seek-buttons">
        <div class="row">
            <div  class="catch col-md-6 col-sm-6 col-xs-12 text-center" style="margin-top: 2px ;">
                <h4>Найди тех, с кем тебе по пути!</h4>
                <button class="btn btn-default btn-lg" form="data" name="findaction" value="find">Поймать попутку</button>
            </div>
            <div  class="create col-md-6 col-sm-6 col-xs-12 text-center" style="margin-top: 2px;">
                <h4>Раздели свой путь с другими!</h4>
                <button type="submit" form="data" name="addaction" value="addroute" class="btn btn-default btn-lg">Создать маршрут</button>
            </div>
        </div>
        </div>
    </section>


    <section class="content-section text-center">
        <div class="reg-section">
            <div class="container">
                <div class="row">
                <div id="reg-text" class="col-md-6 col-sm-6 col-xs-12 text-left">
                    <h3>Стань одним из нас!</h3>
                    <a href="<?php echo 'user/signup'; ?>" id="reg" class="btn btn-default btn-lg">Зарегистрироваться</a>
                </div>
                </div>
            </div>
            <div class="container">
            <div class="row">
                <div id="reg-anime" class="col-md-6 col-sm-6 col-xs-12 text-center">
            <div class="reg-anime"></div>
                </div>
            </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-sm-12 col-xs-12">
                <p>Свяжитесь с нами</p>

                <p><a href="mailto:feedback@easyride.com">feedback@easyride.com</a>
                </p>
                <ul class="list-inline banner-social-buttons">
                    <li>
                        <a href="https://twitter.com" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i>
                            <span class="network-name">Twitter</span></a>
                    </li>
                    <li>
                        <a href="https://plus.google.com" class="btn btn-default btn-lg"><i
                                    class="fa fa-google-plus fa-fw"></i> <span class="network-name">Google+</span></a>
                    </li>
                    <li>
                        <a href="https://facebook.com" class="btn btn-default btn-lg"><i
                                    class="fa fa-facebook fa-fw"></i> <span class="network-name">Facebook</span></a>
                    </li>
                    <li>
                        <a href="https://vkontakte.com" class="btn btn-default btn-lg"><i
                                    class="fa fa-instagram fa-fw"></i> <span class="network-name">Instagram</span></a>
                    </li>
                </ul>
                <a href="#top" class="btn btn-circle page-scroll">
                    <i class="fa fa-angle-double-up animated"></i>
                </a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <hr />

        <div class="container text-center">
            <p>&copy; Your Web-Osen 2014</p>
        </div>
    </footer>
</div>
</body>
</html>