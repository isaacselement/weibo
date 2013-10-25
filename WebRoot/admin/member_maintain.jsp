<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <link rel="stylesheet" href="style/maintain.css">
    <script type="text/javascript" src="script/jquery.js"></script>
    <script type="text/javascript" src="script/nameAuto.js"></script>
    <script type="text/javascript">
        function addMember() {
            window.self.location = "user/member_register.jsp";
        }

        function modifyMember() {
            var count = 0;
            var j = 0;
            for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
                if (document.getElementsByName("selectFlag")[i].checked) {
                    j = i;
                    count++;
                }
            }
            if (count == 0) {
                alert("请选择需要修改的成员！");
                return;
            }
            if (count > 1) {
                alert("一次只能修改一个成员！");
                return;
            }
            if (count == 1) {
                with (document.getElementById("memberForm")) {
                    method = "post";
                    action = "member!modifyDetail.do?pageNo=${pageModel.pageNo}&pageSize=5";
                    submit();
                }
            }
        }

        function deleteMember() {
            var flag = false;
            for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
                if (document.getElementsByName("selectFlag")[i].checked) {
                    flag = true;
                }
            }
            if (!flag) {
                alert("请选择需要删除的成员！");
                return;
            }
            if (window.confirm("确认删除吗？")) {
                with (document.getElementById("memberForm")) {
                    method = "post";
                    action = "member!delete.do?pageNo=${pageModel.pageNo}&pageSize=5";
                    submit();
                }
            }
        }

        function checkAll() {
            for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
                document.getElementsByName("selectFlag")[i].checked = document.getElementById("ifAll").checked;
            }
        }

		//查询满足要求的成员
        function queryMember() {
            with (document.getElementById("memberForm")) {
                method = "post";
                action = "member!queryMember.do?pageModel.pageSize=10";//设置每页显示的记录数量
                submit();
            }
        }

        function resetMember() {
            document.getElementById("queryStr").value = ""
        }

        function topPage() {
        	with (document.getElementById("memberForm")) {
	               method = "post";
	               action = "member!queryMember.do?pageModel.pageNo=${pageModel.topPageNo}&pageModel.pageSize=${pageModel.pageSize}&grade=";
	               submit();
	        }
        }

        function previousPage() {
        	with (document.getElementById("memberForm")) {
	               method = "post";
	               action = "member!queryMember.do?pageModel.pageNo=${pageModel.previousPageNo}&pageModel.pageSize=${pageModel.pageSize}&grade=";
	               submit();
	        }
        }

        function nextPage() {
	        with (document.getElementById("memberForm")) {
	               method = "post";
	               action = "member!queryMember.do?pageModel.pageNo=${pageModel.nextPageNo}&pageModel.pageSize=${pageModel.pageSize}&grade=";
	               submit();
	        }
        }

        function bottomPage() {
        	with (document.getElementById("memberForm")) {
	               method = "post";
	               action = "member!queryMember.do?pageModel.pageNo=${pageModel.bottomPageNo}&pageModel.pageSize=${pageModel.pageSize}&grade=";
	               submit();
	        }
        }
        function isQuery(event) {
            var myEvent = event || window.event;//IE与FF不同的地方
            var keyCode = myEvent.keyCode;
            if (keyCode == 13) {//莫明奇妙的问题（解决直接回车不能带参数的问题）
	            if (highlightindex != -1) {//高亮下标不等于-1，在nameAuto.js中定义的全局变量
	                var comtext = $("#auto").hide().children("div").eq(highlightindex).text();
	                highlightindex = -1;
	                $("#queryStr").val(comtext);//文本本框变成高节点的内容
	            } else {
	                $("#auto").hide();
	                $("#queryStr").get(0).blur();
	            }
                queryMember();
            }
        }
    </script>
</head>
<body class="body1">
<form name="memberForm" id="memberForm">
    <table width="95%" align="center" style="margin-top: 30px">
        <tr>
            <td width="522" class="p1" height="2"><img src="images/mark_arrow_02.gif" width="14" height="14">&nbsp;<b>基本数据管理&gt;&gt;人员维护</b>
            </td>
        </tr>
    </table>
    <hr width="96%" align="center">
    <table width="95%" align="center" style="margin:30px 30px">
        <tr>
            <td width="30%" height="29">
                <div align="right">按姓名，性别，类别或年级，模糊查询:&nbsp;&nbsp;</div>
            </td>
            <td width="40%"><input autocomplete="off" name="queryStr" id="queryStr" 
            	value="${queryStr}" size="97" maxlength="100" onKeyPress="isQuery(event)">

                <div id="auto"></div>
            </td>
            <td width="30%">
                <div align="left">
                    <input name="btnQuery" type="button" class="button1" id="btnQuery" value="查询"
                           onClick="queryMember()">
                    &nbsp;
                    <input name="btnReset" type="button" class="button1" id="btnReset" value="重置"
                           onClick="resetMember()">
                </div>
            </td>
        </tr>
    </table>
    <table width="95%" align="center" class="table1">
        <tr>
            <th width="3%" class="rd6"><input type="checkbox" id="ifAll" onClick="checkAll()"></th>
            <th width="3%" class="rd6"> ID号</th>
            <th width="4%" class="rd6"> 姓名</th>
            <th width="3%" class="rd6"> 性别</th>
            <th width="4%" class="rd6"> 类别</th>
            <th width="5%" class="rd6"> 职称</th>
            <th width="5%" class="rd6"> 年级</th>
            <th width="8%" class="rd6"> 班级</th>
            <th width="10%" class="rd6"> Email</th>
            <th width="7%" class="rd6"> 电话</th>
            <th width="15%" class="rd6"> 个性签名</th>
            <th class="rd6"> 简介</th>
        </tr>
        <c:forEach items="${pageModel.data}" var="member">
            <tr>
                <td class="rd8"><input type="checkbox" name="selectFlag" id="selectFlag" class="checkbox1"
                                       value="${member.id }"></td>
                <td class="rd8">${ member.id }</td>
                <td class="rd8">${ member.username }</td>
                <td class="rd8">${ member.sex }</td>
                <td class="rd8">${ member.type }</td>
                <td class="rd8">${ member.title }</td>
                <td class="rd8">${ member.grade }</td>
                <td class="rd8">${ member.class_ }</td>
                <td class="rd8">${ member.email }</td>
                <td class="rd8">${ member.phone }</td>
                <td class="rd8">${ member.motto }</td>
                <td class="rd8">${ member.profile }</td>
            </tr>
        </c:forEach>
    </table>
    <div style="float: right; margin-right: 2.8%"> 当前页数：${pageModel.pageNo} /总页数：${pageModel.totalPages }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="btnTopPage" type="button" id="btnTopPage" value="|&lt;&lt; " title="首页" onClick="topPage()">
        <input name="btnPreviousPage" type="button" id="btnPreviousPage" value=" &lt;  " title="上一页"
               onClick="previousPage()">
        <input name="btnNext" type="button" id="btnNext" value="  &gt; " title="下一页" onClick="nextPage()">
        <input name="btnBottomPage" type="button" id="btnBottomPage" value=" &gt;&gt;|" title="最后页"
               onClick="bottomPage()">
        <input name="btnAdd" type="button" class="button1" id="btnAdd" value="添加" onClick="addMember()">
        <input name="btnDelete" class="button1" type="button" id="btnDelete" value="删除" onClick="deleteMember()">
        <input name="btnModify" class="button1" type="button" id="btnModify" value="修改" onClick="modifyMember()">
    </div>
</form>
</body>
</html>
