var startCoords,finishCoords;
var positionStart = [];
var revposStart = [];

var myMap;
console.log(init)
function init() {
    myMap = new ymaps.Map('map', {
        center: revposStart,
        zoom: 7,
        type: 'yandex#map',
        controls: []
    });

}
ymaps.ready(init);

$('document').ready(function (){
    var findCoorsds = {};

    $("#inputStart").on("keypress", function(){
        var start = this;
        clearTimeout(findCoorsds["startPoint"]);
        findCoorsds["startPoint"] = setTimeout(function(){
            // console.log(start);
            var url = "https://geocode-maps.yandex.ru/1.x/?format=json&geocode="+start.value;
            $.ajax({
                url: url,
                type: "GET",
                dataType: "json",
                success: function (resp) {
                    console.log(resp);
                    var datalist = document.getElementById("start_list");
                    var geoList = resp.response.GeoObjectCollection.featureMember;
                    var list = "";
                    for(var i=0; i<geoList.length; ++i) {
                        var obj = geoList[i].GeoObject;
                        var value = obj.Point.pos;
                        var text = obj.metaDataProperty.GeocoderMetaData.text;
                        try {
                            if(obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.Locality.LocalityName == "Киев"){
                                var localNameStart = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.Locality.LocalityName; //название города
                                var nameStreetStart = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.Locality.Thoroughfare.ThoroughfareName; //название улицы
                                var numberHouseStart = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.Locality.Thoroughfare.Premise.PremiseNumber; //номер дома
                            } else {
                                var localNameStart = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.LocalityName; //название города
                                var nameStreetStart = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.Thoroughfare.ThoroughfareName; //название улицы
                                var numberHouseStart = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.Thoroughfare.Premise.PremiseNumber; //номер дома
                            }
                        } catch (err) {
                        }
                        // console.log(obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea);


                        list += "<option value='"+value+"'>"+text+"</option>";
                    }
                    positionStart = value.split(" ");
                    revposStart = positionStart.reverse();
                    /*positionStart[0] = parseFloat(positionStart[0]);
                     positionStart[1] = parseFloat(positionStart[1]);*/

                    datalist.innerHTML = list;
                    datalist.style.display = "block";
                    $(datalist).find("option").each(function() {
                        $(this).on("click", function() {
                            start.value = $(this).text();
                            startCoords = $(this).text();
                            datalist.style.display = "none";
                        });
                    });
                }
            })
        }, 500);

    });

    $("#inputFinish").on("keypress", function(){
        var start = this;
        clearTimeout(findCoorsds["finishPoint"]);
        findCoorsds["finishPoint"] = setTimeout(function(){
            console.log(start);
            var url = "https://geocode-maps.yandex.ru/1.x/?format=json&geocode="+start.value;
            $.ajax({
                url: url,
                type: "GET",
                dataType: "json",
                success: function (resp) {
                    console.log(resp);
                    var datalist = document.getElementById("finish_list");
                    var geoList = resp.response.GeoObjectCollection.featureMember;
                    /*console.log(resp.response);
                     console.log(resp.response.GeoObjectCollection);
                     console.log(resp.response.GeoObjectCollection.featureMember);
                     console.log(geoList);*/
                    var list = "";
                    for(var i=0; i<geoList.length; ++i) {
                        var obj = geoList[i].GeoObject;
                        var value = obj.Point.pos;
                        var text = obj.metaDataProperty.GeocoderMetaData.text;
                        try {
                            if(obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.Locality.LocalityName == "Киев"){
                                var localNameFinish = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.Locality.LocalityName; //название города
                                var nameStreetFinish = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.Locality.Thoroughfare.ThoroughfareName; //название улицы
                                var numberHouseFinish = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.Locality.Thoroughfare.Premise.PremiseNumber; //номер дома
                            } else {
                                var localNameFinish = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.LocalityName; //название города
                                var nameStreetFinish = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.Thoroughfare.ThoroughfareName; //название улицы
                                var numberHouseFinish = obj.metaDataProperty.GeocoderMetaData.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.Thoroughfare.Premise.PremiseNumber; //номер дома
                            }
                        } catch (err) {
                        }
                        list += "<option value='"+value+"'>"+text+"</option>";
                    }
                    datalist.innerHTML = list;
                    datalist.style.display = "block";
                    $(datalist).find("option").each(function() {
                        $(this).on("click", function() {
                            start.value = $(this).text();
                            finishCoords = $(this).text();
                            datalist.style.display = "none";
                        });
                    });
                }
            })
        }, 500);
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
            startCoords,finishCoords
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

//календарь с числом
$('document').ready(function (){
    // Date-field
    $('.datetimepicker').each(function() {
        $(this).datetimepicker({
            language: 'ru'
        });
    });
});