$(function() {
//выводит новый код CAPTCHA при нажатии на кнопку Обновить
    $("#reload-captcha").click(function() {
        $('#img-captcha').attr('src', '/captcha?id='+Math.random()+'');
    });
//при нажатии на кнопку Регистрация (id="save")
    $('#save').click(function() {
        //переменная formValid
        var formValid = true;
        //перебирает все элементы управления input, кроме CAPTCHA
        $('input').each(function() {
            //если текущий элемент CAPTCHA, то пропустить его
            if  ($(this).attr('id') == 'text-captcha') { return true; }
            //найти предков, которые имеют класс .form-group, для установления success/error
            var formGroup = $(this).parents('.form-group');
            //найти glyphicon, который предназначен для показа иконки успеха или ошибки
            var glyphicon = formGroup.find('.form-control-feedback');
            //для валидации данных используем HTML5 функцию checkValidity
            if (this.checkValidity() && this.id != "pass_confirm") {
                //добавить к formGroup класс .has-success, удалить has-error
                formGroup.addClass('has-success').removeClass('has-error');
                //добавить к glyphicon класс glyphicon-ok, удалить glyphicon-remove
                glyphicon.addClass('glyphicon-ok').removeClass('glyphicon-remove');
            } else if(this.id == "pass_confirm" && this.value == document.getElementById("password").value) {
                formGroup.addClass('has-success').removeClass('has-error');
                glyphicon.addClass('glyphicon-ok').removeClass('glyphicon-remove');
            } else {
                //добавить к formGroup класс .has-error, удалить .has-success
                formGroup.addClass('has-error').removeClass('has-success');
                //добавить к glyphicon класс glyphicon-remove, удалить glyphicon-ok
                glyphicon.addClass('glyphicon-remove').removeClass('glyphicon-ok');
                //отметить форму как не валидную
                formValid = false;
            }
        });

        var inputCaptcha = $("#text-captcha");
        var captcha = inputCaptcha.val();
        var formGroupCaptcha = inputCaptcha.parents('.form-group');
        var glyphiconCaptcha = formGroupCaptcha.find('.form-control-feedback');

        //console.log(formGroupCaptcha);
        if (captcha=='') {
            formGroupCaptcha.addClass('has-error').removeClass('has-success');
            glyphiconCaptcha.addClass('glyphicon-remove').removeClass('glyphicon-ok');
            formValid = false;
        }else {
            formGroupCaptcha.addClass('has-success').removeClass('has-error');
            glyphiconCaptcha.addClass('glyphicon-ok').removeClass('glyphicon-remove');
        }

        if(!formValid) { return; }

        var msg   = $('#myForm').serialize();
        console.log(msg);
        $.ajax({
            type: "POST",
            url: "/user/register",
            data: msg,
            dataType: "json",
            success: function(result) {
                console.log(result);
                $('#myForm').hide();
            }
        });
                //window.location = 'http://webosen2014_diplom/index/index';
                window.location = '/index/index';
        showMessage();

    });
});

