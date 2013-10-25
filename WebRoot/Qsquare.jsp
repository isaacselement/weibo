<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="css/square.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="script/jquery1.7/jquery-1.7.2.js"></script>
<script type="text/javascript" src="script/square.js"></script>

<link rel="icon" type="image/png" href="images/ico/twitter.png">
<title>i轻博客广场</title>

</head>
<body>
<div class="bodyBg">

  <div class="dbWrapW">

	<div class="dbWrap">
	
	
	
		<div class="container">
		
		  <!-- top begin -->
		  <div class="top">
		  	<div class="logo">
		  		<a class="logo_iQ" href="#" title="我的i轻博客_iQing">我的iQing</a>
		  		
		  		<div class="nav">
					<a  href="Qreg.html" title="" ><span>注册</span></a>
					<a  href="Qlogin.html" title="" ><span>登录</span></a>
				</div>
		  	</div>
		  	
			
		  </div>
		  <!-- top end -->
		  
		  <!-- header begin -->
		  <div class="header">
		  	<div class="panel">
		  		<ul>
		  			<li class="b1">
		  				<a title="博文" href="">
		  					<span>博文</span>
		  				</a>
		  			</li>
		  			<li class="b2">
		  				<a title="照片" href="">
		  					<span>照片</span>
		  				</a>
		  			</li>
		  			<li class="b3">
		  				<a title="视频" href="">
		  					<span>视频</span>
		  				</a>
		  			</li>
		  			<li class="b4">
		  				<a title="音乐" href="">
		  					<span>音乐</span>
		  				</a>
		  			</li>
		  		</ul>
		  		
		  	</div>
		  	
		  	<div class="search">
		  		<div class="iptbtn">
		  			<input type="text" placeholder="星座" class="ipt" />
		  			<input type="button" value="search" class="btn" />
		  		</div>
		  	</div>
		  	
		  	<div class="clearfloat"></div>
		  </div>
		  <!-- header end -->
		  
		  
		  <!-- content begin -->
		  <div class="content">
		  
		  
		  	<!-- 最新动态 begin-->
		  	<div class="main">
		  	
		  		<!-- QingTopic begin -->
		  		<div class="QingTopic">
		  			<div class="db">
		  				<h3>iQing话题</h3>
		  				<h4>
		  					<a href="" title="" ></a>
		  				</h4>
		  			</div>
		  		</div>
		  		<!-- QingTopic end -->
		  	
		  		<!-- 正在加载 begin -->
		  		<div class="feedLoading" style="">
					<p>正在加载，请稍候......</p>
				</div>
		  		<!-- 正在加载 end -->
				
		  		<!-- NewMsg begin -->
		  	    <div class="feedMsgNew" style="display: none;" >
		  	    	<a href="#" title="" >有新动态，点击查看</a>
		  	    </div>
		  		<!-- NewMsg ene -->
		  		
		  		<MARQUEE direction="down" onmouseover="this.stop()" onmouseout="this.start()"" 
		  					scrollamount="2" scrolldelay="10" width="100%" height="180px">
		  		<c:forEach items="${posttopics}" var="posttopic">
		  		
		  		<div class="feedList">
		  			<ul id="theLatestFeed">
		  				<li>
		  					<div class="headPic">
		  						<a title="${posttopic.username}" href="http://qing.weibo.com/suchme"><span></span></a>
		  						<img alt="" src="/weibo/images/0.jpg" />
		  					</div>
		  					
		  					<div class="feedCon">
		  						<div class="feedForm">
		  							<a id="" href="http://qing.weibo.com/suchme">${posttopic.username}</a>
		  							<a style="" class="feedDate" href="">${posttopic.time}</a>
		  							<a style="display: none;" class="feedDate" href="">8分钟前</a>
		  						</div>
		  						
		  						<div class="feedText">
		  							<div class="flr">
		  								<img style="width: 100px;height: 100px;" class="flr" alt="" src="/weibo/images/624c2f04jw1dtqf31l9h8j.jpg" />
		  							</div>
									${posttopic.context}
									<a title="" alt="" href="http://qing.weibo.com/suchme" target="_blank">http://t.cn/zOFtCxk</a>
								
								</div>
		  						
		  						<div class="feedAttr">
		  						
		  							<a class="feedAttr_transfer" href="javascript:void(0)">
		  								转发
		  								<em>(7)</em>
		  							</a>
		  							
		  							<a class="feedAttr_commend" href="javascript:void(0)" from="weibo" blog_id="">
		  								评论
		  								<em>(2)</em>
		  							</a>
		  							
		  						</div>
		  					</div>
		  				</li>
		  			</ul>
		  		</div>
		  		</c:forEach>
		  		</MARQUEE>
		  		
				<div class="moreFeed" style="">
					 <p><a href="javascript:void(0)">查看更多</a></p>
				</div>
				
				<div id="theLatestFeedLoading" style="" class="feedLoading">
					<p>正在加载，请稍候......</p>
				</div>


			</div>
		  	<!-- 最新动态 end-->
		  	
		  	
		  	<!-- 右侧菜单组件模块 begin -->
		  	<div class="aside">
		  	
		  		<div class="userstates"> 
					<ul class="mainSt">
						<li class="hover"><em class="ico_cal365"></em><a  href="">我的365</a><a  href="">记录今天</a></li>
						<li class="follow current" tabitemtype="0"><em class="ico_news"></em><a href="javascript:void(0)">最新动态</a></li>
						<li class="like" tabitemtype="9"><em class="ico_like"></em><a href="javascript:void(0)">我的喜欢</a></li>
						<li id="myBlog" class="myblog"><em class="ico_myblog"></em><a href="javascript:void(0)">我的Qing</a><a href="javascript:void(0)"></a></li>
				  </ul>
				</div>
		  	
		  	</div>
		  	<!-- 右侧菜单组件模块 end -->
		  
		  	<div class="clearfloat"></div>
		  </div>
		  <!-- content end -->
		  
		  
		  
		  <div class="footer">
				<p>
					<a href="" target="_blank">帮助</a> 
						<span>|</span> 
					<a href="" target="_blank">意见反馈</a> 
						<span>|</span> 
					<a href="" target="_blank">导航</a> 
						<span>|</span>
					Copyright© &nbsp;&nbsp;2012-2013 iQing 版权所有
				</p>
		  </div>
		
		  <!-- 返回顶部 -->
		  <div class="goTop" style="display: none;">
		  	<a title="返回顶部" href="javascript:void(0)" ></a>
		  </div>
		  
		</div>
	
	
	
	</div>
	
  </div>	
</div>
</body>
</html>