$(document).ready(function(){
  $("#banner_list a:not(:first-child)").hide();
  var t = n = 0, count;
  count = $("#banner_list a").length;
  $("#banner li.nob").live('click',function() {
    var i = $(this).text() - 1; //获取Li元素内的值，即1，2，3，4
    var n = i;
    if (i >= count) return;
    var self = this;
    $(this).addClass('active');
    $(this).siblings().removeClass('active');
    $("#banner_list a").filter(":visible").fadeOut(500);
    $('#banner_list').children().eq(i).fadeIn(1000);
  });

  function showAuto() {
    n = n >= (count - 1) ? 0 : ++n;
    $("#banner li.nob").eq(n).trigger('click');
  }

  t = setInterval(showAuto, 8000);

  $("#banner").hover(function() {
    clearInterval(t)
  }, function() {
    t = setInterval(showAuto, 8000);
  });
  // slide show end 

  $("form .scb_btn > .searchbtn").click(function(){
    $(this).closest('form').submit();
  });

});
