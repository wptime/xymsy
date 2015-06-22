$(document).ready(function(){
		var over=null;
		$(".price-t").mouseenter(function(){
            if($(".price-paixu").css("display") == "none"){
                over = window.setTimeout(function(){
                    $(".price-paixu").show();
                },300);
            }
        }).mouseleave(function(){
        	if($(".price-paixu").css("display") == "block"){
	        	$(".price-paixu").mouseenter(function(){
					$(this).show();
				}).mouseleave(function(){
	                $(this).hide();
				});
			}
            clearTimeout(over);
            $(".price-paixu").hide();
        });

       

        $(".left33-a1").click(function(){
            if ($(".left33-a1").css('display')!='none') {
                $(".left33-a1").css("display","none");
                $(".left33-a2").css("display","block");
                $(".left33-a3").css("display","block");
                $(".paixu1").css("display","none");
                $(".paixu2").css("display","none");
                $(".paixu").css("display","block");
            }
            else {
                $(".left33-a1").css("display","none");
                $(".left33-a2").css("display","block");
                $(".left33-a3").css("display","block");
                $(".paixu1").css("display","none");
                $(".paixu2").css("display","none");
                $(".paixu").css("display","block");
            }
        });

       $(".left33-a2").click(function(){
            if ($(".left33-a2").css('display')!='none') {
                $(".left33-a2").css("display","none");
                $(".left33-a1").css("display","block");
                $(".left33-a3").css("display","block");
                $(".paixu").css("display","none");
                $(".paixu2").css("display","none");
                $(".paixu1").css("display","block");
            }
            else {
                $(".left33-a2").css("display","none");
                $(".left33-a1").css("display","block");
                $(".left33-a3").css("display","block");
                $(".paixu").css("display","none");
                $(".paixu2").css("display","none");
                $(".paixu1").css("display","block");
            }
        });

       
       $(".left33-a3").click(function(){
            if ($(".left33-a3").css('display')!='none') {
                $(".left33-a3").css("display","none");
                $(".left33-a1").css("display","block");
                $(".left33-a2").css("display","block");
                $(".paixu").css("display","none");
                $(".paixu1").css("display","none");
                $(".paixu2").css("display","block");
            }
            else {
                $(".left33-a3").css("display","none");
                $(".left33-a1").css("display","block");
                $(".left33-a2").css("display","block");
                $(".paixu").css("display","none");
                $(".paixu1").css("display","none");
                $(".paixu2").css("display","block");
            }
        });
        var over=null;
        $(".fa").mouseenter(function(){
            if($(".place").css("display") == "none"){
                over = window.setTimeout(function(){
                    $(".place").show();
                },300);
            }
        }).mouseleave(function(){
            if($(".place").css("display") == "block"){
                $(".place").mouseenter(function(){
                    $(this).show();
                }).mouseleave(function(){
                    $(this).hide();
                });
            }
            clearTimeout(over);
            $(".place").hide();
        });

        var over=null;
        $(".left34").mouseenter(function(){
            if($(".float34").css("display") == "none"){
                over = window.setTimeout(function(){
                    $(".float34").show();
                },300);
            }
        }).mouseleave(function(){
            if($(".float34").css("display") == "block"){
                $(".float34").mouseenter(function(){
                    $(this).show();
                }).mouseleave(function(){
                    $(this).hide();
                });
            }
            clearTimeout(over);
            $(".float34").hide();
        });


        /*“确定”按钮滑动*/
        $("#go2").focus(function(){
            $("#go3").animate({left:"72px"});
            $(this).css("border","1px solid #1cabb4");
        });
        //当鼠标点击其他地方时，变回原样
        $(document).bind("click",function(e){
                var target = $(e.target);
                if(target.closest("#go2").length == 0){
                    $("#go3").animate({left:"27px"});
                    $("#go2").css("border","1px solid #ebebeb");
                }
            });

        /*收起分类（“共123456个宝贝”处按钮）*/
        $(".vv").click(function(){
            if ($("#sper1").css('display')!='none') {
                $("#sper1").css("display","none");
                $(".left2").css("height","137px");
                $("#want").css("margin-top","0px");
                $("#sper").css("border-bottom","none");
                $(".vv").css("background-image","url(images/index-icon.png)");
                $(".vv").css("background-position","-50px -230px");
            }
            else {
                $("#sper1").css("display","block");
                $(".left2").css("height","330px");
                $("#want").css("margin-top","17px");
                $("#sper").css("border-bottom","1px solid #ece8e8");
                $(".vv").css("background-image","url(images/index-icon.png)");
                $(".vv").css("background-position","-34px -230px");
            }
        });

        /*价格区间搜索*/
        $(".topleft32 input").focus(function(){
            $("#pricediv")[0].className = "pricediv-click";
            $("#yes33").css("display","block");
        });
        //当鼠标点击其他地方时，变回原样
        $(document).bind("click",function(e){
                var target = $(e.target);
                if(target.closest("#pricediv").length == 0){
                    $("#pricediv")[0].className = "pricediv";
                    $("#yes33").css("display","none");
                }
            });
});