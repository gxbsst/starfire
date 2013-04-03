$(document).ready(
function()
{
	$("#products_tips dt").toggle(function(){
		$(this).parent().addClass("current");
	},function(){
		$(this).parent().removeClass("current");
	});
}
);