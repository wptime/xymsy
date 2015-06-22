
	$(document).ready(function(){
		$("#saveConsigneeTitleDiv").click(function(){ 
	         $(".loading").css("display","block");  
	         });
		
		$(".time-imgs").mouseenter(function(){
				$(".sent-time3").show();
				$(this).tyAll("addstyle",{classname:"index-back"});
			}).mouseleave(function(){
				$(".sent-time3").hide();
				$(this).tyAll("removestyle",{classname:"index-back"});
			});

		$(".store-selector-in").mouseenter(function(){
				$(".intwo").show();
				$(this).tyAll("addstyle",{classname:"index-back"});
			}).mouseleave(function(){
				$(".intwo").hide();
				$(this).tyAll("removestyle",{classname:"index-back"});
			});

		$(".daytime").mouseenter(function(){
				$(".day-select").show();
				$(this).tyAll("addstyle",{classname:"index-back"});
			}).mouseleave(function(){
				$(".day-select").hide();
				$(this).tyAll("removestyle",{classname:"index-back"});
			});	

		$(".asks").mouseenter(function(){
				$(".ask-inside").show();
				$(this).tyAll("addstyle",{classname:"index-back"});
			}).mouseleave(function(){
				$(".ask-inside").hide();
				$(this).tyAll("removestyle",{classname:"index-back"});
			});

		$(".sent-input").click(function(){
				$(".sent-jd").show();
				$(".sell-inside").hide();
			});
		$(".sell-input").click(function(){
				$(".sell-inside").show();
				$(".sent-jd").hide();
			});
		$(".radio-1-1").click(function(){
				$(".item-selected").css("background","#fff4d3");
				$(".item-selected-1").css("background","#ffeaab");
			});
		$(".radio-2-2").click(function(){
				$(".item-selected").css("background","#fff4d3");
				$(".item-selected-2").css("background","#ffeaab");
			});
		$(".save-submit").click(function(){
				$(".payway-in").hide();
			});
	});	