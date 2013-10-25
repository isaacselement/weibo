<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*,com.eleyuan.bean.*,java.util.List" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page
	import="java.text.DateFormat,java.util.Date,  javax.servlet.http.HttpServletResponse;"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

    String username  = (String) session.getAttribute("user");
    Date dateTime=new Date();
	DateFormat df2 = DateFormat.getDateTimeInstance(); 
	String time =df2.format(dateTime);	
	int posttopicId = (Integer) session.getAttribute("posttopicId");
		
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>E-乐园微博</title>
		<style type="text/css">

</style>
		<link href="SpryAssets/index_main.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="script/bulletin.js"></script>
		<script type="text/javascript" src="script/jquery.js"></script>
		<script type="text/javascript">
	
</script>
	</head>

	<body>
	<table>
	<tr>
	<td>要评论的微博：</td>
	</tr>
	<tr><td>${posttopic.username}:</td></tr>
	<tr><td>${posttopic.context}</td></tr>
	<tr><td>${posttopic.time}</td></tr>
	</table>
	<form id="form1" action="reply!add.do" method="post">
     <table > 
        <textarea name="context" id="context" cols="45" rows="5"></textarea>
 		<input type="hidden" name="username" value="<%=username%>"/>
		<input type="hidden" name="time" value="<%=time%>"/>
		<input type="hidden" name="posttopicId" value="<%=posttopicId%>"/>		
        <tr><td><input type="submit" name="tijiao" value="提交"/></td></tr>
      </table>
	</form>
		
	
	
	<debug></debug>
	
	
	<td>
			 <c:forEach items="${replies}" var="reply" >             
             ${reply.username}:${reply.context}<br/>
                                   时间:${reply.time}<p/>
             </c:forEach>
		</td>

	</body>
</html>
