

// From square.js


$(document).ready(function() {
	
//����topic��js
	var responseObj = $.ajax({url:"/weibo/bulletin?command=get&parameter=TOPIC",complete:function(xhr,ts){
		if(ts == "success"){
			var array = xhr.responseText.split(":");
			$(".QingTopic .db h4 a").html(array[0]);
			$(".QingTopic .db h4 a:first").attr("title",array[0]).attr("href",array[1]);
		}
	}});

	
	
//���ض������ܵ�js
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
	
	
//������Ч��
		//�����ٶ�
		var speed = 500;

		//���¼�����
		$("#article").click(function(event) {
			//ȡ���¼�ð��
			event.stopPropagation();
			//���õ�����λ��
			var offset = $(event.target).offset();
			$("#editorBox").css({
				top : offset.top + $(event.target).height() + 10 + "px",
				left : offset.left
			});

	        //�õ�����͸����ʾ
	        if ($("#editorBox").css("display") == "none")
	        {
	            $("#editorBox").fadeIn(speed);
	        }
	        else
	        {
	            $("#editorBox").fadeOut(speed);
	        }

		});
		//�����հ��������ص�����
		$(document).click(function(event) {
			var isBox = document.getElementById("editorArea")==event.target;
			if(!isBox){
				$("#editorBox").hide(speed)
			}
		});

	
	
});
