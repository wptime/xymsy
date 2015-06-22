$(function(){
			var $mClose = $("#close"); 
			var $before,$lin;
			var $myAlert = $("#alert"); 
	$(".act").click(function(){/*
			var reg = document.$("content").$("a")[0]; */
			$before=$(this).parent().parent();
			$myAlert.find("input").eq(0).attr("value",$before.children('td').eq(2).children().text());
			$myAlert.find("input").eq(1).attr("value",$before.children('td').eq(3).text());

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
			$myAlert.find("input").eq(1).attr("value","");

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

/*$(function(){
				var $before,$bf,$before1,$before2;
		$(".act").click(
			function(){
				if($(this).attr("title")=="编辑"){
					$before=$(this).parent().parent();
					$(this).css("background","url('../images/diu_save.png') no-repeat");
					$(this).attr("title","保存");
					$(this).next().fadeIn("slow");
					$before1 = $before.children('td').eq(2).children().text();
					$before.children('td').eq(2).html("<input type='text' id='t1' size='6' value="+$before1+">");
					$before2 = $before.children('td').eq(3).text();
					$before.children('td').eq(3).html("<input type='text' size='8' value="+$before2+">");
					return false;
				}
				else{
					$before=$(this).parent().parent();
					$(this).css("background","url('../images/pencil.png') no-repeat");
					$(this).attr("title","编辑");
					$(this).next().hide();
					$bf = $before.children('td').eq(2).children().attr("value");
					$before.children('td').eq(2).html("<a href='#' title='点击进入用户个人中心'>"+$bf+"</a>");
					$bf = $before.children('td').eq(3).children().attr("value");
					$before.children('td').eq(3).html($bf);
				}
			});
		$(".over").click(function(){

					$before=$(this).parent().parent();
					$(this).prev().css("background","url('../images/pencil.png') no-repeat");
					$(this).prev().attr("title","编辑");
					$(this).hide();
					$before.children('td').eq(2).html("<a href='#' title='点击进入用户个人中心'>"+$before1+"</a>");
					$before.children('td').eq(3).html($before2);
					return false;
		})
	})*/