$(function() {

    $('#switchPlaces').click(function() {
        var departurePoint = $("input[name='departure_point']");
        var destinationPoint = $("input[name='destination_point']");
        var depVal = departurePoint.val();
        var desVal = destinationPoint.val();
        departurePoint.val(desVal);
        destinationPoint.val(depVal);
    });

    $('#find').click(function() {
        var form = $("#get_rt_form");
        var formValid = true;
        form.find("input").each(function() {
            var formGroup = $(this).parents('.form-group');
            if(this.value == "") {
                formGroup.addClass('has-error').removeClass('has-success');
                formValid = false;
            }else {
                formGroup.addClass('has-success').removeClass('has-error');
            }
        });

        if(!formValid) { return false; }

        var msg = form.serialize();

        $.ajax({
            type: "POST",
            url: "/road/find",
            data: msg,
            dataType: "json",
            success: function(result) {
                console.log(result);
                setRoadCountBlock(result);
                drawRoadsBlock(result);
                roads = result;
            }
        });

    });

    $("#roadsSorting").on("change", function() {
        switch(this.value) {
            case "price": roads = sortRoadsByPrice(roads); break;
            default:      roads = sortRoadsByDate(roads);
        }
        drawRoadsBlock(roads);
    });

    $("#datetimepicker_mask").on("change", function(){
        var date = new Date(this.value);
        var minDate = date.setHours(date.getHours()-3);
        var maxDate = date.setHours(date.getHours()+3);
        var r = [];
        for(var i=0; i<roads.length; ++i) {
            var dateR = new Date(roads[i].startdate);
            if(dateR >= minDate && dateR <= maxDate) {
                r.push(roads[i]);
            }
        }
        drawRoadsBlock(r);
    });


});

var roads = [];

function sortRoadsByPrice(roads) {
    return roads.sort(function(a,b){
        return (parseFloat(a.price) - parseFloat(b.price));
    });
}
function sortRoadsByDate(roads) {
    return roads.sort(function(a,b){
        var dateA = new Date(a.startdate);
        var dateB = new Date(b.startdate);
        if(dateA > dateB)  { return 1; }
        if(dateA < dateB)  { return -1; }
        if(dateA == dateB) { return 0; }
    });
}


function setRoadCountBlock(roads) {
    $("#countRoadsBlock").show();
    $("#countRoads").text("Найдено "+roads.length+" маршрута:");
    var departurePoint = $("input[name='departure_point']");
    var destinationPoint = $("input[name='destination_point']");
    $("#roadsPoints").text(departurePoint.val()+" - "+destinationPoint.val());
}

function drawRoadsBlock(roads) {
    var roadsBlock = $("#roadsBlock");
    var source   = $("#roadBlockTemplate").html();
    var template = Handlebars.compile(source);
    roadsBlock.html("");
    if(roads.length == 0) {
        roadsBlock.html("<h3>Не нашлось активных маршрутов!!!</h3>");
        roadsBlock.show();
        return;
    }
    roads.forEach(function(item, i, arr){
        roadsBlock.append(template(item));
    });
    roadsBlock.show();
    $("#roadsFilter").show();
    initRate($('.rate'));
}