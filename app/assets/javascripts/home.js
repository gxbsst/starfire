// KV SLIDE SHOW
function showAuto() {
    n = n >= (count - 1) ? 0 : ++n;
    $("#banner li.nob").eq(n).trigger('click');
}
var t = n = 0, count;
count = $("#banner_list a").length;

$("#banner_list a:not(:first-child)").hide();
$("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));

$("#banner_info").click(function() {
    window.open($("#banner_list a:first-child").attr('href'), "_blank")
});

$("#banner li.nob").click(function() {
    var i = $(this).text() - 1; //获取Li元素内的值，即1，2，3，4
    n = i;
    if (i >= count) return;
    $("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
    $("#banner_info").unbind().click(function() {
        window.open($("#banner_list a").eq(i).attr('href'), "_blank")
    });
    $("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
    $(this).css({
        "background": "#fff",
        'color': '#000'
    }).siblings().css({
            "background": "#000",
            'color': '#fff'
        });
});

t = setInterval("showAuto()", 8000);

$("#banner").hover(function() {
    clearInterval(t)
}, function() {
    t = setInterval("showAuto()", 8000);
});
// KV SLIDE SHOW END





$(document).ready(function(){

    $("form .scb_btn > .searchbtn").click(function(){
        $(this).closest('form').submit();
    });
});

