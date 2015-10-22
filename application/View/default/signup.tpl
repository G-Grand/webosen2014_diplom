<div style="background: #D48607; width: 100%;height: 100%;">
    <div class="signup-back" >

    <div  class="container" >
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12 col-md-offset-4 col-sm-offset-3">
                <h1>Регистрация</h1>
                <form id="myForm" method="post" role="form" name="myForm" action="javascript:void(null);" onsubmit="call()">
                            <!-- Блок для ввода email -->
                            <div class="form-group has-feedback">
                                <label for="email" class="control-label">Введите email:</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                    <input id="email" type="email" class="form-control" required="required" name="email" value="">
                                </div>
                                <span class="glyphicon form-control-feedback"></span>
                            </div>
                            <!-- Конец блока для ввода email-->
                            <!-- Блок для ввода пароля -->
                            <div class="form-group has-feedback">
                                <label for="password" class="control-label">Введите пароль:</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="password" type="password" class="form-control" required="required" name="password"
                                           value="">
                                </div>
                                <span class="glyphicon form-control-feedback"></span>
                            </div>
                            <!-- Конец блока для ввода пароля-->
                            <!-- Блок для подтверждения пароля -->
                            <div class="form-group has-feedback">
                                <label for="pass_confirm" class="control-label">Подтвердите пароль:</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="pass_confirm" type="password" class="form-control" required="required" name="pass_confirm" value="">
                                </div>
                                <span class="glyphicon form-control-feedback"></span>
                            </div>
                            <!-- Конец блока для подтверждения пароля-->
                            <hr>
                            <!--Изображение, содержащее код CAPTCHA-->
                            <img id="img-captcha" src="/captcha">
                            <!--Элемент, запрашивающий новый код CAPTCHA-->
                            <div id="reload-captcha" class="btn btn-default"><i class="glyphicon glyphicon-refresh"></i> Обновить</div>
                            <!--Блок для ввода кода CAPTCHA-->
                            <div class="form-group has-feedback">
                                <label id="label-captcha" for="captcha" class="control-label">Пожалуйста, введите указанный на изображении код:</label>
                                <input id="captcha" name="captcha" type="text" class="form-control" required="required" value="">
                                <span class="glyphicon form-control-feedback"></span>
                            </div>


                        <button type="button" class="btn btn-default" onclick="history.back();">Отмена</button>
                        <button id="save" type="button" class="btn btn-primary">Регистрация</button>
                </form>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12 col-md-offset-4 col-sm-offset-3">
                <div id="success-alert" class="alert alert-success hidden" ></div>
            </div>
        </div>
    </div>
    </div>
</div>
