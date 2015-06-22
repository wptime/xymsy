$(function(){
			var $mClose = $("#close"); 
			var $before,$lin;
			var $myAlert = $("#alert"); 
	$(".act").click(function(){/*
			var reg = document.$("content").$("a")[0]; */
			$before=$(this).parent().parent();
			$myAlert.find("input").eq(0).attr("value",$before.children('td').eq(2).text());
			
			/*$myAlert.find("#line_permissions input").each(function(){
				if($(this).attr("name")==
			})*/
			var windowWidth = document.documentElement.clientWidth;
		    var windowHeight = document.documentElement.clientHeight;
		    var popupHeight = $("#alert").height();
		    var popupWidth = $("#alert").width();
		    var hidtop=$(document).scrollTop();
		    $myAlert.css({
		        "display": "block",
		        "position": "absolute",
		        "top": windowHeight/2-popupHeight/2+hidtop,
		        "left": windowWidth/2-popupWidth/2-115
		    });

			$mybg = $("<div></div>"); 
			$mybg.attr("id","$mybg"); 
			$mybg.css({
		        "background":"#000",
		        "width":"100%",
		        "height":document.body.scrollHeight,
		        "position":"absolute",
		        "top":"0",
		        "left":"0",
		        "zIndex":"500",
		        "opacity":"0.3",
		        "filter":"Alpha(opacity=30)"
		    });
			$("body").append($mybg);
			
			$("body").css("overflow","hidden"); 
			
			
			$mClose.click(function() { 	
				document.body.style.overflow = "inherit"; 
				$myAlert.css("display","none"); 
				$mybg.css("display","none"); 
		 })
	})
	$(".content-add").click(function(){/*
			var reg = document.$("content").$("a")[0]; */
			$(".tjxx").html("添加信息");
			$before=$(this).parent().parent();
			$myAlert.find("input").eq(0).attr("value","");
			
			/*$myAlert.find("#line_permissions input").each(function(){
				if($(this).attr("name")==
			})*/
			var windowWidth = document.documentElement.clientWidth;
		    var windowHeight = document.documentElement.clientHeight;
		    var popupHeight = $("#alert").height();
		    var popupWidth = $("#alert").width();
		    var hidtop=$(document).scrollTop();
		    $myAlert.css({
		        "display": "block",
		        "position": "absolute",
		        "top": windowHeight/2-popupHeight/2+hidtop,
		        "left": windowWidth/2-popupWidth/2-115
		    });

			$mybg = $("<div></div>"); 
			$mybg.attr("id","$mybg"); 
			$mybg.css({
		        "background":"#000",
		        "width":"100%",
		        "height":document.body.scrollHeight,
		        "position":"absolute",
		        "top":"0",
		        "left":"0",
		        "zIndex":"500",
		        "opacity":"0.3",
		        "filter":"Alpha(opacity=30)"
		    });
			$("body").append($mybg);
			
			$("body").css("overflow","hidden"); 
			
			
			$mClose.click(function() { 	
				document.body.style.overflow = "inherit"; 
				$myAlert.css("display","none"); 
				$mybg.css("display","none"); 
		 })
	})


function getSelectValue(){

	
	alert("1级="+$("#academy").val());
	 
	$(".major").each(function(i,o){
                   
		 if(i == currentShowMajor){
			alert("2级="+$(".major").eq(i).val());
		 }
		
   });

}


var dragging = false,tableshang1=0,tableshang2=0;
            var iX, iY;
            $("#alert input").mouseover(function(){
            	tableshang1=1;
            })
            $("#alert input").mouseout(function(){
            	tableshang1=0;
            })
            $("#alert select").mouseover(function(){
            	tableshang2=1;
            })
            $("#alert select").mouseout(function(){
            	tableshang2=0;
            })

            $("#al").mousedown(function(e) {

	                if(tableshang1==0&&tableshang2==0){
                dragging = true;
                iX = e.clientX - this.offsetLeft;
                iY = e.clientY - this.offsetTop;
                this.setCapture && this.setCapture();
                return false;}
            });
            document.onmousemove = function(e) {

	                if(tableshang1==0&&tableshang2==0){
                if (dragging) {
	                var e = e || window.event;
	                var oX = e.clientX - iX;
	                var oY = e.clientY - iY;
	                $("#al").css({"left":oX + "px", "top":oY + "px"});
	                return false;
                }}
            };
            $(document).mouseup(function(e) {

	                if(tableshang1==0&&tableshang2==0){
                dragging = false;
                $("#al")[0].releaseCapture();
                e.cancelBubble = true;}
            })

})

var currentShowMajor=0;

$(document).ready(function(){
   $("#academy").change(function(){
	   $("#academy option").each(function(i,o){
		   if($(this).attr("selected"))
		   {
		 
			   $(".major").hide();
			   $(".major").eq(i).show();
			   currentShowMajor=i;
		   }
	   });
   });
   $("#academy").change();
});