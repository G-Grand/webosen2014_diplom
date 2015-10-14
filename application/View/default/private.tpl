<link href="/application/data/css/animate.css" rel="stylesheet">
<script src="/application/data/js/private.js" type="text/javascript"></script>
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
                                <div class="form-group has-feedback">
                                    <label for="inputPassword" class="col-sm-4 control-label">Новый пароль:</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" id="inputPassword"
                                                   disabled>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
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
                                            <div class="col-sm-4"><img style="width: 32px; height: 32px" class="media-object"
                                                                   src="/application/data/images/no-eat.jpg"></div>
                                                <div class="col-sm-4"><img style="width: 32px; height: 32px" class="media-object"
                                                                   src="/application/data/images/no-talk.jpg"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-8 col-sm-offset-4">
                                <button id="changeData" class="btn btn-default" type="button">Изменить данные</button>
                                <button id="saveData" class="btn btn-primary data-input" type="submit"
                                                disabled="disabled">Сохранить</button>
                                </div>
                            </form>
                            <hr/>
                        </div>
                        <div class="col-sm-4 hidden-xs">
                            <h2>Совет дня</h2>

                            <p>Ваш профиль заполнен на 60%.
                                Заполните недостающие данные, чтобы повысить уровень доверия к Вам на сервисе.</p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="tab-pane fade in" id="tab2">
                    <div class="row">
                        <div class="col-sm-6">

                            <h4>Авто №1</h4>
                            <table>
                                <tbody>
                                <tr>
                                    <td class="col-sm-4 text-right">Бренд:</td>
                                    <td class="col-sm-6"><input type="text" class="form-control" disabled
                                                                value="Nissan"></td>
                                    <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                    <td class="col-sm-1"><span class="glyphicon glyphicon-remove"></span></td>

                                </tr>
                                <tr>
                                    <td class="col-sm-4 text-right">Модель:</td>
                                    <td class="col-sm-6"><input type="text" class="form-control" disabled value="Pilot">
                                    </td>
                                    <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                    <td class="col-sm-1"><span class="glyphicon glyphicon-remove"></span></td>
                                </tr>
                                <tr>
                                    <td class="col-sm-4 text-right">Гос.номер:</td>
                                    <td class="col-sm-6"><input type="text" class="form-control" disabled
                                                                value="AE*****"></td>
                                    <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                    <td class="col-sm-1"><span class="glyphicon glyphicon-remove"></span></td>
                                </tr>
                                </tbody>
                            </table>
                            <h4>Авто №2</h4>
                            <table>
                                <tbody>
                                <tr>
                                    <td class="col-sm-4 text-right">Бренд:</td>
                                    <td class="col-sm-6"><input type="text" class="form-control" disabled
                                                                value="Nissan"></td>
                                    <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                    <td class="col-sm-1"><span class="glyphicon glyphicon-remove"></span></td>

                                </tr>
                                <tr>
                                    <td class="col-sm-4 text-right">Модель:</td>
                                    <td class="col-sm-6"><input type="text" class="form-control" disabled value="Pilot">
                                    </td>
                                    <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                    <td class="col-sm-1"><span class="glyphicon glyphicon-remove"></span></td>
                                </tr>
                                <tr>
                                    <td class="col-sm-4 text-right">Гос.номер:</td>
                                    <td class="col-sm-6"><input type="text" class="form-control" disabled
                                                                value="AE*****"></td>
                                    <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                    <td class="col-sm-1"><span class="glyphicon glyphicon-remove"></span></td>
                                </tr>
                                </tbody>
                            </table>


                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal"
                                    data-target="#myModal">
                                Добавить новое авто
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                        </div>
                                        <div class="modal-body">
                                            ...
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                            </button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="tab-pane fade in" id="tab3">
                    <h4>Данных нет</h4>
                </div>
            </div>
        </div>


    </div>
</div>
