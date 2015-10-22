<?php
$start = (ErSession::getFromSession('start')) ? ErSession::getFromSession('start') : "";
$finish = (ErSession::getFromSession('finish')) ? ErSession::getFromSession('finish') : "";
ErSession::removeFromSession('start');
ErSession::removeFromSession('finish');
?>
<div class="container" style="background-color: #F0A731; padding-top: 50px;">
    <!-- Find block -->
    <div class="row road_margin">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <h1>Найти попутку</h1>
            <div style="text-align: center">
                <form id="get_rt_form" class="navbar-form" action="" method="post">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                        <div class="droplist">
                            <input id="inputStart" class="form-control" type="text" form="get_rt_form" name="departure_point" value="<?php echo $start ?>"
                                   placeholder="пункт отправления">
                            <span class="glyphicon form-control-feedback"></span>
                            <div id="start_list" class="list"></div>
                        </div>
                    </div>
                    <button id="switchPlaces" class="btn btn-default btn-arrow" type="button">
                        <img src="/application/data/images/arrow.png" alt="" style="vertical-align:middle">
                    </button>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                        <div class="droplist">
                            <input id="inputFinish" class="form-control" type="text" form="get_rt_form" name="destination_point" value="<?php echo $finish ?>"
                                   placeholder="пункт назначения">
                            <span class="glyphicon form-control-feedback"></span>
                            <div id="finish_list" class="list"></div>
                        </div>
                    </div>
                    <button id="find" class="btn btn-default btn-find" type="button">найти</button>
                </form>
            </div>
        </div>
    </div>

    <!-- COUNT -->
    <div id="countRoadsBlock" class="row road_margin" style="display: none">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="row">
                <div class="col-sm-5">
                    <h4 id="countRoads">Найдено 23 маршрута:</h4>
                    <h3 id="roadsPoints">Днепропетровск - Ивано-Франковск</h3>
                </div>
                <div class="col-sm-3" style="padding-top: 20px;">
                    сортировать по:
                    <select id="roadsSorting" class="form-control">
                        <option value="date">дате</option>
                        <option value="price">цене</option>
                    </select>
                </div>
            </div>
        </div>
    </div>

    <div class="row road_margin">
        <!-- ROADS -->
        <div id="roadsBlock" style="display: none" class="col-md-9 col-sm-9 col-xs-9"></div>

        <!-- FILTERS -->
        <div id="roadsFilter" style="display: none;" class="col-md-3 col-sm-3 col-xs-12">
            <div class="panel">
                <h2>Фильтр</h2>
                <hr>
                <div class="panel">
                    <h3>Дата</h3>
                    <input type="text" value="" id="datetimepicker_mask"/><br><br>
                </div>
                <div class="panel">
                    <h3>Цена</h3>
                    <p><label for="amount"></label>
                        <input type="text" id="amount" readonly style="border:0;color:#f6931f;font-weight:bold;"></p>
                    <div id="slider-range-min"></div>
                </div>
                <div class="panel">
                    <h3>Количество мест</h3>
                    <select class="form-control">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                        <option>13</option>
                        <option>14</option>
                        <option>15</option>
                    </select>
                </div>
                <h3>Фото</h3>
                <label class="radio">
                    <input type="radio" name="optionsRadio" id="optionsRadio1" value="option1" checked>С фото
                </label>
                <label class="radio">
                    <input type="radio" name="optionsRadio" id="optionsRadio2" value="option2">Все
                </label>
                <h3>По рейтингу</h3>
                <label class="radio">
                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                    С отзывами
                </label>
                <label class="radio">
                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">Все
                </label>
            </div>
            <div class="panel text-center">
                <h3>Осенний набор на профессиональное компьютерное обучение!</h3>
                <div class="thumbnail">
                    <img src="/application/data/images/its-a-real-education.jpg" alt="">
                </div>
                <h4>Стань программистом, дизайнером или системным администратором, обучайся уже сегодня в
                    Компьютерной Академии «ШАГ» по направлениям: «Разработка программного обеспечения»,
                    «Компьютерная графика и дизайн», «Сетевые технологии и системное администрирование».</h4>
                <h4>Записаться прямо сейчас:
                    (067) 557-87-05
                    (050) 443-61-00
                    (097) 292-43-44</h4>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-12 text-center" style="z-index:-900;">
            <nav>
                <ul class="pagination">
                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a>
                    </li>
                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">...</a></li>
                    <li><a href="#">23</a></li>
                    <li><a href="#" aria-label="Next">
                            <span aria-hidden="true">»</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

<script id="roadBlockTemplate" type="text/x-handlebars-template">
    <div class="panel panel-default">
        <div class="row">
            <div class="col-sm-3 text-center" style="margin-top: 20px;">
                <img class="img-circle text-center" style="width: 100px; height:100px;"
                     src="/application/data/images/Vz5ARpT9PuE.jpg"
                     alt="icon">
                <h4>{{surname}} {{username}}</h4>
                <h4>возраст: {{age}}</h4>
                <div class="rate" data-score="{{rate}}"></div>
                <span class="glyphicon glyphicon-music"></span>
                <span class="glyphicon glyphicon-thumbs-up"></span>
                <span class="glyphicon glyphicon-ban-circle"></span>
            </div>
            <div class="col-sm-6">
                <h3><a href="#">{{startdate}}</a></h3>
                <h4>Следование через: {{start}} - {{finish}}</h4>
                <p><span class="glyphicon glyphicon-map-marker"></span>{{start_adress}}</p>
                <p><span class="glyphicon glyphicon-map-marker"></span>{{finish_adress}}</p>
                <h4>Автомобиль {{car_brand}} {{car_model}}</h4>
            </div>
            <div class="col-sm-3">
                <h2>{{price}} грн</h2>
                <h2><strong>{{freeseats}}</strong></h2>
                <h4>мест осталось</h4>
            </div>
        </div>
    </div>
</script>

