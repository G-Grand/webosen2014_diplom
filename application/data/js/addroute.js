var startCoords,finishCoords;
var positionStart = [];
var revposStart = [48.464717, 35.046181];
var mapCoords = {};

var myMap;
//console.log(init)
function init() {
    myMap = new ymaps.Map('map', {
        center: revposStart,
        zoom: 6,
        type: 'yandex#map',
        controls: []
    });

}
ymaps.ready(init);

$(function (){
    var findCoords = {};

    $("#inputStart").on("keypress", function(){
        var datalist = document.getElementById("start_list");
        getGeoTarget(this, findCoords["startPoint"], datalist, 'startCoords')
    });

    $("#inputFinish").on("keypress", function(){
        var datalist = document.getElementById("finish_list");
        getGeoTarget(this, findCoords["finishPoint"], datalist, 'finishCoords')
    });

    $('#setCoords').click(function() {
        //переменная formValid
        var formValid = true;
        $('input').each(function() {
            //найти предков, которые имеют класс .form-group, для установления success/error
            var formGroup = $(this).parents('.form-group');
            //найти glyphicon, который предназначен для показа иконки успеха или ошибки
            var glyphicon = formGroup.find('.form-control-feedback');
            //для валидации данных используем HTML5 функцию checkValidity
            if (this.checkValidity()) {
                //добавить к formGroup класс .has-success, удалить has-error
                formGroup.addClass('has-success').removeClass('has-error');
                //добавить к glyphicon класс glyphicon-ok, удалить glyphicon-remove
                glyphicon.addClass('glyphicon-ok').removeClass('glyphicon-remove');
            }  else {
                //добавить к formGroup класс .has-error, удалить .has-success
                formGroup.addClass('has-error').removeClass('has-success');
                //добавить к glyphicon класс glyphicon-remove, удалить glyphicon-ok
                glyphicon.addClass('glyphicon-remove').removeClass('glyphicon-ok');
                //отметить форму как не валидную
                formValid = false;
            }
        });

        ymaps.route([
            mapCoords['startCoords'],mapCoords['finishCoords']
        ])
            .then(
            function (route) {
                myMap.geoObjects.add(route);
            },
            function (error) {
                alert("Возникла ошибка: " + error.message);
            }
        );

    });

});


//календарь с числом старый
//$('document').ready(function (){
    // Date-field
//    $('.datetimepicker').each(function() {
//        $(this).datetimepicker({
//            language: 'ru'
//        });
//    });
//});

/**
 *
 * @param field target element object
 * @param point
 * @param datalist popup element object
 * @param coords string point nfvt
 */
var  text,nameCity, nameStreet, numberHome;
function getGeoTarget(field, point, datalist, coords)
{
    clearTimeout(point);
    point = setTimeout(function(){
        var url = "https://geocode-maps.yandex.ru/1.x/?format=json&geocode="+field.value;
        $.ajax({
            url: url,
            type: "GET",
            dataType: "json",
            success: function (resp) {
                var geoList = resp.response.GeoObjectCollection.featureMember;
                var list = "";
                for(var i=0; i<geoList.length; ++i) {
                    var obj = geoList[i].GeoObject;
                    var value = obj.Point.pos;
                    var text = obj.metaDataProperty.GeocoderMetaData.text;
                    try {
                        if(obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.Locality.LocalityName == "Киев"){
                             nameCity = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.Locality.LocalityName; //название города
                             nameStreet = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.Locality.Thoroughfare.ThoroughfareName; //название улицы
                             numberHome = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.Locality.Thoroughfare.Premise.PremiseNumber; //номер дома
                        } else {
                             nameCity = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.LocalityName; //название города
                             nameStreet = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.Thoroughfare.ThoroughfareName; //название улицы
                             numberHome = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.Thoroughfare.Premise.PremiseNumber; //номер дома
                        }
                    } catch (err) {
                    }
                    list += "<option value='"+value+"'>"+text+"</option>";
                }
                datalist.innerHTML = list;
                datalist.style.display = "block";
                $(datalist).find("option").each(function() {
                    $(this).on("click", function() {
                        field.value = $(this).text();
                        mapCoords[coords] = $(this).text();
                        datalist.style.display = "none";
                    });
                });
            }
        })
    }, 500);
// координаты
    $("#setCoords").click(function () {
        var start = $("#inputStart").val();
        $("#id_citystart").val(start);

        $('#start').html(
            '<span>'+start+'</span>'
        );
    });
    $("#setCoords").click(function () {
        var finish = $("#inputFinish").val();
        $("#id_cityfinish").val(finish);

        $('#finish').html(
            '<span>'+finish+'</span>'
        );
    });
    $("#setCoords").click(function () {
        var auto = $("#regnumber").val() + " " + $("#regnumber").text();
        $('#auto').html(
            '<div>'+auto+'</div>'
        );
    });

//промежуточные пункты и допинформация
    $("#info").click(function () {
        var waypoints = $("#waypoints").val();
        $("#id_waypoints").val(waypoints);
    });
    $("#info").click(function () {
        var dopinfo = $("#dopinfo").val();
        $("#id_dopinfo").val(dopinfo);
    });


// дата отправления и прибытия
    $("#datetime").click(function () {
        var datestart = $("#dateDep").val();
        $('#dtstart').html(
            '<div>'+datestart+'</div>'
        );
    });

    $("#datetime").click(function () {
        var datefinish = $("#dateArrival").val();
        $('#dtfinish').html(
            '<div>'+datefinish+'</div>'
        );
    });
// цена места
    $("#cost").click(function () {
        var cost = $("#price").val();
        $("#id_price").val(cost);
        $('#prc').html(
            '<div>'+cost+' грн.</div>'
        );
    });
    //$("#cost").click(function () {
    //    var seats = $("#seats").val();
    //    $("#id_seats").val(seats);
    //
    //});

}