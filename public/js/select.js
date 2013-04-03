$(document).ready(
function()
{
  $(".selectcontent").mouseover(
  function()
  {
    $(this).addClass("selectcontent_current");
  }
  );
  $(".selectcontent").mouseout(
  function()
  {
    $(this).removeClass("selectcontent_current");
  }
  );
  $(".selectcontent .none li").click(
  function()
  {
    $(this).parent().parent().parent().parent().find(".text").html($(this).html());
    $(this).parent().parent().parent().parent().removeClass("selectcontent_current");
  }
  );
}
);
var current_select;
var isover;