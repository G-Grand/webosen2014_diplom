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
        //проверяем элемент input, в который пользователь вводит код CAPTCHA
        //получаем значение элемента input, содержащего код CAPTCHA
        var captcha = $("#text-captcha").val();
        //если код CAPTCHA пустой, то сразу сообщаем, что он не правильный
        if (captcha=='') {
            inputCaptcha = $("#text-captcha");
            formGroupCaptcha = inputCaptcha.parents('.form-group');
            glyphiconCaptcha = formGroupCaptcha.find('.form-control-feedback');
            formGroupCaptcha.addClass('has-error').removeClass('has-success');
            glyphiconCaptcha.addClass('glyphicon-remove').removeClass('glyphicon-ok');
        }
        //иначе запрашиваем результат у сервера через ajax
        else  {
            var dataString = 'captcha=' + captcha;
            $.ajax({
                type: "POST",
                url: "verify.php",
                data: dataString,
                success: function(result) {
                    inputCaptcha = $("#text-captcha");
                    formGroupCaptcha = inputCaptcha.parents('.form-group');
                    glyphiconCaptcha = formGroupCaptcha.find('.form-control-feedback');
                    //если результат, который вернул сервер, равен true,
                    //то отмечаем, что код валидный и изменяет цвет элементов на зелёный
                    if (result==="true") {
                        formGroupCaptcha.addClass('has-success').removeClass('has-error');
                        glyphiconCaptcha.addClass('glyphicon-ok').removeClass('glyphicon-remove');
                        //отметить, что код captcha введён правильно
                        if (formValid) {
                            //скрыть модальное окно
                            $('#myForm').hide();
                            //отобразить сообщение об успехе
                            $('#success-alert').removeClass('hidden');
                            $('#success-alert').removeClass('hidden');
                        }
                    }
                    //иначе отмечает, что код не валидный и изменяет цвет элементов на красный
                    else {
                        formGroupCaptcha.addClass('has-error').removeClass('has-success');
                        glyphiconCaptcha.addClass('glyphicon-remove').removeClass('glyphicon-ok');
                    }
                }
            });
        }
    });
});


//Отправка всех полей формы на сервер с помощью ajax jQuery

function call() {
    var msg   = $('#myForm').serialize();
    $.ajax({
        type: 'POST',
        url: 'reg.php',
        data: msg,
        success: function(data) {
            $('.results').html(data);
        },
        error:  function(xhr, str){
            alert('Возникла ошибка: ' + xhr.responseCode);
        }
    });

}