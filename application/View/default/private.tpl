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
                    60%
                </div>
            </div>
        </div>
        <div class="clearfix"></div>

        <!--                Tabs block-->

        <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-primary" href="#tab1" data-toggle="tab">
                    <span>Мой профиль</span>
                </button>
            </div>
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-default" href="#tab2" data-toggle="tab">
                    <span>Мои авто</span>
                </button>
            </div>
            <div class="btn-group" role="group">
                <button type="button" id="following" class="btn btn-default" href="#tab3" data-toggle="tab">
                    <span>Мои поездки</span>
                </button>
            </div>
        </div>
        <div class="well">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1">
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
                            <form class="form-horizontal">
                                <div class="form-group has-feedback">
                                    <label for="inputName" class="col-sm-4 control-label">Имя</label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="inputName"
                                               value="Владимир" disabled>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <div class="form-group has-feedback">
                                    <label for="inputSurname" class="col-sm-4 control-label">Фамилия:</label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="inputSurname"
                                               value="Коленцев" disabled>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <div class="form-group has-feedback">
                                    <label for="inputDate" class="col-sm-4 control-label">Дата рождения:</label>

                                    <div class="col-sm-8">
                                        <input type="date" class="form-control" id="inputDate"
                                               value="1991-05-17" disabled>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <div class="form-group has-feedback">
                                    <label for="inputGender" class="col-sm-4 control-label">Пол:</label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="inputGender"
                                               value="М" placeholder="M или Ж" pattern="[МЖмж]{1}" disabled>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <div class="form-group has-feedback">
                                    <label for="inputEmail" class="col-sm-4 control-label">e-mail:</label>

                                    <div class="col-sm-8">
                                        <p class="form-control-static">email@example.com</p>
                                    </div>
                                </div>
                                <div class="form-group has-feedback">
                                    <label for="inputPhone" class="col-sm-4 control-label">Телефон:</label>

                                    <div class="col-sm-8">
                                        <input type="tel" class="form-control" id="inputPhone"
                                               value="38-056-2222222" placeholder="38-056-2222222"
                                               pattern="[0-9]{2}-[0-9]{3}-[0-9]{7}" disabled>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="changePassword" class="col-sm-4 control-label">Сменить пароль:</label>

                                    <div class="col-sm-8">
                                        <div class="checkbox">
                                            <label>
                                                <input id="changePassword" type="checkbox" disabled>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div id="chngPswBox">

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
                                    <button id="saveData" class="btn btn-primary data-input" type="submit"
                                            disabled="disabled">Сохранить
                                    </button>
                                </div>
                            </form>
                            <hr/>
                        </div>
                        <div class="col-sm-4 hidden-xs">
                            <h2>Совет дня</h2>

                            <p id="progress-message">Ваш профиль заполнен на 60%.
                                Заполните недостающие данные, чтобы повысить уровень доверия к Вам на сервисе.</p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="tab-pane fade in" id="tab2">
                    <div class="panel panel-default">
                        <div class="row">
                            <div class="col-sm-4">
                                <a href="#">
                                    <img class="img-rounded" src="/application/data/images/auto_foto.jpg"
                                         style="height: 200px;width:300px " alt="Фото авто">
                                </a>

                                <div class="form-group has-feedback">
                                    <label for="uploadPhoto">Изменить фото:</label>
                                    <input type="file" id="uploadPhoto" disabled>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <form class="form-horizontal">
                                    <div class="form-group has-feedback">
                                        <label for="carBrend" class="col-sm-3 control-label">Марка:</label>

                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="carBrend"
                                                   value="Honda" disabled>
                                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="carModel" class="col-sm-3 control-label">Модель:</label>

                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="carModel"
                                                   value="Accord" disabled>
                                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="carColor" class="col-sm-3 control-label">Цвет:</label>

                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="carColor"
                                                   value="черный" disabled>
                                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="carNumber" class="col-sm-3 control-label">Гос.номер:</label>

                                        <div class="col-sm-3">
                                            <p class="form-control-static">АЕ2345ІІ</p>
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="carSeats" class="col-sm-3 control-label">Количество мест:</label>

                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="carSeats"
                                                   value="4" disabled>
                                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="carFuel" class="col-sm-3 control-label">Расход топлива
                                            л/100км:</label>

                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="carFuel"
                                                   value="10" disabled>
                                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-sm-6">
                                            <button id="deleteCarData" class="btn btn-default"
                                                    type="button">Удалить авто
                                            </button>
                                            <button id="changeCarData" class="btn btn-default"
                                                    type="button">Редактировать
                                            </button>
                                            <button id="saveCarData" class="btn btn-primary data-input" type="submit"
                                                    disabled="disabled">Сохранить
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
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
                                <form class="form-horizontal">
                                    <div class="form-group has-feedback">
                                        <label for="carBrend" class="col-sm-3 control-label">Марка:</label>

                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="carBrend"
                                                   placeholder="Honda">
                                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="carModel" class="col-sm-3 control-label">Модель:</label>

                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="carModel"
                                                   placeholder="Accord">
                                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="carColor" class="col-sm-3 control-label">Цвет:</label>

                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="carColor"
                                                   placeholder="черный">
                                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="carNumber" class="col-sm-3 control-label">Гос.номер:</label>

                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="carColor"
                                                   placeholder="АЕ2345ІІ">
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="carSeats" class="col-sm-3 control-label">Количество мест:</label>

                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="carSeats"
                                                   placeholder="4">
                                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label for="carFuel" class="col-sm-3 control-label">Расход топлива
                                            л/100км:</label>

                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="carFuel"
                                                   placeholder="10">
                                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-sm-6">
                                            <button id="cancelNewCar" class="btn btn-default"
                                                    type="button">Отменить
                                            </button>
                                            <button id="saveNewCar" class="btn btn-primary data-input"
                                                    type="submit"
                                                    disabled="disabled">Сохранить
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <button id="addCar" class="btn btn-primary data-input" type="submit">Добавить авто</button>
                </div>
                <div class="tab-pane fade in" id="tab3">
                    <h4>Данных нет</h4>
                </div>
            </div>
        </div>


    </div>
</div>

<script id="chngPswBoxTemplate" type="text/x-handlebars-template">
    <div class="form-group has-feedback">
        <label for="inputNewPassword" class="col-sm-4 control-label">Новый пароль:</label>
        <div class="col-sm-8"><input type="password" class="form-control" id="inputNewPassword">
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
        </div>
    </div>
    <div class="form-group has-feedback">
        <label for="confirmNewPassword" class="col-sm-4 control-label">Подтвердите пароль:</label>
        <div class="col-sm-8"><input type="password" class="form-control" id="confirmNewPassword">
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
        </div>
    </div>
</script>
