<div class="container">
    <!--    ------------------CONTENT------------------------------>
    <div class="row">
        <div class="col-sm-6 col-xs-12"><h3>Приветствуем Вас, Владимир!</h3></div>
        <div class="col-sm-3 col-xs-6"><span>Ваш профиль заполнен на </span></div>
        <!--                Progress bar profile-->
        <div class="col-sm-3 col-xs-6">
            <div class="progress">
                <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                     style="width: 60%;">

                </div>
            </div>
        </div>
        <div class="clearfix"></div>

        <!--                Tabs block-->

        <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-primary" href="#private_tab" data-toggle="tab">
                    <span>Мой профиль</span>
                </button>
            </div>
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-default" href="#cars_tab" data-toggle="tab">
                    <span>Мои авто</span>
                </button>
            </div>
            <div class="btn-group" role="group">
                <button type="button" id="following" class="btn btn-default" href="#routes_tab" data-toggle="tab">
                    <span>Мои поездки</span>
                </button>
            </div>
        </div>
        <div class="well">
            <div class="tab-content">

                <div id="private_tab" class="tab-pane fade in active"></div>

                <div id="cars_tab" class="tab-pane fade in">
                    <div id="cars_block"></div>
                    <button id="add_car" class="btn btn-primary data-input" type="button">Добавить авто</button>
                </div>

                <div id="routes_tab" class="tab-pane fade in"></div>
            </div>
        </div>
    </div>
</div>

<script id="privateTabTemplate" type="text/x-handlebars-template">
    <div class="row">
        <div class="col-sm-2">
            <a href="#">
                <img class="img-rounded" src="/application/data/images/foto.jpg"
                     style="height: 100px;width:100px " alt="FOTO">
            </a>

            <div class="form-group has-feedback">
                <label for="uploadPhoto">Изменить фото:</label>
                <input type="file" id="uploadPhoto" disabled>
            </div>
        </div>
        <div class="col-sm-6">
            <form id="personal_data" class="form-horizontal">
                <div class="form-group has-feedback">
                    <label for="inputName" class="col-sm-4 control-label">Имя</label>

                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="username" name="username"
                               value="{{username}}" disabled>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="inputSurname" class="col-sm-4 control-label">Фамилия:</label>

                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="surname" name="surname"
                               value="{{surname}}" disabled>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="inputDate" class="col-sm-4 control-label">Дата рождения:</label>

                    <div class="col-sm-8">
                        <input type="date" class="form-control" id="birthday" name="birthday"
                               value="{{birthday}}" disabled>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="inputGender" class="col-sm-4 control-label">Пол:</label>

                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="gendor" name="gendor"
                               value="{{gendor}}" placeholder="M или W" pattern="[MWmw]{1}" disabled>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="inputEmail" class="col-sm-4 control-label">e-mail:</label>

                    <div class="col-sm-8">
                        <p class="form-control-static">{{email}}</p>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="inputPhone" class="col-sm-4 control-label">Телефон:</label>

                    <div class="col-sm-8">
                        <input type="tel" class="form-control" id="phone" name="phone"
                               value="{{phone}}" placeholder="38-056-2222222"
                               pattern="[0-9]{2}-[0-9]{3}-[0-9]{7}" disabled>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="changePassword" class="col-sm-4 control-label">Сменить пароль:</label>

                    <div class="col-sm-8">
                        <div class="checkbox">
                            <label>
                                <input id="changePassword" type="checkbox" name="password_changed" disabled>
                            </label>
                        </div>
                    </div>
                </div>
                <div id="chngPswBox" class="hidden">
                    <div class="form-group has-feedback">
                        <label for="inputNewPassword" class="col-sm-4 control-label">Новый пароль:</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="inputNewPassword">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="confirmNewPassword" class="col-sm-4 control-label">Подтвердите пароль:</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="confirmNewPassword" name="userpassword">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>
                    </div>
                </div>

                <div class="form-group has-feedback">
                    <label for="preferences" class="col-sm-4 control-label">Ваши
                        предпочтения:</label>

                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-sm-4"><img style="width: 32px; height: 32px"
                                                       class="media-object"
                                                       src="/application/data/images/no-pets.jpg"></div>
                            <div class="col-sm-4"><img style="width: 32px; height: 32px"
                                                       class="media-object"
                                                       src="/application/data/images/no-eat.jpg"></div>
                            <div class="col-sm-4"><img style="width: 32px; height: 32px"
                                                       class="media-object"
                                                       src="/application/data/images/no-talk.jpg"></div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8 col-sm-offset-4">
                    <button id="changeData" class="btn btn-default" type="button">Изменить данные
                    </button>
                    <button id="save" class="btn btn-primary data-input" type="button"
                            disabled="disabled">Сохранить
                    </button>
                </div>
            </form>
        </div>
        <div class="col-sm-4 hidden-xs">
            <h2>Совет дня</h2>

            <p id="progress-message">Ваш профиль заполнен на 60%.
                Заполните недостающие данные, чтобы повысить уровень доверия к Вам на сервисе.</p>
        </div>
        <div class="clearfix"></div>
    </div>
</script>
<!-- ======================================================== -->
<script id="carsTabTemplate" type="text/x-handlebars-template">
    <div class="panel panel-default">
        <div class="row">
            <div class="col-sm-4">
                <a href="#">
                    <img class="img-rounded" src="/application/data/images/auto_foto.jpg"
                         style="height: 200px;width:300px " alt="Фото авто">
                </a>

                <div class="form-group has-feedback">
                    <label for="uploadPhoto">Загрузить фото:</label>
                    <input type="file" id="uploadPhoto">
                </div>
            </div>
            <div class="col-sm-8">
                <form id="car_{{regnumber}}" class="form-horizontal" name="car_{{regnumber}}">
                    <div class="form-group has-feedback">
                        <label for="carBrend" class="col-sm-3 control-label">Марка:</label>

                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="brend" value="{{brand}}" disabled name="brand"
                                    placeholder="Honda">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="carModel" class="col-sm-3 control-label">Модель:</label>

                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="model" value="{{model}}" disabled name="model"
                                   placeholder="Accord">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="carColor" class="col-sm-3 control-label">Цвет:</label>

                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="color" value="{{color}}" disabled name="color"
                                   placeholder="черный">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="carNumber" class="col-sm-3 control-label">Гос.номер:</label>

                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="regnumber" value="{{regnumber}}" disabled name="regnumber"
                                   pattern="[A-Z]{2}[0-9]{4}[A-Z]{2}" placeholder="АЕ2345ІІ">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="carSeats" class="col-sm-3 control-label">Количество мест:</label>

                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="seats" value="{{seats}}" disabled name="seats"
                                   pattern="[0-9]{1,2}" placeholder="4">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="carFuel" class="col-sm-3 control-label">Расход топлива
                            л/100км:</label>

                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="fuelrate" value="{{fuelrate}}" disabled name="fuelrate"
                                   pattern="(\d*[.])?\d+" placeholder="10">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>
                        <div class="col-sm-6">
                            <button class="btn btn-default update_car"
                                    type="button">Изменить
                            </button>
                            <button class="btn btn-primary data-input save_car"
                                    type="button"
                                    disabled>Сохранить
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</script>

<script id="routeTabTemplate" type="text/x-handlebars-template">
    <h4>No routes</h4>
</script>

<script id="routesTabTemplate" type="text/x-handlebars-template">
    {{#each routes}}
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="panel-group" style="color: black;">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h4>Отправление {{startdate}}</h4>
                                </div>
                                <div class="col-sm-6">
                                    <div class="row">
                                        <div class="panel panel-default col-sm-10">
                                            <span class="pull-left">{{start}}</span>
                                            <span class="pull-right">{{finish}}</span>
                                        </div>
                                        <div class="col-sm-2 text-center">
                                            <a data-toggle="collapse" href="#{{id}}"><i class="glyphicon
                                                            glyphicon-chevron-down"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="{{id}}" class="panel-collapse collapse">
                            <div class="panel body">
                                <h4>Водитель:</h4>
                                <div class="row">
                                    <div class="col-sm-2 text-center">
                                        <img class="img-circle text-center" style="width: 100px; height:100px;"
                                             src="/application/data/images/icon-user.svg" alt="icon_user">
                                    </div>
                                    <div class="col-sm-3">
                                        <p>{{../user.username}} {{../user.surname}}</p>
                                        <p>Возраст:{{../user.age}}</p>
                                        <p>{{../user.rate}} <i class="glyphicon glyphicon-star"></i></p>
                                    </div>
                                    <div class="col-sm-4 text-center">
                                        <p>Автомобиль:  {{car.brand}} {{car.model}}</p>
                                        <p>Гос.номер:  {{autoid}}</p>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="row">
                                            <div class="col-sm-4"><img style="width: 32px; height: 32px"
                                                                       class="media-object"
                                                                       src="/application/data/images/no-pets.jpg"></div>
                                            <div class="col-sm-4"><img style="width: 32px; height: 32px"
                                                                       class="media-object"
                                                                       src="/application/data/images/no-eat.jpg"></div>
                                            <div class="col-sm-4"><img style="width: 32px; height: 32px"
                                                                       class="media-object"
                                                                       src="/application/data/images/no-talk.jpg"></div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <h4>Пассажиры:</h4>
                                <div class="row">
                                    <div class="col-sm-3 col-sm-offset-2">
                                        <p>Николай Веревкин</p>
                                        <p>Ольга Петренко</p>
                                    </div>
                                    <div class="col-sm-2">
                                        <p>(24 <i class="glyphicon glyphicon-star"></i>)</p>
                                        <p>(24 <i class="glyphicon glyphicon-star"></i>)</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {{/each}}
</script>
