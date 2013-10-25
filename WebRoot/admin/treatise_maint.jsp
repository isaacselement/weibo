<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <link rel="stylesheet" href="style/maintain.css">
    <script type="text/javascript" src="script/jquery.js"></script>
    <script type="text/javascript">
        function addTreatise() {
            window.self.location = "admin/treatise_register.jsp";
        }

        function modifyTreatise() {
            var count = 0;
            var j = 0;
            for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
                if (document.getElementsByName("selectFlag")[i].checked) {
                    j = i;
                    count++;
                }
            }
            if (count == 0) {
                alert("请选择需要修改的论文！");
                return;
            }
            if (count > 1) {
                alert("一次只能修改一个论文！");
                return;
            }
            if (count == 1) {
                with (document.getElementById("treatiseForm")) {
                    method = "post";
                    action = "treatise!toModify.do?pageNo=${pageModel.pageNo}&pageSize=5";
                    submit();
                }
            }
        }

        function deleteTreatise() {
            var flag = false;
            for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
                if (document.getElementsByName("selectFlag")[i].checked) {
                    flag = true;
                }
            }
            if (!flag) {
                alert("请选择需要删除的论文！");
                return;
            }
            if (window.confirm("确认删除吗？")) {
                with (document.getElementById("treatiseForm")) {
                    method = "post";
                    action = "treatise!delete.do?pageModel.pageNo=${pageModel.pageNo}&pageModel.pageSize=${pageModel.pageSize}";
                    submit();
                }
            }
        }

        function checkAll() {
            for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
                document.getElementsByName("selectFlag")[i].checked = document.getElementById("ifAll").checked;
            }
        }

        function queryTreatise() {
            with (document.getElementById("treatiseForm")) {
                method = "post";
                action = "treatise!queryTreatise.do?pageModel.pageSize=3";//设置每页显示的记录数量
                submit();
            }
        }

        function resetTreatise() {
            document.getElementById("queryStr").value = ""
        }

        function topPage() {
        	with (document.getElementById("treatiseForm")) {
	               method = "post";
	               action = "treatise!queryTreatise.do?pageModel.pageNo=${pageModel.topPageNo}&pageModel.pageSize=${pageModel.pageSize}";
	               submit();
	        }
        }

        function previousPage() {
        	with (document.getElementById("treatiseForm")) {
	               method = "post";
	               action = "treatise!queryTreatise.do?pageModel.pageNo=${pageModel.previousPageNo}&pageModel.pageSize=${pageModel.pageSize}";
	               submit();
	        }
        }

        function nextPage() {
	        with (document.getElementById("treatiseForm")) {
	               method = "post";
	               action = "treatise!queryTreatise.do?pageModel.pageNo=${pageModel.nextPageNo}&pageModel.pageSize=${pageModel.pageSize}";
	               submit();
	        }
        }

        function bottomPage() {
        	with (document.getElementById("treatiseForm")) {
	               method = "post";
	               action = "treatise!queryTreatise.do?pageModel.pageNo=${pageModel.bottomPageNo}&pageModel.pageSize=${pageModel.pageSize}";
	               submit();
	        }
        }
        function isQuery(event) {
            var myEvent = event || window.event;//IE与FF不同的地方
            var keyCode = myEvent.keyCode;
            if (keyCode == 13) {//解决直接回车不能带参数的问题
            	queryTreatise();
            }
        }
    </script>
</head>
<body class="body1">
<form name="treatiseForm" id="treatiseForm">
    <table width="95%" align="center" style="margin-top: 30px">
        <tr>
            <td width="522" class="p1" height="2"><img src="images/mark_arrow_02.gif" width="14" height="14">&nbsp;<b>基本数据管理&gt;&gt;论著维护</b>
            </td>
        </tr>
    </table>
    <hr width="96%" align="center">
    <table width="95%" align="center" style="margin:30px 30px">
        <tr>
            <td width="30%" height="29">
                <div align="right">按年份查询:&nbsp;&nbsp;</div>
            </td>
            <td width="40%"><input autocomplete="off" id="queryStr" name="queryStr" value="${queryStr}" size="97" maxlength="100" onkeypress="isQuery(event)">
            </td>
            <td width="30%">
                <div align="left">
                    <input name="btnQuery" type="button" class="button1" id="btnQuery" value="查询"
                           onClick="queryTreatise()">
                    &nbsp;
                    <input name="btnReset" type="button" class="button1" id="btnReset" value="重置"
                           onClick="resetTreatise()">
                </div>
            </td>
        </tr>
    </table>
    <table width="95%" align="center" class="table1">
        <tr>
            <th width="3%" class="rd6"><input type="checkbox" id="ifAll" onClick="checkAll()"></th>
            <th width="5%" class="rd6"> ID号</th>
            <th width="10%" class="rd6"> 标题</th>
            <th width="10%" class="rd6"> 作者</th>
            <th width="5%" class="rd6"> 年份</th>
            <th width="10%" class="rd6"> 发表期刊</th>
            <th width="8%" class="rd6"> 检索号</th>
            <th width="" class="rd6"> 摘要</th>
            <th width="5%" class="rd6"> 相关文档</th>
        </tr>
        <c:forEach items="${pageModel.data}" var="treatise">
            <tr>
                <td class="rd8"><input type="checkbox" name="selectFlag" id="selectFlag" class="checkbox1"
                                       value="${treatise.id }"></td>
                <td class="rd8">${ treatise.id }</td>
                <td class="rd8">${ treatise.title }</td>
                <td class="rd8">${ treatise.author }</td>
                <td class="rd8">${ treatise.time }</td>
                <td class="rd8">${ treatise.publishedAdd }</td>
                <td class="rd8">${ treatise.searchId }</td>
                <td class="rd8">${ treatise.digest }</td>
                <td class="rd8">
                <c:if test="${!empty treatise.ext}">
                <a href="docs/treatises/${treatise.id }${treatise.ext }">查看</a>
                </c:if>
                </td>
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
        <input name="btnAdd" type="button" class="button1" id="btnAdd" value="添加" onClick="addTreatise()">
        <input name="btnDelete" class="button1" type="button" id="btnDelete" value="删除" onClick="deleteTreatise()">
        <input name="btnModify" class="button1" type="button" id="btnModify" value="修改" onClick="modifyTreatise()">
    </div>
</form>
</body>
</html>
