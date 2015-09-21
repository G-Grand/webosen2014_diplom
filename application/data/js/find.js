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
            }
        });

    });
});

