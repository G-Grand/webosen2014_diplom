$(function() {
//������� ����� ��� CAPTCHA ��� ������� �� ������ ��������
    $("#reload-captcha").click(function() {
        $('#img-captcha').attr('src', '/captcha?id='+Math.random()+'');
    });
//��� ������� �� ������ ����������� (id="save")
    $('#save').click(function() {
        //���������� formValid
        var formValid = true;
        //���������� ��� �������� ���������� input, ����� CAPTCHA
        $('input').each(function() {
            //���� ������� ������� CAPTCHA, �� ���������� ���
            if  ($(this).attr('id') == 'text-captcha') { return true; }
            //����� �������, ������� ����� ����� .form-group, ��� ������������ success/error
            var formGroup = $(this).parents('.form-group');
            //����� glyphicon, ������� ������������ ��� ������ ������ ������ ��� ������
            var glyphicon = formGroup.find('.form-control-feedback');
            //��� ��������� ������ ���������� HTML5 ������� checkValidity
            if (this.checkValidity() && this.id != "pass_confirm") {
                //�������� � formGroup ����� .has-success, ������� has-error
                formGroup.addClass('has-success').removeClass('has-error');
                //�������� � glyphicon ����� glyphicon-ok, ������� glyphicon-remove
                glyphicon.addClass('glyphicon-ok').removeClass('glyphicon-remove');
            } else if(this.id == "pass_confirm" && this.value == document.getElementById("password").value) {
                formGroup.addClass('has-success').removeClass('has-error');
                glyphicon.addClass('glyphicon-ok').removeClass('glyphicon-remove');
            } else {
                //�������� � formGroup ����� .has-error, ������� .has-success
                formGroup.addClass('has-error').removeClass('has-success');
                //�������� � glyphicon ����� glyphicon-remove, ������� glyphicon-ok
                glyphicon.addClass('glyphicon-remove').removeClass('glyphicon-ok');
                //�������� ����� ��� �� ��������
                formValid = false;
            }
        });
        //��������� ������� input, � ������� ������������ ������ ��� CAPTCHA
        //�������� �������� �������� input, ����������� ��� CAPTCHA
        var captcha = $("#text-captcha").val();
        //���� ��� CAPTCHA ������, �� ����� ��������, ��� �� �� ����������
        if (captcha=='') {
            inputCaptcha = $("#text-captcha");
            formGroupCaptcha = inputCaptcha.parents('.form-group');
            glyphiconCaptcha = formGroupCaptcha.find('.form-control-feedback');
            formGroupCaptcha.addClass('has-error').removeClass('has-success');
            glyphiconCaptcha.addClass('glyphicon-remove').removeClass('glyphicon-ok');
        }
        //����� ����������� ��������� � ������� ����� ajax
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
                    //���� ���������, ������� ������ ������, ����� true,
                    //�� ��������, ��� ��� �������� � �������� ���� ��������� �� ������
                    if (result==="true") {
                        formGroupCaptcha.addClass('has-success').removeClass('has-error');
                        glyphiconCaptcha.addClass('glyphicon-ok').removeClass('glyphicon-remove');
                        //��������, ��� ��� captcha ����� ���������
                        if (formValid) {
                            //������ ��������� ����
                            $('#myForm').hide();
                            //���������� ��������� �� ������
                            $('#success-alert').removeClass('hidden');
                            $('#success-alert').removeClass('hidden');
                        }
                    }
                    //����� ��������, ��� ��� �� �������� � �������� ���� ��������� �� �������
                    else {
                        formGroupCaptcha.addClass('has-error').removeClass('has-success');
                        glyphiconCaptcha.addClass('glyphicon-remove').removeClass('glyphicon-ok');
                    }
                }
            });
        }
    });
});


//�������� ���� ����� ����� �� ������ � ������� ajax jQuery

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
            alert('�������� ������: ' + xhr.responseCode);
        }
    });

}