<div class="container" style="width: 740px;">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="col-sm-12"><h1>Создать маршрут</h1></div>
            <form id="data" action="road/saveRoute" method="POST" ></form>

            <!-- Шаг 1 -->
            <div class="panel-group col-sm-12" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                Шаг 1 </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">

                                <div class="form-group  has-feedback">
                                    <label for="inputStart">Отправление</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                                        <div class="droplist">
                                            <input id="inputStart" type="text" class="form-control" placeholder="Ваш пункт отправления">
                                            <input id="id_citystart" type="hidden" form="data">
                                            <input id="id_streetstart" type="hidden" form="data">
                                            <input id="id_homestart" type="hidden" form="data">
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
                                            <input id="id_cityfinish" type="hidden" form="data">
                                            <input id="id_streetfinish" type="hidden" form="data">
                                            <input id="id_homefinish" type="hidden" form="data">
                                            <span class="glyphicon form-control-feedback"></span>
                                            <div id="finish_list" class="list"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="inputAuto" class="control-label col-md-4">Выбирите ТС на котором<br> планируете поездку</label>
                                    <div class="col-md-8">
                                        <select class="form-control" id="inputAuto">
                                            <?php
                                             if (!empty($params)){
                                                foreach($params as $car){
                                                    echo '<option>' . $car->brand . ' ' . $car->model . '</option>';
                                                }
                                             }
                                            ?>
                                        </select>
                                    </div>
                                </div>

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
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Шаг 2</a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">

                                <div class="form-group">
                                    <label for="waypoints">Добавьте промежуточные пункты, которые вы будете проезжать. Это очень важно для поиска пассажиров.</label>
                                    <textarea id="waypoints" style="resize:none" class="form-control" rows="1"  placeholder="Промежуточные пункты" value=""></textarea>
                                    <input id="id_waypoints" type="hidden" form="data">
                                </div>


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

                                                <div class="form-group">
                                                    <textarea id="dopinfo" style="resize:none" type="text" class="form-control" rows="4" placeholder="Добавьте деталей к описанию вашей поездки - это поможет избежать многочисленных вопросов от пассажиров. Например: место встречи, музыку, которую слушаете, какую-либо полезную информацию для пассажиров." value=""></textarea>
                                                    <input id="id_dopinfo" type="hidden" form="data">
                                                </div>

                                            <h5><span class="glyphicon glyphicon-exclamation-sign"></span> Ваши контактные данные (номер мобильного и эл. адрес)
                                                уже есть в вашем профиле. Пожалуйста, не добавляйте их здесь!</h5>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-12 text-right">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    Шаг 1
                                </a>
                                <a id="info" class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    Далее
                                </a>
                            </div>

                        </div>
                    </div>
                </div>


                <!-- Шаг 3 дата и время -->
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Шаг 3</a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">

                        <div class="panel-body">

                                <div class="form-group col-md-4">
                                    <!-- Data_picker -->
                                    <label for="DateDep">Дата отправления:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                        <input id="DateDep" class="form-control" type="text" >
                                        <input id="datestart" type="hidden" form="data">
                                       </div>
                                   </div>

                                   <div class="form-group col-md-4">
                                       <!-- Data_picker -->
                                    <label for="DateArrival">Дата прибытия:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                        <input id="DateArrival" class="form-control" type="text" value="">
                                        <input id="datefinish" type="hidden" form="data">
                                    </div>
                                </div>
                                <script>
                                    $('#DateDep').datetimepicker({
                                        mask: '9999-19-39 29:59'
                                    });
                                    $('#DateArrival').datetimepicker({
                                        mask: '9999-19-39 29:59'
                                    });
                                </script>

                            <div class="col-md-12 text-right">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Шаг 2</a>
                                <a id="datetime" class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="false" aria-controls="collapse4">
                                    Далее</a>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Шаг 4 стоимость -->
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="heading4">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="false" aria-controls="collapseThree">Шаг 4</a>
                        </h4>
                    </div>
                    <div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">
                        <div class="panel-body">

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="price" class="col-md-7 text-danger">Цена с пассажира:</label>
                                            <div class="input-group col-md-5">
                                                <input id="price" type="text" class="form-control"  placeholder="100" value="">
                                                <input id="id_price" type="hidden" form="data">
                                                <span class="input-group-addon"><i>грн.</i></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="seats" class="col-md-7 text-danger">Свободных мест:</label>
                                            <div class="input-group col-md-3">
                                                <input id="seats" type="text" class="form-control"  placeholder="5" value="">
                                                <input id="id_seats" type="hidden" form="data">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <div class="col-md-12 text-right">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Шаг 3</a>
                                <a id="cost" class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseMap" aria-expanded="false" aria-controls="collapseMap">
                                    Далее</a>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Шаг 5 Карта-->
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingMap">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseMap" aria-expanded="false" aria-controls="collapseThree">Маршрут</a>
                        </h4>
                    </div>
                    <div id="collapseMap" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingMap">

                        <div class="row-fluid">
                            <div id="map" style="width: 100%; height: 400px"></div>
                        </div>

                        <div class="panel-body">
                            <div class="row">
                                <div>
                                    <h4><span id="start"></span> &#8594; <span id="finish"></span> <span class="glyphicon glyphicon-road"></span></h4>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">Отправление:</div>
                                <div id="dtstart"> </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">Прибытие:</div>
                                <div id="dtfinish"> </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">Стоимость:</div>
                                <div id="prc"> </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">Автомобиль:</div>
                                <div id="auto"> </div>
                           </div>

                            <button type="button" class="btn btn-warning btn-lg pull-right" form="data">Создать</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</div>
