$(function() {
    initRate($('.rate'));
});
function rateController(url, itemId, itemRate){
    itemId = itemId.substr(5);
    $.post(url, {id: itemId, rate: itemRate}, function(data){
        var obj = $('#item_' + itemId);
        obj.attr('data-score', data.new_rate);
        $('#itemrate_' + itemId).html(data.real_rate);
        initRate(obj);
    }, "json");
}

function initRate(block){
    block.raty({
        starType : 'i',
        score: function() {
            return $(this).attr('data-score');
        }
        //click: function (score) {
        //    rateController($(this).attr('data-ref'), this.id, score);
        //}
    });
}
