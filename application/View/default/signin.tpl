<script src="/application/data/js/registr.js" type="text/javascript"></script>
<h1 class="text-center">Вход</h1>
<div class="container container-signin">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">


            <form id="myForm" method="post" role="form" name="myForm"><!-- Блок для ввода email -->
                <div class="form-group has-feedback">
                    <label for="email" class="control-label">Введите email:</label>

                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="email" type="email" class="form-control" required="required" name="email"
                               value="">
                    </div>
                    <span class="glyphicon form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <label for="password" class="control-label">Введите пароль:</label>

                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password" type="password" class="form-control" required="required"
                               name="password"
                               value="">
                    </div>
                    <span class="glyphicon form-control-feedback"></span>
                </div>

                <div class="form-group">
                    <div class="checkbox col-md-6 col-sm-6 text-left">
                        <label><input type="checkbox">Запомнить меня</label>
                    </div>
                    <div class="col-md-6 col-sm-6 text-right">
                        <button id="save" type="button" class="btn btn-primary btn-lg">Войти</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-12" style="margin-top:40px">
            <div class="text-center">
                <a href="forgot">Напомнить пароль</a> | <a href="signup">Регистрация</a>
            </div>
        </div>

        <div class="col-md-12" style="margin-top:30px">
            <h4 class="text-center">Или войдите с помошью:</h4>

            <div class="social-button" style="margin-top:20px">
                <p><a href="#"><img src="/application/data/images/vk.png" alt="Vk"></a></p>

                <p><a href="#"><img src="/application/data/images/facebook.png" alt="facebook"></a></p>

                <p><a href="#"><img src="/application/data/images/twitter.png" alt="twitter"></a></p>

                <p><a href="#"><img src="/application/data/images/blogspot.png" alt="blogest"></a></p>
            </div>
        </div>

    </div>
</div>
