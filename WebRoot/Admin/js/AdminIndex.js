
$(document).ready(function(){
	
		//setMenuHeight
	$('.menu').height($(window).height());
	$('.sidebar').height($(window).height());
	$('.page').height($(window).height());
	
	//menu on and off
	$('.btn').click(function(){
		$('.menu').toggle();
		
		if($(".menu").is(":hidden")){
			$('.page iframe').width($(window).width());
			}else{
			$('.page iframe').width($(window).width());
				}
		});
		
	$('.subMenu a[href="#"]').click(function(){
		$(this).next('ul').toggle();
		return false;
		});
		$("#main-nav li ul").hide(); // Hide all sub menus
		$("#main-nav li a.current").parent().find("ul").slideToggle("slow"); // Slide down the current menu item's sub menu
		
		$("#main-nav li a.nav-top-item").click( // When a top menu item is clicked...
			function () {
				$(this).parent().siblings().find("ul").slideUp("normal"); // Slide up all sub menus except the one clicked
				$(this).next().slideToggle("normal"); // Slide down the clicked sub menu
				return false;
			}
		);
		$("#main-nav li li a").click(
			function(){
				$(this).parents("#main-nav").find("li a").removeClass("current");
				$(this).addClass("current");
				$(this).parents("#main-nav > li").find("a.nav-top-item").addClass("current");
			}
		);
		$("#home").click(
			function(){
				$(this).siblings().find("a").removeClass("current");
				$(this).siblings().find("ul").slideUp("normal"); // Slide up all sub menus except the one clicked
			}
		);
		
		$("#main-nav li .nav-top-item").hover(
			function () {
				$(this).stop().animate({ paddingRight: "25px" }, 200);
			}, 
			function () {
				$(this).stop().animate({ paddingRight: "15px" });
			}
		);

		$('.check-all').click(
			function(){
				$(this).parent().parent().parent().parent().find("input[type='checkbox']").attr('checked', $(this).is(':checked'));   
			}
		);
			$('tbody tr:even').addClass("alt-row");
		
		
});
  
  
  