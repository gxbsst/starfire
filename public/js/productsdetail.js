$(document).ready(
function()
{
  $("#productdetailmenu li").mouseover(
  function()
  {
    $("#productdetailmenu li").removeClass("current");
    $(this).addClass("current");
    $("#product_detail01").hide();
    $("#product_detail02").hide();
    $("#product_detail03").hide();
    $("#product_detail04").hide();
    $("#product_detail05").hide();
    $("#product_detail06").hide();
    $("#product_detail0" + $(this).attr("tabindex")).show();
  }
  );
}
);
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
var imagewidth = 880;
document.write("<style>* html{background-image: url(image.jpg);}#flashcontents,.flashcontents{position:fixed;_position:absolute;top:" + (document.documentElement.clientHeight - imageheight) / 2 + "px;_top:expression(" + (document.documentElement.clientHeight - imageheight) / 2 + "+((e=document.documentElement.scrollTop)?e:document.body.scrollTop)+'px');_top:expression(" + (document.documentElement.clientHeight - imageheight) / 2 + "+((e=document.documentElement.scrollTop)?e:document.body.scrollTop)+'px');left:" + (document.documentElement.clientWidth - imagewidth) / 2 + "px; _left:expression(" + (document.documentElement.clientWidth - imagewidth) / 2 + "+((e=document.documentElement.scrollLeft)?e:document.body.scrollLeft)+'px');_left:expression(" + (document.documentElement.clientWidth - imagewidth) / 2 + "+((e=document.documentElement.scrollLeft)?e:document.body.scrollLeft)+'px');}</style>");