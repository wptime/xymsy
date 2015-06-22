$(document).ready(function(){
	$(".trader").click(function(){
		var t=$(this).next();
		if(t.css("display")!="none"){
			t.css("display","none");
			$(this).children().css("background-position-x","-36px");
		}else{
			t.css("display","block");
			$(this).children().css("background-position-x","-8px");
		}
	});
	$(".button").click(function(){
				$(this).parent().parent().css("display","none")
				.next().css("display","block");
				$(".warpper-right").css("display","block");
			});
	$(".success").click(function(){
		$(this).parent().parent().css("display","none");
		$(".shop").css("display","block");
		$(".warpper-right").css("display","block");
	});
	$(".reapply").click(function(){
		$(".apply").css("display","block");
		$(".register").css("display","none");
		$(".warpper-right").css("display","none");
		$(".shop").css("display","none");
	});
	$(".reregister").click(function(){
		$(".register").css("display","block");
		$(".shop").css("display","none");
		$(".warpper-right").css("display","block");
	})
});

$(document).ready(function(){
		/*设置*/
		$(".setup").mouseenter(function(){
			$(".set").show();
			$(this).tyAll("addstyle",{});
		}).mouseleave(function(){
			$(".set").hide();
			$(this).tyAll("removestyle",{});
		});
		
	});

