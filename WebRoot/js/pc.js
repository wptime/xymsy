$(document).ready(function(){
		$("#attention").click(function(){
			if($("#attention ul").css('display')!="none"){
				$("#attention ul").css("display","none");
				$("#attention b").css("background-position-x","-36px");
			}else{
				$("#attention ul").css("display","block");
				$("#attention b").css("background-position-x","-8px");
			}
		});
		$("#service").click(function(){
			if($("#service ul").css('display')!="none"){
				$("#service ul").css("display","none");
				$("#service b").css("background-position-x","-36px");
			}else{
				$("#service ul").css("display","block");
				$("#service b").css("background-position-x","-8px");
			}
		});
		$("#property").click(function(){
			if($("#property ul").css('display')!="none"){
				$("#property ul").css("display","none");
				$("#property b").css("background-position-x","-36px");
			}else{
				$("#property ul").css("display","block");
				$("#property b").css("background-position-x","-8px");
			}
		});
});