$(function() {
    $(".btn-pref .btn").click(function () {
        $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
        $(this).removeClass("btn-default").addClass("btn-primary");
    });

    $('#changeData').click(function(){
        $('input').each(function(){
            $(this).removeAttr("disabled");
        });

            var formValid = true;
            $('input').change(function() {
                //найти предков, которые имеют класс .form-group, для установления success/error
                var formGroup = $(this).parents('.form-group');
                //найти glyphicon, который предназначен для показа иконки успеха или ошибки
                var glyphicon = formGroup.find('.form-control-feedback');
                //для валидации данных используем HTML5 функцию checkValidity
                if (this.checkValidity()&& this.id != "confirmNewPassword") {
                    //добавить к formGroup класс .has-success, удалить has-error
                    formGroup.addClass('has-success').removeClass('has-error');
                    //добавить к glyphicon класс glyphicon-ok, удалить glyphicon-remove
                    glyphicon.addClass('glyphicon-ok').removeClass('glyphicon-remove');
                }else if(this.id == "confirmNewPassword" && this.value == document.getElementById("inputNewPassword").value) {
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

                   // $('#changePassword').checked.innerHTML = '<div class="form-group has-feedback"><label for="inputNewPassword" class="col-sm-4 control-label">Новый пароль:</label><div class="col-sm-8"><input type="password" class="form-control" id="inputNewPassword" disabled><span class="glyphicon form-control-feedback" aria-hidden="true"></span></div></div><div class="form-group has-feedback"><label for="confirmNewPassword" class="col-sm-4 control-label">Подтвердите пароль:</label><div class="col-sm-8"><input type="password" class="form-control" id="confirmNewPassword" disabled><span class="glyphicon form-control-feedback" aria-hidden="true"></span></div></div>';
                if(formValid){
                    $('#saveData').removeAttr("disabled");
                }
                //if($('#changePassword').checked){
                //    $('#chngPswBox').after('<div class="form-group has-feedback"><label for="inputNewPassword" class="col-sm-4 control-label">Новый пароль:</label><div class="col-sm-8"><input type="password" class="form-control" id="inputNewPassword" disabled><span class="glyphicon form-control-feedback" aria-hidden="true"></span></div></div><div class="form-group has-feedback"><label for="confirmNewPassword" class="col-sm-4 control-label">Подтвердите пароль:</label><div class="col-sm-8"><input type="password" class="form-control" id="confirmNewPassword" disabled><span class="glyphicon form-control-feedback" aria-hidden="true"></span></div></div>');
                //}
                $('#save').click(function() {
                    if (this.val() != ''){
                        formGroup.addClass('has-success').removeClass('has-error');
                        glyphicon.addClass('glyphicon-ok').removeClass('glyphicon-remove');
                    }else {
                        //добавить к formGroup класс .has-error, удалить .has-success
                        formGroup.addClass('has-error').removeClass('has-success');
                        //добавить к glyphicon класс glyphicon-remove, удалить glyphicon-ok
                        glyphicon.addClass('glyphicon-remove').removeClass('glyphicon-ok');
                        //отметить форму как не валидную
                        formValid = false;
                    }

                });
                $('#changePassword').click(function(){
                    if($('#changePassword').attr("checked") == "checked"){
                        $('#chngPswBox').after('<div class="form-group has-feedback"><label for="inputNewPassword" class="col-sm-4 control-label">Новый пароль:</label><div class="col-sm-8"><input type="password" class="form-control" id="inputNewPassword" disabled><span class="glyphicon form-control-feedback" aria-hidden="true"></span></div></div><div class="form-group has-feedback"><label for="confirmNewPassword" class="col-sm-4 control-label">Подтвердите пароль:</label><div class="col-sm-8"><input type="password" class="form-control" id="confirmNewPassword" disabled><span class="glyphicon form-control-feedback" aria-hidden="true"></span></div></div>');
                    }
                })

            });
    });
    $(".form-horizontal input").
        (function() {

        var numValid = 0;
        $(".form-horizontal input").each(function() {
            if (this.val != '') {
                numValid++;
            }
        });

        var progress = $(".progress-bar"),
            progressMessage = $("#progress-message");

        if (numValid == 0) {
            progress.attr("aria-valuenow", "0");
            progressMessage.text("The form, it wants you.");
        }
        if (numValid == 1) {
            progress.attr("aria-valuenow", "20");
            progressMessage.text("There you go, great start!");
        }
        if (numValid == 2) {
            progress.attr("aria-valuenow", "40");
            progressMessage.text("Nothing can stop you now.");
        }
        if (numValid == 3) {
            progress.attr("aria-valuenow", "60");
            progressMessage.text("You're basically a hero, right?");
        }
        if (numValid == 4) {
            progress.attr("aria-valuenow", "80");
            progressMessage.text("They are going to write songs about you.");
        }
        if (numValid == 5) {
            progress.attr("aria-valuenow", "95");
            progressMessage.text("SO CLOSE. PRESS THE THING.");
        }

    });
});

$('#myModal').on('shown.bs.modal', function () {
    $('#myInput').focus()
});


