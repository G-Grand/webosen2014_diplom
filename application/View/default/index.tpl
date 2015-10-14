<div id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">


    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">
                    <span class="light">Easy</span> Ride
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <div class="authorize"><a href="">регистрация</a>|<a href="">войти</a></div>

                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#">Главная</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#">Поймать попутку</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#">Создать маршрут</a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Intro Header -->
    <header class="intro">

        <div class="intro-body">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
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

    <!-- About Section -->
    <section id="create-catch" class="container content-section text-center">
        <div class="seek-rout">
            <form class="navbar-form" action="" method="post" id="get_rt_form">
                <div class="row">
                    <div class="col-md-6 text-center">
                        <div class="form-group">
                            <input type="text" form="get_rt_form" name="departure_point" placeholder="пункт отправления"
                                   class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6 text-center">
                        <div class="form-group">
                            <input type="text" form="get_rt_form" name="destination_point"
                                   placeholder="пункт назначения" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </form>
        </div>
        <div class="row">
            <div class="col-md-6 text-center">
                <h4>Найди тех, с кем тебе по пути!</h4>

            </div>
            <div class="col-md-6 text-center">
                <h4>Раздели свой путь с другими!</h4>

            </div>
        </div>
        <div class="seek-buttons">
            <div class="row">
                <div class="col-md-6 text-center">

                    <a class="btn btn-default btn-lg">Поймать попутку</a>
                </div>
                <div class="col-md-6 text-center">

                    <a class="btn btn-default btn-lg">Создать маршрут</a>
                </div>
            </div>
            <div class="clearfix"></div>

        </div>
    </section>


    <section class="content-section text-center">
        <div class="reg-section">
            <div class="container">
                <div id="reg-text" class="col-lg-8 col-lg-offset-2">
                    <h3>Стань одним из нас!</h3>
                    <a href="http://" id="reg" class="btn btn-default btn-lg">Зарегистрироваться</a>
                </div>
            </div>
            <div class="reg-anime"></div>
            <div class="clearfix"></div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <p>Свяжитесь с нами</p>

                <p><a href="mailto:feedback@easyride.com">feedback@easyride.com</a>
                </p>
                <ul class="list-inline banner-social-buttons">
                    <li>
                        <a href="https://twitter.com" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i>
                            <span class="network-name">Twitter</span></a>
                    </li>
                    <li>
                        <a href="https://github.com" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i>
                            <span class="network-name">Github</span></a>
                    </li>
                    <li>
                        <a href="https://plus.google.com" class="btn btn-default btn-lg"><i
                                    class="fa fa-google-plus fa-fw"></i> <span class="network-name">Google+</span></a>
                        <a href="https://facebook.com" class="btn btn-default btn-lg"><i
                                    class="fa fa-facebook fa-fw"></i> <span class="network-name">Facebook</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>

        <div class="container text-center">
            <p>Copyright &copy; Your Web-Osen 2014</p>
        </div>
    </footer>
</div>
</body>
</html>