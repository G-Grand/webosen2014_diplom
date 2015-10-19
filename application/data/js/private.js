$(function() {

    initPrivatePage();
    var privateTab = $('#private_tab');

    $(".btn-pref .btn").click(function () {
        $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
        $(this).removeClass("btn-default").addClass("btn-primary");
    });

        privateTab.on('click', '#changePassword', function(){
        var formGroup = $('#confirmNewPassword').parents('.form-group');
        formGroup.removeClass('has-error').removeClass('has-success');
        formGroup.find('.form-control-feedback').removeClass('glyphicon-remove').removeClass('glyphicon-ok');
        if($('#changePassword').prop('checked')){
            $('#chngPswBox').removeClass('hidden');
        } else {
            $('#inputNewPassword').val('');
            $('#confirmNewPassword').val('');
            $('#chngPswBox').addClass('hidden');
        }
    });

    privateTab.on('click', '#changeData', function(){
        $('input').each(function(){
            $(this).removeAttr("disabled");
            $('#save').removeAttr("disabled");
        });
    });

    var formValid = true;
    //$('input').change(function() {
    privateTab.on('change', 'input', function() {
        //найти предков, которые имеют класс .form-group, для установления success/error
        var formGroup = $(this).parents('.form-group');
        //найти glyphicon, который предназначен для показа иконки успеха или ошибки
        var glyphicon = formGroup.find('.form-control-feedback');
        //для валидации данных используем HTML5 функцию checkValidity
        if(this.id != "confirmNewPassword" && this.id != "inputNewPassword" && this.id != "changePassword") {
            if (this.checkValidity()) {
                //добавить к formGroup класс .has-success, удалить has-error
                formGroup.addClass('has-success').removeClass('has-error');
                //добавить к glyphicon класс glyphicon-ok, удалить glyphicon-remove
                glyphicon.addClass('glyphicon-ok').removeClass('glyphicon-remove');
            } else {
                //добавить к formGroup класс .has-error, удалить .has-success
                formGroup.addClass('has-error').removeClass('has-success');
                //добавить к glyphicon класс glyphicon-remove, удалить glyphicon-ok
                glyphicon.addClass('glyphicon-remove').removeClass('glyphicon-ok');
                //отметить форму как не валидную
                formValid = false;
            }


        } else if (this.id == "confirmNewPassword") {
            if(this.value == document.getElementById("inputNewPassword").value){
                formGroup.addClass('has-success').removeClass('has-error').addClass('has-success');
                glyphicon.addClass('glyphicon-ok').removeClass('glyphicon-remove').addClass('glyphicon-ok');
            } else {
                formGroup.addClass('has-success').removeClass('has-success').addClass('has-error');
                glyphicon.addClass('glyphicon-ok').removeClass('glyphicon-ok').addClass('glyphicon-remove');
                formValid = false;
            }
        }
    });

    privateTab.on('click', '#save', function(){
        if(!formValid) {
            return;
        } else {
            var formData   = $('#personal_data').serialize();
            $.ajax({
                type: "POST",
                url: "/user/save",
                data: formData,
                dataType: "json",
                success: function (result) {
                    console.log(result);
                    //window.location = '/index/index';
                }
            });
        }
        showMessage();
    });

});

function initPrivatePage(){
    $.ajax({
        type: "POST",
        url: "/user/getPersonalData",
        dataType: "json",
        success: function(result) {
            console.log(result);
            //drawBlock($('#progress_bar'), $('#progressBarTemplate'), result);
            drawBlock($('#private_tab'), $('#privateTabTemplate'), result);
            drawCars($('#cars_tab'), $('#carsTabTemplate'), result);
        }
    });

}

function drawBlock(block, source, params){
    if(source != ""){
        source   = source.html();
        var template = Handlebars.compile(source);
        block.html("").append(template(params));
    } else {
        block.html("");
    }

}

function drawCars(block, source, params){
    if(source != ""){
        source   = source.html();
        var template = Handlebars.compile(source);

        if(params.cars.length == 0){
            block.html("<h3>Вы еще не добавили автомобиль</h3>");
            return;
        }

        params.cars.forEach(function(item, i, arr){
            block.append(template(item));
        });

    } else {
        block.html("");
    }
}





