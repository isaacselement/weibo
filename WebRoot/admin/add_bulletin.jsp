<%@ page language="java" contentType="text/html; charset=utf-8" import="com.eleyuan.bean.Admin"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>发布公告</title>
    <script type="text/javascript" src="js/client_validate.js"></script>
    <script language="javascript" type="text/javascript">
        function check() {
            with (document.getElementById("uploadForm")) {
                action = "bulletin?command=put&parameter=TOPIC";
                submit();
            }
        }

        function toAdmin() {
            window.self.location = "admin/admin.jsp"
        }
    </script>
</head>
<body background="images/bgimg.gif">
<center>
    <h1>发布公告<br/></h1>
    <hr color="#66CCFF"/>
    <div style="text-align: center; font-size: 20px"><FONT color="red">
    </FONT></div>
    <p></p>

    <form name="form1" method="post" id="uploadForm">
        <table width="533">
            <tr>
                <td height="165">公告/话题内容：</td>
                <td width="412" valign="top"><textarea name="bulletin" cols="65" rows="10"></textarea></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2"><input type="submit" value="提交" onClick="return check() "/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="reset" value="重置"/>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>

