<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.eleyuan.bean.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Member member = (Member) session.getAttribute("member");
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title></title>
		<link rel="stylesheet" href="style/maintain.css">
		<script type="text/javascript" src="script/jquery.js"></script>
		<script type="text/javascript">
	function addMessage() {
		window.self.location = "space/private_input.jsp";
	}

	function modifyMessage() {
		var count = 0;
		var j = 0;
		for ( var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
			if (document.getElementsByName("selectFlag")[i].checked) {
				j = i;
				count++;
			}
		}
		if (count == 0) {
			alert("请选择需要修改的私信！");
			return;
		}
		if (count > 1) {
			alert("一次只能修改一个私信！");
			return;
		}
		if (count == 1) {
			with (document.getElementById("messageForm")) {
				method = "post";
				action = "message!toModify.do?pageNo=${pageModel.pageNo}&pageSize=5";
				submit();
			}
		}
	}

	function deleteMessage() {
		var flag = false;
		for ( var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
			if (document.getElementsByName("selectFlag")[i].checked) {
				flag = true;
			}
		}
		if (!flag) {
			alert("请选择需要删除的私信！");
			return;
		}
		if (window.confirm("确认删除吗？")) {
			with (document.getElementById("messageForm")) {
				method = "post";
				action = "message!deleteUsername.do?pageModel.pageNo=${pageModel.pageNo}&pageModel.pageSize=${pageModel.pageSize}";
				submit();
			}
		}
	}

	function checkAll() {
		for ( var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
			document.getElementsByName("selectFlag")[i].checked = document
					.getElementById("ifAll").checked;
		}
	}

	function queryMessage() {
		with (document.getElementById("messageForm")) {
			method = "post";
			action = "message!queryMessage.do?pageModel.pageSize=6";//设置每页显示的记录数量
			submit();
		}
	}

	function listMessageByUsername() {
		with (document.getElementById("messageForm")) {
			method = "post";
			action = "message!listMessageByUsername.do?pageModel.pageSize=6";//设置每页显示的记录数量
			submit();
		}
	}

	function resetMessage() {
		document.getElementById("queryStr").value = ""
	}

	function topPage() {
		with (document.getElementById("messageForm")) {
			method = "post";
			action = "message!listMessageByUsername.do?pageModel.pageNo=${pageModel.topPageNo}&pageModel.pageSize=${pageModel.pageSize}";
			submit();
		}
	}

	function previousPage() {
		with (document.getElementById("messageForm")) {
			method = "post";
			action = "message!listMessageByUsername.do?pageModel.pageNo=${pageModel.previousPageNo}&pageModel.pageSize=${pageModel.pageSize}";
			submit();
		}
	}

	function nextPage() {
		with (document.getElementById("messageForm")) {
			method = "post";
			action = "message!listMessageByUsername.do?pageModel.pageNo=${pageModel.nextPageNo}&pageModel.pageSize=${pageModel.pageSize}";
			submit();
		}
	}

	function bottomPage() {
		with (document.getElementById("messageForm")) {
			method = "post";
			action = "message!listMessageByUsername.do?pageModel.pageNo=${pageModel.bottomPageNo}&pageModel.pageSize=${pageModel.pageSize}";
			submit();
		}
	}
	function isQuery(event) {
		var myEvent = event || window.event;//IE与FF不同的地方
		var keyCode = myEvent.keyCode;
		if (keyCode == 13) {//解决直接回车不能带参数的问题
			queryMessage();
		}
	}
</script>
	</head>
	<body class="body1">
		<%--<%
out.write("<script>location.href='message!listMessageByReciever.do?username=${member.username}&pageModel.pageSize=6';</script>");
%>
--%>
		<form name="messageForm" id="messageForm">

			<hr width="96%" align="center">

			<table width="95%" align="center" class="table1">
				<tr>
					<th width="3%" class="rd6">
						<input type="checkbox" id="ifAll" onClick=
	checkAll();
>
					</th>
					<th width="5%" class="rd6">
						ID号
					</th>
					<th width="10%" class="rd6">
						发信人
					</th>
					<th width="10%" class="rd6">
						收信人
					</th>
					<th width="15%" class="rd6">
						时间
					</th>
					<th width="52%" class="rd6">
						内容
					</th>

				</tr>
				<c:forEach items="${pageModel.data}" var="message">
					<tr>
						<td class="rd8">
							<input type="checkbox" name="selectFlag" id="selectFlag"
								class="checkbox1" value="${message.id }">
						</td>
						<td class="rd8">
							${ message.id }
						</td>
						<td class="rd8">
							${ message.username }
						</td>
						<td class="rd8">
							${ message.reciever }
						</td>
						<td class="rd8">
							${ message.time }
						</td>
						<td class="rd8">
							${ message.content }
						</td>

					</tr>
				</c:forEach>
			</table>
			<div style="float: right; margin-right: 2.8%">
				当前页数：${pageModel.pageNo} /总页数：${pageModel.totalPages
				}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="btnTopPage" type="button" id="btnTopPage"
					value="|&lt;&lt; " title="首页" onClick=
	topPage();
>
				<input name="btnPreviousPage" type="button" id="btnPreviousPage"
					value=" &lt;  " title="上一页" onClick=
	previousPage();
>
				<input name="btnNext" type="button" id="btnNext" value="  &gt; "
					title="下一页" onClick=
	nextPage();
>
				<input name="btnBottomPage" type="button" id="btnBottomPage"
					value=" &gt;&gt;|" title="最后页" onClick=
	bottomPage();
>
				<input name="btnDelete" class="button1" type="button" id="btnDelete"
					value="删除" onClick=
	deleteMessage();
>
			</div>
		</form>
	</body>
</html>
