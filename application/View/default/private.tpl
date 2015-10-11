<link href="/application/data/css/animate.css" rel="stylesheet">
<script src="/application/data/js/private.js" type="text/javascript"></script>
<div class="container">
    <!--    ------------------CONTENT------------------------------>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6"><h3>Приветствуем Вас, Владимир!</h3></div>
                <div class="col-sm-3"><span>Ваш профиль заполнен на </span></div>
                <!--                Progress bar profile-->
                <div class="col-sm-3">
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                            60%
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>

                <!--                Tabs block-->

                <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-primary" href="#tab1" data-toggle="tab">
                            <div class="hidden-xs">Мой профиль</div>
                        </button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default" href="#tab2" data-toggle="tab">
                            <div class="hidden-xs">Мои авто</div>
                        </button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="following" class="btn btn-default" href="#tab3" data-toggle="tab">
                            <div class="hidden-xs">Мои поездки</div>
                        </button>
                    </div>
                </div>
                <div class="well">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1">
                            <div class="row">
                                <div class="col-sm-2">
                                    <a href="#">
                                        <img class="img-rounded" src="/application/data/images/foto.jpg" style="height: 100px;width:100px " alt="FOTO">

                                    </a>
                                </div>
                                <div class="col-sm-6">
                                    <table>
                                        <tbody>
                                        <tr>
                                            <td class="col-sm-4 text-right">Имя:</td>
                                            <td class="col-sm-7"><input type="text" class="form-control" disabled value="Владимир"></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-4 text-right">Фамилия:</td>
                                            <td class="col-sm-7"><input type="text" class="form-control" disabled value="Коленцев"></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-4 text-right">Дата рождения:</td>
                                            <td class="col-sm-7"><input type="date" class="form-control" disabled value="1991-05-17"></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-4 text-right">Пол:</td>
                                            <td class="col-sm-7"><input type="text" class="form-control" disabled value="муж"></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-4 text-right">e-mail:</td>
                                            <td class="col-sm-7"><input type="email" class="form-control" disabled value="hhh@i.ua"></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-4 text-right">Телефон:</td>
                                            <td class="col-sm-7"><input type="text" class="form-control" disabled value="380 562 322222"></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-4 text-right">Пароль:</td>
                                            <td class="col-sm-7"><input type="password" class="form-control" disabled></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-sm-4 hidden-xs">
                                    <h2>Совет дня</h2>
                                    <p>Ваш профиль заполнен на 60%.
                                        Заполните недостающие данные, чтобы повысить уровень доверия к Вам на сервисе.</p>
                                </div>
                                <div class="clearfix"></div>
                                <div class="row">
                                    <div class="col-sm-4"><h4>Ваши предпочтения:</h4></div>
                                    <div class="col-sm-1"> <img style="width: 32px; height: 32 px" class="media-object" src="/application/data/images/no-pets.jpg"></div>
                                    <div class="col-sm-1"> <img style="width: 32px; height: 32 px" class="media-object" src="/application/data/images/no-eat.jpg"></div>
                                    <div class="col-sm-1"> <img style="width: 32px; height: 32 px" class="media-object" src="/application/data/images/no-talk.jpg"></div>
                                    <div class="col-sm-1"> <img style="width: 32px; height: 32 px" class="media-object" src="/application/data/images/no-phone.jpg"></div>
                                    <div class="col-sm-4"></div>
                                </div>
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
                                            <td class="col-sm-6"><input type="text" class="form-control" disabled value="Nissan"></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-remove"></span></td>

                                        </tr>
                                        <tr>
                                            <td class="col-sm-4 text-right">Модель:</td>
                                            <td class="col-sm-6"><input type="text" class="form-control" disabled value="Pilot"></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-remove"></span></td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-4 text-right">Гос.номер:</td>
                                            <td class="col-sm-6"><input type="text" class="form-control" disabled value="AE*****"></td>
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
                                            <td class="col-sm-6"><input type="text" class="form-control" disabled value="Nissan"></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-remove"></span></td>

                                        </tr>
                                        <tr>
                                            <td class="col-sm-4 text-right">Модель:</td>
                                            <td class="col-sm-6"><input type="text" class="form-control" disabled value="Pilot"></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-remove"></span></td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-4 text-right">Гос.номер:</td>
                                            <td class="col-sm-6"><input type="text" class="form-control" disabled value="AE*****"></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-edit"></span></td>
                                            <td class="col-sm-1"><span class="glyphicon glyphicon-remove"></span></td>
                                        </tr>
                                        </tbody>
                                    </table>


                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
                                        Добавить новое авто
                                    </button>

                                    <!-- Modal -->
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                                </div>
                                                <div class="modal-body">
                                                    ...
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
    </div>
</div>