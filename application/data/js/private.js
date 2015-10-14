$(function() {
    $(".btn-pref .btn").click(function () {
        $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
        $(this).removeClass("btn-default").addClass("btn-primary");
    });

    $('#changeData').click(function(){
        $('#saveData').removeAttr("disabled");
        $('input').each(function(){
            $(this).removeAttr("disabled");
            //$(this).attr("disabled") = false;
        });

    });
});

$('#myModal').on('shown.bs.modal', function () {
    $('#myInput').focus()
});


