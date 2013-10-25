<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <link rel="icon" type="image/png" href="images/ico/twitter.png">  <!-- 因html的base标签有值了 -->
    <title>管理员首页 - i轻博客 </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>

     <frameset cols="20%,*" frameborder="yes" border="1" >
     	<frame src="admin/vertical_nav.jsp"  name="left" scrolling="no"  noresize="noresize" >
        <frame src="admin/main.jsp"  name="main" scrolling="auto" >
     </frameset>

</html>
