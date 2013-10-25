
function reg() {
	var responseObj = $.ajax({url:"/weibo/main!register.do",complete:function(xhr,ts){
		if(ts == "success"){
			var regStatus = xhr.responseText;
			if(regStatus == "success"){
				$(".regcallback").html("注册成功,登录...").show(800);
				setTimeout("location.href='Qlogin.html'", 2000);
			}else if(regStatus == "faile"){
				$(".regcallback").html("注册失败").show(800);
			}
		}else {
			$(".regcallback").html("网络故障,请重新注册").show(800);
		}
	}});
}
