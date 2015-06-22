$(document).ready(function() {
        //首页图片轮换
        $(".banner").unslider({
            fluid: true,  //响应式
            speed: 1000,   //速度         
            delay: 2500,  //延迟
            dots: true    //点
        });

    //首页全部商品分类
$("#top li a,.show-content a").mouseover(function(){
            $(this).tyAll("addstyle",{classname:"ahover"});
        }).mouseout(function(){
            $(this).tyAll("removestyle",{classname:"ahover"});
        });
    
    var over=null;
        $(".show1").mouseenter(function(){
            if($(".thing1").css("display") == "none"){
                over = window.setTimeout(function(){
                    $(".thing1").show();},300);}
        }).mouseleave(function(){
            if($(".thing1").css("display") == "block"){
                $(".thing1").mouseenter(function(){
                    $(this).show();
                }).mouseleave(function(){
                    $(this).hide();
                });
            }
            clearTimeout(over);
            $(".thing1").hide();
        });

        var over=null;
        $(".show2").mouseenter(function(){
            if($(".thing2").css("display") == "none"){
                over = window.setTimeout(function(){
                    $(".thing2").show();
                },300);
            }
        }).mouseleave(function(){
            if($(".thing2").css("display") == "block"){
                $(".thing2").mouseenter(function(){
                    $(this).show();
                }).mouseleave(function(){
                    $(this).hide();
                });
            }
            clearTimeout(over);
            $(".thing2").hide();
        });

 var over=null;
        $(".show3").mouseenter(function(){
            if($(".thing3").css("display") == "none"){
                over = window.setTimeout(function(){
                    $(".thing3").show();
                },300);
            }
        }).mouseleave(function(){
            if($(".thing3").css("display") == "block"){
                $(".thing3").mouseenter(function(){
                    $(this).show();
                }).mouseleave(function(){
                    $(this).hide();
                });
            }
            clearTimeout(over);
            $(".thing3").hide();
        });

 var over=null;
        $(".show4").mouseenter(function(){
            if($(".thing4").css("display") == "none"){
                over = window.setTimeout(function(){
                    $(".thing4").show();
                },300);
            }
        }).mouseleave(function(){
            if($(".thing4").css("display") == "block"){
                $(".thing4").mouseenter(function(){
                    $(this).show();
                }).mouseleave(function(){
                    $(this).hide();
                });
            }
            clearTimeout(over);
            $(".thing4").hide();
        });

 var over=null;
        $(".show5").mouseenter(function(){
            if($(".thing5").css("display") == "none"){
                over = window.setTimeout(function(){
                    $(".thing5").show();
                },300);
            }
        }).mouseleave(function(){
            if($(".thing5").css("display") == "block"){
                $(".thing5").mouseenter(function(){
                    $(this).show();
                }).mouseleave(function(){
                    $(this).hide();
                });
            }
            clearTimeout(over);
            $(".thing5").hide();
        });

 var over=null;
        $(".show6").mouseenter(function(){
            if($(".thing6").css("display") == "none"){
                over = window.setTimeout(function(){
                    $(".thing6").show();
                },300);
            }
        }).mouseleave(function(){
            if($(".thing6").css("display") == "block"){
                $(".thing6").mouseenter(function(){
                    $(this).show();
                }).mouseleave(function(){
                    $(this).hide();
                });
            }
            clearTimeout(over);
            $(".thing6").hide();
        });

 var over=null;
        $(".show7").mouseenter(function(){
            if($(".thing7").css("display") == "none"){
                over = window.setTimeout(function(){
                    $(".thing7").show();
                },300);
            }
        }).mouseleave(function(){
            if($(".thing7").css("display") == "block"){
                $(".thing7").mouseenter(function(){
                    $(this).show();
                }).mouseleave(function(){
                    $(this).hide();
                });
            }
            clearTimeout(over);
            $(".thing7").hide();
        });

 var over=null;
        $(".show8").mouseenter(function(){
            if($(".thing8").css("display") == "none"){
                over = window.setTimeout(function(){
                    $(".thing8").show();
                },300);
            }
        }).mouseleave(function(){
            if($(".thing8").css("display") == "block"){
                $(".thing8").mouseenter(function(){
                    $(this).show();
                }).mouseleave(function(){
                    $(this).hide();
                });
            }
            clearTimeout(over);
            $(".thing8").hide();
        });

 var over=null;
        $(".show9").mouseenter(function(){
            if($(".thing9").css("display") == "none"){
                over = window.setTimeout(function(){
                    $(".thing9").show();
                },300);
            }
        }).mouseleave(function(){
            if($(".thing9").css("display") == "block"){
                $(".thing9").mouseenter(function(){
                    $(this).show();
                }).mouseleave(function(){
                    $(this).hide();
                });
            }
            clearTimeout(over);
            $(".thing9").hide();
        });

 var over=null;
        $(".show10").mouseenter(function(){
            if($(".thing10").css("display") == "none"){
                over = window.setTimeout(function(){
                    $(".thing10").show();
                },300);
            }
        }).mouseleave(function(){
            if($(".thing10").css("display") == "block"){
                $(".thing10").mouseenter(function(){
                    $(this).show();
                }).mouseleave(function(){
                    $(this).hide();
                });
            }
            clearTimeout(over);
            $(".thing10").hide();
        });
//首页，校园周边，跳蚕市场，失物招领
        $(".index-kind").mouseover(function(){
            $(this).tyAll("addstyle",{classname:"hover"});
        }).mouseout(function(){
            $(this).tyAll("removestyle",{classname:"hover"});
        });
        $(".popular-li").mouseover(function(){
            $(this).children("a").tyAll("addstyle",{classname:"index-selected"});
        }).mouseout(function(){
            $(this).children("a").tyAll("removestyle",{classname:"index-selected"});
        });
        
//首页公告，规则，内容
$(".newli").click(function(){
    $(this).tyAll("tabTrans",{
            liclass:"hoverli",
            divclass:"new-content"
        });
    });
$(".writeli").click(function(){
    $(this).tyAll("tabTrans",{
            liclass:"hoverli",
            divclass:"write-content"
    });
});
$(".ruleli").click(function(){
    $(this).tyAll("tabTrans",{
            liclass:"hoverli",
            divclass:"rule-content"
    });
});

        
    
});