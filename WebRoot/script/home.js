

// From square.js


$(document).ready(function() {
	
//处理topic的js
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
	
	
//弹出层效果
		//动画速度
		var speed = 500;

		//绑定事件处理
		$("#article").click(function(event) {
			//取消事件冒泡
			event.stopPropagation();
			//设置弹出层位置
			var offset = $(event.target).offset();
			$("#editorBox").css({
				top : offset.top + $(event.target).height() + 10 + "px",
				left : offset.left
			});

	        //让弹出层透明显示
	        if ($("#editorBox").css("display") == "none")
	        {
	            $("#editorBox").fadeIn(speed);
	        }
	        else
	        {
	            $("#editorBox").fadeOut(speed);
	        }

		});
		//单击空白区域隐藏弹出层
		$(document).click(function(event) {
			var isBox = document.getElementById("editorArea")==event.target;
			if(!isBox){
				$("#editorBox").hide(speed)
			}
		});

	
	
});
