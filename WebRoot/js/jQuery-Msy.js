;//更稳妥 避免别人的代码给插件带来影响
(function($){
	$.fn.tyAll = function(name,options){
		var options = $.extend(defaults,options);
		var me = this;//插件内部this指的是当前通过选择器获取的jquery对象
		var scrolls=$(window).scroll(function (options){
            var targetscroll = $(window).scrollTop();//拿到滚动条滚动的距离
            if(targetscroll > 0){
                $(".back").show();  
            }else{
                $(".back").hide();  
            }
            if(targetscroll > $(".sell-pic").height()+ $("#hd").height()+ $(".warpper1").height()+$(".tytop").height()-100){
                $(".back-class").show();  
            }else{
                $(".back-class").hide();  
            }
        });
	    var addstyle = function(options){
	    	me.addClass(options.classname);
	    };
	    var removestyle=function(options){
	    	me.removeClass(options.classname);
	    };
	    var tabTrans=function(options){
	    	if(me.hasClass(options.liclass)){
				return ;
			}else{
				me.addClass(options.liclass).siblings().removeClass(options.liclass);
				$("."+options.divclass).show().siblings("div").hide();
			}
	    };
	    var textFill=function(options){
		$("."+options.sinput).val("搜“新品连衣裙”试试，潮流新品逛个爽");
			var orginavalue=$("."+options.sinput).val();
			$("."+options.sinput).focus(function(){
				if($.trim($("."+options.sinput).val())==orginavalue){
					$("."+options.sinput).val("").css("color","#666");
				}
			}).blur(function(){
				if($.trim($("."+options.sinput).val())==""){
					$("."+options.sinput).val(orginavalue).css("color","#BEBEBE");
				}
			});
		};
	    var defaults = {
	    	scrolls:scrolls,
            addstyle:addstyle,
            removestyle:removestyle,
            tabTrans:tabTrans,
            textFill:textFill
		};
		defaults[name](options);
	};
})(jQuery);
	
// (function($){
// 	$.fn.tyAll=function(){
// 		$.tyscroll={
// 			body : $("body"),
// 			scrollTo : function(that,speed){
// 				var targetOffset=that.offset().top;//html中that=$(this);
// 				this.body.stop().animate({scrollTop:-targetOffset},options.speed);
// 				return this;
// 		    }
// 		};
// 	};
// })(jQuery);
// $(document).ready(function(){
// 	$.fn.tyAll();
// 	$(".back").click(function(e){
// 		var that=$(this);
// 		$.tyscroll.scrollTo(that,500);
// 		return false;
// 	});
// });
/*

*/
//导航栏
$(".index").mouseenter(function(){
	$(this).addClass("index-back")
	.children("div").show()
	.parent().siblings().removeClass("index-back")
	.children("div").hide();
 }).mouseleave(function(){
 	$(this).children("div").hide();
	$(this).removeClass("index-back");
 });

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
