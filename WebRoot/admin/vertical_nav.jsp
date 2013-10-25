<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<head>
<base href="<%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jquery弹性竖导航网页菜单</title>

<link rel="stylesheet" type="text/css" href="/weibo/css/vertical_nav.css" />
<script type="text/javascript" src="/weibo/script/jquery1.7/jquery-1.7.2.js"></script>
<script type="text/javascript" src="/weibo/script/vertical_nav.js"></script>
<script type="text/javascript" src="/weibo/script/jquery1.7/jquery.easing.1.3.js"></script>

</head>

<body>
<div id="apDiv1">

<div id="main">
  <ul class="container">
  
    <li class="menu">
          <ul>
		    <li class="button"><a href="#" class="green">用户管理<span></span></a></li>
            <li class="dropdown">
                <ul>
                    <li><a href="admin/member_maintain.jsp" target="main">用户维护</a></li>
                    <li><a href="" target="main">在线用户</a></li>
                    <li><a href="admin/member_register.html" target="main">添加用户</a></li>
                    <li><a href="" target="main">注销用户</a></li>
                    <li><a href="" target="main">私信用户</a></li>
                    <li><a href="" target="main">修改密码</a></li>
                    <li><a href="" onclick="$('.dropdown').slideUp('slow');return false;">close this section</a></li>
                    <li><a href="" onclick="$('.button a').eq(2).click();return false;">open the third section</a></li>
                </ul>
			</li>
          </ul>
      </li>
      
      <li class="menu">
          <ul>
		    <li class="button"><a href="#" class="orange">版面管理<span></span></a></li>          	
            <li class="dropdown">
                <ul>
                    <li><a href="admin/add_bulletin.jsp" target="main">发布话题</a></li>
                    <li><a href="admin/add_bulletin.jsp" target="main">发布公告</a></li>
                    <li><a href="" target="main">发起投票</a></li>
                    <li><a href="" onclick="$('.dropdown').slideUp('slow');return false;">close this section</a></li>
                    <li><a href="" onclick="$('.button a:last').click();return false;">open the last section</a></li>
                </ul>
			</li>
          </ul>
      </li>
 
      <li class="menu">
          <ul>
		    <li class="button"><a href="#" class="blue">博客管理<span></span></a></li>
            <li class="dropdown">
                <ul>
                    <li><a href="admin/treatise_maint.jsp" target="main">博客维护</a></li>
                    <li><a href="" target="main">审核博客</a></li>
                    <li><a href="" target="main">删除博客</a></li>
                    <li><a href="" target="main">锁定博客</a></li>
                </ul>
			</li>
          </ul>
      </li>

    
      <li class="menu">
          <ul>
		    <li class="button"><a href="#" class="red">返回首页<span></span></a></li>

            <li class="dropdown">
                <ul>
                    <li><a href="logout.do" target="_top">退出</a></li>
                    <li><a href="logout.do" target="_top">返回首页</a></li>
                </ul>
			</li>
          </ul>
      </li>
      
  </ul>

</div>
</div>
</body>
</html>
