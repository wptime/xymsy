$(document).ready(function(){
	
			


    //首页搜索栏
    $(".search-push").click(function(event){
            if($(".search-in").val() == "搜“新品连衣裙”试试，潮流新品逛个爽"){
                event.preventDefault();
            }else{
                return;
            }
        });
        $.fn.tyAll("textFill",{sinput:"search-in"});

		/*收藏夹*/
		$(".index-collect").mouseenter(function(){
			$(".self-base").show();
			$(this).tyAll("addstyle",{classname:"index-back"});
		}).mouseleave(function(){
			$(".self-base").hide();
			$(this).tyAll("removestyle",{classname:"index-back"});
		});
		/*卖家中心*/
		$(".index-sell").mouseenter(function(){
			$(".self-sell").show();
			$(this).tyAll("addstyle",{classname:"index-back"});
		}).mouseleave(function(){
			$(".self-sell").hide();
			$(this).tyAll("removestyle",{classname:"index-back"});
		});
		/*个人中心*/
		$(".index-own").mouseenter(function(){
			$(".self-own").show();
			$(this).tyAll("addstyle",{classname:"index-back"});
		}).mouseleave(function(){
			$(".self-own").hide();
			$(this).tyAll("removestyle",{classname:"index-back"});
		});
		/*购物车*/
		$(".index-car").mouseenter(function(){
			$(".self-car").show();
			$(this).tyAll("addstyle",{classname:"index-back"});
		}).mouseleave(function(){
			$(".self-car").hide();
			$(this).tyAll("removestyle",{classname:"index-back"});
		});
		/*网站导航*/
		$(".index-tour").mouseenter(function(){
			$(".self-tour").show();
			$(this).tyAll("addstyle",{classname:"index-back"});
		}).mouseleave(function(){
			$(".self-tour").hide();
			$(this).tyAll("removestyle",{classname:"index-back"});
		});
		


		/*点击收藏*/
		$(".collect").click(function(){
			if($(this).children("i")[0].className=="icon-col")$(this).children("i")[0].className = "icon-col2";
			else $(this).children("i")[0].className = "icon-col";
		});

		//返回顶部
		$('.back').click(function (e){
            $('html,body').animate({ scrollTop: '0px' }, 800);
            e.preventDefault();
    	});

    	//店铺信息
        $(".shop").mouseenter(function(){
			$(".shop-messages").show();
			$(this).tyAll("addstyle",{classname:"index-back"});
		}).mouseleave(function(){
			$(".shop-messages").hide();
			$(this).tyAll("removestyle",{classname:"index-back"});
		});
	});

