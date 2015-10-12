<link type="text/css" rel="stylesheet" href="/application/data/css/bootstrap-datetimepicker.css">
<script type="text/javascript" src="/application/data/js/moment-with-langs.js"></script>
<script type="text/javascript" src="/application/data/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/application/data/js/bootstrap-datetimepicker.ru.js"></script>
<script src="http://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
<script src="/application/data/js/addroute.js" type="text/javascript"></script>

<div class="container" style="width: 740px;">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="col-sm-12"><h1>Создать маршрут</h1></div>

            <!-- Шаг 1 -->
            <div class="panel-group col-sm-12" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">Шаг #1</h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <form method="POST" role="form" name="formPlaces">
                                <div class="form-group  has-feedback">
                                    <label for="inputStart">Отправление</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                                        <div class="droplist">
                                            <input id="inputStart" type="text" class="form-control" placeholder="Ваш пункт отправления">
                                            <span class="glyphicon form-control-feedback"></span>
                                            <div id="start_list" class="list"></div>
                                        </div>
                                    </div>

                                </div>
                                <div class="form-group has-feedback">
                                    <label for="inputFinish">Прибытие</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                                        <div class="droplist">
                                            <input id="inputFinish" type="text" class="form-control"  placeholder="Ваш пункт прибытия">
                                            <span class="glyphicon form-control-feedback"></span>
                                            <div id="finish_list" class="list"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="inputAuto" class="control-label col-md-4">Выбирите ТС на котором<br> планируете поездку</label>
                                    <div class="col-md-8">
                                        <select class="form-control" id="inputAuto">
                                            <option>Opel</option>
                                            <option>Nissan</option>
                                            <option>Ваз</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                            <div class="col-md-12 text-right">
                                <a id="setCoords" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                    Далее</a>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Шаг 2 -->
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title"> Шаг #2  </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <form role="form" name="formWaypoints">
                                <div class="form-group">
                                    <label for="WayPoints">Добавьте промежуточные пункты, которые вы будете проезжать. Это очень важно для поиска пассажиров.</label>
                                    <textarea style="resize:none" class="form-control" rows="1" id="WayPoints" placeholder="Промежуточные пункты" value=""></textarea>
                                </div>
                            </form>

                            <!-- Доп инфа раскрывающаяся -->
                            <div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingDop">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion2" href="#collapseDop" aria-expanded="false" aria-controls="collapseDop">
                                                Дополнительная информация
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseDop" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingDop">
                                        <div class="panel-body">
                                            <form method="POST" role="form" name="formDopinfo">
                                                <div class="form-group">
                                                    <textarea  style="resize:none" type="text" class="form-control" rows="4" placeholder="Добавьте деталей к описанию вашей поездки - это поможет избежать многочисленных вопросов от пассажиров. Например: место встречи, музыку, которую слушаете, какую-либо полезную информацию для пассажиров." value=""></textarea>
                                                </div>
                                            </form>
                                            <h5><span class="glyphicon glyphicon-exclamation-sign"></span> Ваши контактные данные (номер мобильного и эл. адрес)
                                                уже есть в вашем профиле. Пожалуйста, не добавляйте их здесь!</h5>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-12 text-right">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    Шаг#1
                                </a>
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    Далее
                                </a>
                            </div>

                        </div>
                    </div>
                </div>


                <!-- Шаг 3 дата и время -->
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title"> Шаг #3 </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">

                        <div class="panel-body">
                            <form method="POST" role="form" name="formDate">
                                <div class="form-group col-md-4">
                                    <!-- Data_picker -->
                                    <label for="DateDep">Дата отправления:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                        <input class="form-control datetimepicker" id="DateDep" type="text" placeholder="дд-мм-гггг" value="">
                                    </div>
                                </div>

                                <div class="form-group col-md-4">
                                    <!-- Data_picker -->
                                    <label for="DateArrival">Дата прибытия:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                        <input class="form-control datetimepicker" id="DateArrival" type="text" placeholder="дд-мм-гггг" value="">
                                    </div>
                                </div>
                            </form>

                            <div class="col-md-12 text-right">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Шаг#2</a>
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="false" aria-controls="collapse4">
                                    Далее</a>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Шаг 4 стоимость -->
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="heading4">
                        <h4 class="panel-title">Шаг #4 </h4>
                    </div>
                    <div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">
                        <div class="panel-body">
                            <form method="POST" role="form" name="formPlaces">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="price" class="col-md-7 text-danger">Цена с пассажира:</label>
                                            <div class="input-group col-md-5">
                                                <input id="price" type="text" class="form-control"  placeholder="100" value="">
                                                <span class="input-group-addon"><i>грн.</i></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="seats" class="col-md-7 text-danger">Свободных мест:</label>
                                            <div class="input-group col-md-3">
                                                <input id="seats" type="text" class="form-control"  placeholder="5" value="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div class="col-md-12 text-right">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Шаг#3</a>
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseMap" aria-expanded="false" aria-controls="collapseMap">
                                    Далее</a>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Шаг 5 Карта-->
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingMap">
                        <h4 class="panel-title">Маршрут </h4>
                    </div>
                    <div id="collapseMap" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingMap">

                        <div class="row-fluid">


                            <div id="map" style="width: 100%; height: 400px"></div>
                        </div>

                        <div class="panel-body">
                            <div>
                                <h4>&#8594; Днепродзержинск <span class="glyphicon glyphicon-road"></span></h4>
                            </div>
                            <div class="col-md-3">Отправление:</div><div> 07/07/2015 в 8:00</div>
                            <div class="col-md-3">Стоимость:</div><div> 20 грн.</div>

                            <button type="button" class="btn btn-warning btn-lg pull-right">Создать</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</div>
