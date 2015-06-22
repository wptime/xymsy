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