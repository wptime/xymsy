//$(document).ready(function(){
/*
 $("#icon1").mouseover(function(){ 
 $("#img-icon").css("background-image","url(images/goods1.png)"); 
 $("#img-icon").css("background-repeat","no-repeat");  
 });

 $("#icon2").mouseover(function(){ 
 $("#img-icon").css("background-image","url(images/goods2.png)"); 
 $("#img-icon").css("background-repeat","no-repeat");  
 });

 $("#icon3").mouseover(function(){ 
 $("#img-icon").css("background-image","url(images/goods3.png)"); 
 $("#img-icon").css("background-repeat","no-repeat");  
 });

 $("#icon4").mouseover(function(){ 
 $("#img-icon").css("background-image","url(images/goods4.png)"); 
 $("#img-icon").css("background-repeat","no-repeat");  
 });

 $("#icon5").mouseover(function(){ 
 $("#img-icon").css("background-image","url(images/goods5.png)"); 
 $("#img-icon").css("background-repeat","no-repeat");  
 });

 });*/
/*$(document).ready(function(){
 var imgDivs = $("#img-icon");
 $("#icon").mouseenter(function(){ 
 //处理鼠标进入的时候
 }
 }); 
 });*/

var first = $(".icon:first").attr("src");
$("#img-icon").attr("src",first);
$(".icon").mouseenter(function() {
	var img = $(this).attr("src");
	$("#img-icon").attr("src", img);
});
function qtyUpdate(kind) {
	var f = document.from1;
	var c = f.qty.value;
	if (kind == "up") {
		c++;
	} else if (kind == "down") {
		if (c > 1)
			c--;
	}
	f.qty.value = c;
}
$(document).ready(function() {
	$('.back').click(function(e) {
		$('html,body').animate({
			scrollTop : '0px'
		}, 800);
		e.preventDefault();
	})
});