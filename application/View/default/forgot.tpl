<script src="/application/data/js/registr.js" type="text/javascript"></script>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-sm-6 col-xs-12 col-md-offset-4 col-sm-offset-3">
            <h3>Восстановление пароля</h3>

            <form id="myForm" method="post" role="form" name="myForm"><!-- ���� ��� ����� email -->
                <div class="form-group has-feedback">
                    <label for="email" class="control-label">Введите email:</label>

                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="email" type="email" class="form-control" required="required" name="email"
                               value="">
                    </div>
                    <span class="glyphicon form-control-feedback"></span>
                </div>
                <button id="save" type="button" class="btn btn-primary">Отправить</button>
            </form>
        </div>
    </div>
</div>

