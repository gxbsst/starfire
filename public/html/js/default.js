$(document).ready(
function()
{
  $("#searchmenu li").mouseover(
  function()
  {
    $("#searchmenu li").removeClass("current");
    $(this).addClass("current");
    $("#searchcontent .body").hide();
    $("#searchcontent .body0" + $(this).attr("tabindex")).show();
  }
  );
  $("#bannercontent").hover(
  function(){clearTimeout(time);},
  function(){time = setInterval(function(){$("#nextbtn").click();},8000);}
  );
  $("#prevbtn").click(
  function()
  {
    if(Number($("#bannerlist ul").css("left").replace("px","")) < - 2 * totalwidth)
    {
      $("#bannerlist ul").css("left",Number($("#bannerlist ul").css("left").replace("px","")) + totalwidth);
    }
    $("#bannerlist ul").animate({left:'-=960px'}, 2000);
  }
  );
  $("#nextbtn").click(
  function()
  {
    if(Number($("#bannerlist ul").css("left").replace("px","")) > - totalwidth)
    {
      $("#bannerlist ul").css("left",Number($("#bannerlist ul").css("left").replace("px","")) - totalwidth);
    }
    $("#bannerlist ul").animate({left:'+=960px'}, 2000);
  }
  );
 time = setInterval(function(){$("#nextbtn").click();},8000);
 var totalwidth = Number($("#bannerlist ul li").length) * 960;
 $("#bannerlist ul").html($("#bannerlist ul").html() + $("#bannerlist ul").html() + $("#bannerlist ul").html());
 $("#bannerlist ul").css("width",totalwidth*3);
 $("#bannerlist ul").css("left","-" + totalwidth + "px");
}
);
var time;
var current = $("#bannermenus li:first");
function scrollimg()
{
  current = $(current).next();
  if($(current).length <= 0)
  current = $("#bannermenus li:first");
  $(current).mouseover();
}
function show_flash(url)
{
 $("#flashcontents").show();
 document.getElementById("falsh_iframe").src = url;
}
function close_flash()
{
  $("#flashcontents").hide();
  document.getElementById("falsh_iframe").src = "#";
}
var imageheight = 505;
var imagewidth = 960;
document.write("<style>* html{background-image: url(image.jpg);}#flashcontents,.flashcontents{position:fixed;_position:absolute;top:" + (document.documentElement.clientHeight - imageheight) / 2 + "px;_top:expression(" + (document.documentElement.clientHeight - imageheight) / 2 + "+((e=document.documentElement.scrollTop)?e:document.body.scrollTop)+'px');_top:expression(" + (document.documentElement.clientHeight - imageheight) / 2 + "+((e=document.documentElement.scrollTop)?e:document.body.scrollTop)+'px');left:" + (document.documentElement.clientWidth - imagewidth) / 2 + "px; _left:expression(" + (document.documentElement.clientWidth - imagewidth) / 2 + "+((e=document.documentElement.scrollLeft)?e:document.body.scrollLeft)+'px');_left:expression(" + (document.documentElement.clientWidth - imagewidth) / 2 + "+((e=document.documentElement.scrollLeft)?e:document.body.scrollLeft)+'px');}</style>");
