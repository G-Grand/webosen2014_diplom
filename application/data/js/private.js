$(function() {

    initPrivatePage();
    var privateTab = $('#private_tab');

    $(".btn-pref .btn").click(function () {
        $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
        $(this).removeClass("btn-default").addClass("btn-primary");
    });

    //Prvate tab script
    //==========================================
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
        $(this).closest('form').find('input').each(function(){
            $(this).removeAttr("disabled");
            $('#save').removeAttr("disabled");
        });
    });


    privateTab.on('change', 'input', function() {
        //найти предков, которые имеют класс .form-group, для установления success/error
        var formGroup = $(this).parents('.form-group');
        //найти glyphicon, который предназначен для показа иконки успеха или ошибки
        var glyphicon = formGroup.find('.form-control-feedback');
        //для валидации данных используем HTML5 функцию checkValidity
        if(this.id != "confirmNewPassword" && this.id != "inputNewPassword" && this.id != "changePassword") {
            markFieldValidity(formGroup, glyphicon, this.checkValidity());
        } else if (this.id == "confirmNewPassword") {
            if(this.value == document.getElementById("inputNewPassword").value){
                markFieldValidity(formGroup, glyphicon, true);
            } else {
                markFieldValidity(formGroup, glyphicon, false);
            }
        }
    });

    privateTab.on('click', '#save', function(){
        var formValid = true;
        $(this).closest('form').find('input').each(function(){
            var formGroup = $(this).parents('.form-group');
            var glyphicon = formGroup.find('.form-control-feedback');
            if(this.id != "confirmNewPassword" && this.id != "inputNewPassword" && this.id != "changePassword") {
                if(!markFieldValidity(formGroup, glyphicon, this.checkValidity())){
                    formValid = false; }

            } else if (this.id == "confirmNewPassword") {
                if(this.value == document.getElementById("inputNewPassword").value){
                    markFieldValidity(formGroup, glyphicon, true);
                } else {
                    markFieldValidity(formGroup, glyphicon, false);
                    formValid = false;
                }
            }
        });
        if(!formValid) { return; }

            var formData   = $('#personal_data').serialize();
            $.ajax({
                type: "POST",
                url: "/user/save",
                data: formData,
                dataType: "json",
                success: function (result) {
                    drawBlock($('#private_tab'), $('#privateTabTemplate'), result);
                }
            });
        showMessage();
    });

    //Cars tab script
    //==========================================

    var carsTab = $('#cars_tab');
    carsTab.on('click', 'button.update_car', function(){
        var carForm = $(this).closest('form');
        carForm.find('input').each(function() {
            $(this).removeAttr("disabled");
            carForm.find('button.save_car').removeAttr("disabled")
        });
    });

    carsTab.on('change', 'input', function(){
        var formGroup = $(this).parents('.form-group');
        var glyphicon = formGroup.find('.form-control-feedback');
        markFieldValidity(formGroup, glyphicon, this.checkValidity());
    });

    carsTab.on('click', 'button.save_car', function(){
        var formValid = true;
        var carForm = $(this).closest('form');
        carForm.find('input').each(function(){
            var formGroup = $(this).parents('.form-group');
            var glyphicon = formGroup.find('.form-control-feedback');
            if(!markFieldValidity(formGroup, glyphicon, this.checkValidity())){
                formValid = false;
            }
        });

        if(!formValid) { return; }

        var formData   = carForm.serialize();
        $.ajax({
            type: "POST",
            url: "/car/save",
            data: formData,
            dataType: "json",
            success: function (result) {
                console.log(result);
                clearBlock($('#cars_block'));
                drawItems($('#cars_block'), $('#carsTabTemplate'), result, 'Вы еще не добавили автомобиль');
            }
        });
        showMessage();
    });

    carsTab.on('click', '#add_car', function(){
        drawItems($('#cars_block'), $('#carsTabTemplate'), getNewCarJson());
    });

    //Routes tab script
    //==========================================



});

function initPrivatePage(){
    $.ajax({
        type: "POST",
        url: "/user/getPersonalData",
        dataType: "json",
        success: function(result) {
            console.log(result);
            //drawBlock($('#progress_bar'), $('#progressBarTemplate'), result);
            drawBlock($('#private_tab'), $('#privateTabTemplate'), result.user);
            drawItems($('#cars_block'), $('#carsTabTemplate'), result.cars, 'Вы еще не добавили автомобиль');
            result.routes = sortRoadsByDate(result.routes);
            //drawItems($('#routes_tab'), $('#routesTabTemplate'), sortRoadsByDate(result.routes), 'Выеще не добавили маршрут');
            drawBlock($('#routes_tab'), $('#routesTabTemplate'), result);
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

function clearBlock(block){
    block.html("");
}

function drawItems(block, source, ar, msg){
    if(source != ""){
        source   = source.html();
        var template = Handlebars.compile(source);

        if(ar.length == 0){
            block.html("<h3>" + msg + "</h3>");
            return;
        }

        ar.forEach(function(item, i, arr){
            block.append(template(item));
        });

    } else {
        block.html("");
    }
}

function markFieldValidity(formGroup, glyphicon, validity){
    if (validity) {
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
    }
    return validity;
}

function getNewCarJson(){
    return [{
        "brand" : "",
        "model" : "",
        "color" : "",
        "regnumber" : "",
        "seats" : "",
        "fuelrate" : ""

    }]
}

function sortRoadsByDate(roads) {
    return roads.sort(function(a,b){
        var dateA = new Date(a.startdate.replace(" ", "T"));
        var dateB = new Date(b.startdate.replace(" ", "T"));
        if(dateA > dateB)  { return 1; }
        if(dateA < dateB)  { return -1; }
        if(dateA == dateB) { return 0; }
    });
}





