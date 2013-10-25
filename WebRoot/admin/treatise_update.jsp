<%@ page language="java" contentType="text/html; charset=utf-8" import="com.eleyuan.bean.Member"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>论著信息更新</title>
    <script type="text/javascript" src="script/client_validate.js"></script>
    <script language="javascript" type="text/javascript">
        function check() {
            if (isEmpty(document.form1.title.value)) {
                window.alert("请输入论著标题！");
                document.form1.title.focus();
                return false;
            }
            if (isEmpty(document.form1.author.value)) {
                window.alert("请输入论著作者！");
                document.form1.author.focus();
                return false;
            }
            if (isEmpty(document.form1.time.value)) {
                window.alert("请选择论著发表时间！");
                document.form1.time.focus();
                return false;
            }
        }
    </script>
</head>
<body background="images/bgimg.gif">
<center>
    <h1>论著信息更新<br/></h1>
    <hr color="#66CCFF"/>
    <div style="text-align: center; font-size: 20px"><FONT color="red">
		<s:actionerror cssStyle="color:red"/>
    </FONT></div>
    <p></p>

    <form name="form1" action="treatise!update.do" method="post" id="uploadForm" enctype = "multipart/form-data">
        <table width="533">
            <tr>
                <td height="35"></td>
            </tr>
            <tr>
                <td height="13"><input type="hidden" size="35" name="id" value="${treatise.id }"/></td>
            </tr>
            <tr>
                <td> 论著标题：</td>
                <td><input type="text" size="35" name="title" value="${treatise.title }"/></td>
                <td><font color="red">（*必填）</font></td>
            </tr>

            <tr>
                <td height="13"></td>
            </tr>
            <tr>
                <td> 论著作者：</td>
                <td><input type="text" size="35" name="author" value="${treatise.author }"/></td>
                <td><font color="red">（*必填）</font></td>
            </tr>
            <tr>
                <td height="13"></td>
            </tr>
            <tr>
                <td> 发表时间：</td>
                <td><select name="time">
                    <option selected="selected" value="${treatise.time }">---${treatise.time }年---</option>
                    <option value='2006'> ---2006年---</option>
                    <option value='2007'> ---2007年---</option>
                    <option value='2008'> ---2008年---</option>
                    <option value='2009'> ---2009年---</option>
                </select>
                </td>
                <td><font color="red">（*必选）</font></td>
            </tr>
            <tr>
                <td height="13"></td>
            </tr>

            <tr>
                <td> 发表期刊：</td>
                <td><input type="text" size="35" name="publishedAdd" value="${treatise.publishedAdd }"/></td>
            </tr>
            <tr>
                <td height="13"></td>
            </tr>
            <tr>
                <td> 检索编号：</td>
                <td><input type="text" size="35" name="searchId" value="${treatise.searchId }"/></td>
            </tr>
            <tr>
                <td height="13"></td>
            </tr>
            <tr>
                <td>摘要信息：</td>
                <td><textarea cols="30" rows="10" name="digest">${treatise.digest }</textarea></td>
            </tr>
			<s:property value=""/>
            <tr>
                <td height="13"></td>
            </tr>
            
             <tr>
                <td>相关文档：</td>
                <td> <input name="upload" type="file" title="上传附件"/>上传</td>
            </tr>
           
            <tr>
                <td></td>
                <td><input type="submit" value="提交" onClick="return check() "/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="reset" value="重置"/>
                </td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>

