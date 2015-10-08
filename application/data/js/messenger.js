/**
 * Webosen 2014
 * @link    https://github.com/G-Grand/webosen2014_diplom.git
 */
$(function(){
   showMessage();
});

function showMessage(){
    var requestUri = window.location.pathname.substr(1);
    $("#succeed_msg, #notes_msg, #error_msg").addClass("hidden").html("");
    $.ajax({
        type: "POST",
        url: "/index/getMessage",
        data: {requestUri:requestUri},
        dataType: "json",
        success: function(result) {
            console.log(result);
            if(result.succeed_msg != null){$("#succeed_msg").removeClass("hidden").html(result.succeed_msg);}
            if(result.notes_msg != null){$("#notes_msg").removeClass("hidden").html(result.notes_msg);}
            if(result.error_msg != null){$("#error_msg").removeClass("hidden").html(result.error_msg);}
        }
    });
}
