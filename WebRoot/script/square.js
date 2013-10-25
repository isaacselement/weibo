$(document).ready(function() {
	
//处理topic的js
//	$(".QingTopic .db h4 a").load("/weibo/bulletin?command=get&parameter=TOPIC",
//			function(responseText, textStatus, XMLHttpRequest){
//				this.title=responseText;
//	});
	
	//同步方式
	//var responseObj = $.ajax({url:"/weibo/bulletin?command=get&parameter=TOPIC",async:false});
	//var array = responseObj.responseText.split(":");
	//$(".QingTopic .db h4 a").html(array[0]);
	//$(".QingTopic .db h4 a:first").attr("title",array[0]).attr("href",array[1]);

	//异步方式，设置回调函数
	var responseObj = $.ajax({url:"/weibo/bulletin?command=get&parameter=TOPIC",complete:function(xhr,ts){
		if(ts == "success"){
			var array = xhr.responseText.split(":");
			$(".QingTopic .db h4 a").html(array[0]);
			$(".QingTopic .db h4 a:first").attr("title",array[0]).attr("href",array[1]);
		}
	}});
	
//返回顶部功能的js
	(function() {
	    var $backToTopEle = $(".goTop").click(function() {
	            $("html, body").animate({ scrollTop: 0 }, 120); }), 
	    backToTopFun = function() {
	        var st = $(document).scrollTop();
	        (st > 0)? $backToTopEle.show(): $backToTopEle.hide();    
	    };
	    $(window).bind("scroll", backToTopFun);
	    $(function() {backToTopFun();});
	})();
});



