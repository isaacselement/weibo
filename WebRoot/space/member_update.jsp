<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.eleyuan.bean.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>个人信息修改</title>
		<script>
	function logout() {
		if (confirm("确认要退出系统吗？")) {
			parent.location.href = "logout.do";
		}
	}

	function MM_preloadImages() { //v3.0
		var d = document;
		if (d.images) {
			if (!d.MM_p)
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}
	function MM_swapImgRestore() { //v3.0
		var i, x, a = document.MM_sr;
		for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
			x.src = x.oSrc;
	}
	function MM_findObj(n, d) { //v4.01
		var p, i, x;
		if (!d)
			d = document;
		if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
			d = parent.frames[n.substring(p + 1)].document;
			n = n.substring(0, p);
		}
		if (!(x = d[n]) && d.all)
			x = d.all[n];
		for (i = 0; !x && i < d.forms.length; i++)
			x = d.forms[i][n];
		for (i = 0; !x && d.layers && i < d.layers.length; i++)
			x = MM_findObj(n, d.layers[i].document);
		if (!x && d.getElementById)
			x = d.getElementById(n);
		return x;
	}

	function MM_swapImage() { //v3.0
		var i, j = 0, x, a = MM_swapImage.arguments;
		document.MM_sr = new Array;
		for (i = 0; i < (a.length - 2); i += 3)
			if ((x = MM_findObj(a[i])) != null) {
				document.MM_sr[j++] = x;
				if (!x.oSrc)
					x.oSrc = x.src;
				x.sr
				c = a[i + 2];
			}
	}
	//-->
</script>
		<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
		<script src="SpryAssets/SpryValidationTextField.js"
			type="text/javascript"></script>
		<script src="SpryAssets/SpryValidationPassword.js"
			type="text/javascript"></script>
		<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet"
			type="text/css" />
		<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet"
			type="text/css" />
		<link href="SpryAssets/SpryValidationPassword.css" rel="stylesheet"
			type="text/css" />
		<%
			Member member = (Member) session.getAttribute("member");
		%>
	</head>

	<body>
		<table width="1200" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="2000" valign="top" background="images/1260X2000.jpg">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="130" valign="top">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td height="1770" valign="top">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="14%" height="1770" valign="top">
											&nbsp;
										</td>
										<td width="72%" valign="top">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td height="1770" align="center" valign="top">
														<div id="TabbedPanels1" class="TabbedPanels">
															<ul class="TabbedPanelsTabGroup">
																<li class="TabbedPanelsTab" tabindex="0">
																	基本信息
																</li>
																<li class="TabbedPanelsTab" tabindex="0">
																	修改密码
																</li>
																<li class="TabbedPanelsTab" tabindex="0">
																	修改头像
																</li>
																<li class="TabbedPanelsTab" tabindex="0">
																	教育信息
																</li>
																<li class="TabbedPanelsTab" tabindex="0">
																	绑定手机
																</li>
															</ul>
															<div class="TabbedPanelsContentGroup">
																<div class="TabbedPanelsContent">
																	<s:actionerror cssStyle="color:red" />
																	<form name="form1" id="memberForm" method="post"
																		action="member!update.do">
																		<div style="visibility: hidden" />
																			<input name="id" value="${member.id}" />
																		</div>
																		<table width="100%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td width="27%" height="26" align="right"
																					valign="middle">
																					&nbsp;
																				</td>
																				<td width="73%" height="26" align="left"
																					valign="middle">
																					&nbsp;
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					昵称：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<label for="textfield"></label>
																					<span id="sprytextfield1"> <label
																							for="text1"></label> <input name="username"
																							type="text" id="text1" value="${member.username}"
																							size="25" maxlength="16" /> <span
																						class="textfieldMinCharsMsg">不符合最小字符数要求。</span><span
																						class="textfieldMaxCharsMsg">已超过最大字符数。</span> </span>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					性别：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<p>
																						<c:choose>
																							<c:when test="${member.sex == '男'}">
																								<label>
																									<input name="sex" type="radio"
																										id="RadioGroup1_0" value="男" checked="checked" />
																									男
																								</label>
																								<label>
																									<input type="radio" name="sex" value="女"
																										id="RadioGroup1_1" />
																									女
																								</label>
																							</c:when>
																							<c:otherwise>
																								<label>
																									<input name="sex" type="radio"
																										id="RadioGroup1_0" value="男" />
																									男
																								</label>
																								<label>
																									<input type="radio" name="sex" value="女"
																										id="RadioGroup1_1" checked="checked" />
																									女
																								</label>
																							</c:otherwise>
																						</c:choose>
																						<br />
																					</p>

																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					所在地：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<table width="100%" border="0" cellspacing="0"
																						cellpadding="0">
																						<tr>
																							<td width="18%" align="left" valign="middle">
																								<label for="select2"></label>
																								<label for="textfield2"></label>
																								<select name="address">
																									<option value="<%=member.getAddress()%>"
																										selected="selected">
																										---<%=member.getAddress()%></option>
																									<option value='广东'>
																										广东
																									</option>
																									<option value='福建'>
																										福建
																									</option>
																									<option value='安徽'>
																										安徽
																									</option>
																									<option value='北京'>
																										北京
																									</option>
																									<option value='重庆'>
																										重庆
																									</option>
																									<option value='甘肃'>
																										甘肃
																									</option>
																									<option value='广西'>
																										广西
																									</option>
																									<option value='贵州'>
																										贵州
																									</option>
																									<option value='海南'>
																										海南
																									</option>
																									<option value='河北'>
																										河北
																									</option>
																									<option value='黑龙江'>
																										黑龙江
																									</option>
																									<option value='河南'>
																										河南
																									</option>
																									<option value='湖北'>
																										湖北
																									</option>
																									<option value='湖南'>
																										湖南
																									</option>
																									<option value='内蒙古'>
																										内蒙古
																									</option>
																									<option value='江苏'>
																										江苏
																									</option>
																									<option value='江西'>
																										江西
																									</option>
																									<option value='吉林'>
																										吉林
																									</option>
																									<option value='辽宁'>
																										辽宁
																									</option>
																									<option value='宁夏'>
																										宁夏
																									</option>
																									<option value='青海'>
																										青海
																									</option>
																									<option value='山西'>
																										山西
																									</option>
																									<option value='山东'>
																										山东
																									</option>
																									<option value='上海'>
																										上海
																									</option>
																									<option value='四川'>
																										四川
																									</option>
																									<option value='天津'>
																										天津
																									</option>
																									<option value='西藏'>
																										西藏
																									</option>
																									<option value='新疆'>
																										新疆
																									</option>
																									<option value='云南'>
																										云南
																									</option>
																									<option value='浙江'>
																										浙江
																									</option>
																									<option value='台湾'>
																										台湾
																									</option>
																									<option value='香港'>
																										香港
																									</option>
																									<option value='澳门'>
																										澳门
																									</option>
																									<option value='海外'>
																										海外
																									</option>
																									<option value='其他 '>
																										其他
																									</option>
																								</select>
																								省
																							</td>
																							<td width="82%" align="left" valign="middle">
																								<label for="select3"></label>
																								<label for="textfield3"></label>
																								<input name="textfield2" type="text"
																									id="textfield3" size="8" maxlength="16" />
																								市
																							</td>
																						</tr>
																					</table>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					生日：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<input type="text" size="35" name="birthday"
																						value="${member.birthday}" maxlength="8" />
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					博客地址：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<span id="sprytextfield2"> <label
																							for="text2"></label> <input name="blogsite"
																							type="text" id="text2" size="25"
																							value="${member.blogsite}" /> </span>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					QQ：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<span id="sprytextfield3"> <label
																							for="text3"></label> <input name="qq" type="text"
																							id="text3" size="25" maxlength="13"
																							value="${member.qq}" /> <span
																						class="textfieldInvalidFormatMsg">格式无效。</span> </span>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					MSN：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<span id="sprytextfield4"> <label
																							for="text4"></label> <input name="msn"
																							type="text" id="text4" size="25" /> <span
																						class="textfieldInvalidFormatMsg">格式无效。</span> </span>
																				</td>
																			</tr>
																			<tr>
																				<td height="100" align="right" valign="top">
																					<table width="100%" border="0" cellspacing="0"
																						cellpadding="0">
																						<tr>
																							<td height="5">
																								&nbsp;
																							</td>
																						</tr>
																						<tr>
																							<td height="95" align="right" valign="top">
																								个人简介：
																							</td>
																						</tr>
																					</table>
																				</td>
																				<td height="114" align="left" valign="top">
																					<table width="100%" border="0" cellspacing="0"
																						cellpadding="0">
																						<tr>
																							<td height="5">
																								&nbsp;
																							</td>
																						</tr>
																						<tr>
																							<td width="200" height="95" align="left"
																								valign="top">
																								<label for="textarea"></label>
																								<textarea name="profile" id="textarea" cols="45"
																									rows="5">${member.profile }</textarea>
																							</td>
																						</tr>
																					</table>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" colspan="2" align="right"
																					valign="middle">
																					<table width="100%" border="0" cellspacing="0"
																						cellpadding="0">
																						<tr>
																							<td align="center" valign="middle">
																								<hr width="70%" size="1" />
																							</td>
																						</tr>
																						<tr>
																							<td height="29" align="center" valign="bottom">
																								以下信息，可作为通过客服取回帐号的依据。
																							</td>
																						</tr>
																					</table>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					真实姓名：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<span id="sprytextfield5"> <label
																							for="text5"></label> <input name="realName"
																							type="text" id="text5" size="25"
																							value="${member.realName}" /> <span
																						class="textfieldMinCharsMsg">不符合最小字符数要求。</span><span
																						class="textfieldMaxCharsMsg">已超过最大字符数。</span> </span>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					证件类型：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<label for="select"></label>
																					<select name="select" id="select">
																						<option value="身份证">
																							身份证
																						</option>
																						<option value="军官证">
																							军官证
																						</option>
																						<option value="护照">
																							护照
																						</option>
																						<option value="学生证">
																							学生证
																						</option>
																						<option value="其它">
																							其它
																						</option>
																					</select>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					证件号码：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<span id="sprytextfield6"> <label
																							for="text6"></label> <input name="text6"
																							type="text" id="text6" size="25" /> <span
																						class="textfieldRequiredMsg">需要提供一个值。</span> </span>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" colspan="2" align="right"
																					valign="middle">
																					<table width="100%" border="0" cellspacing="0"
																						cellpadding="0">
																						<tr>
																							<td width="38%" height="40" align="right"
																								valign="middle">
																								<label for="button"></label>
																								<input type="submit" name="button" id="button"
																									value="确定" />
																							</td>
																							<td width="62%" align="left" valign="middle">
																								<label for="button2"></label>
																								<input type="reset" name="button2" id="button2"
																									value="重填" />
																							</td>
																						</tr>
																					</table>
																				</td>
																			</tr>
																		</table>
																	</form>
																</div>
																<div class="TabbedPanelsContent">
																	<form id="form2" name="form2" method="post" action="member!update.do">
																		<table width="100%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td height="25" colspan="2" align="right"
																					valign="middle">
																					&nbsp;
																				</td>
																			</tr>
																			<tr>
																				<td width="16%" height="40" align="right"
																					valign="middle">
																					当前密码：
																				</td>
																				<td width="84%" height="40" align="left"
																					valign="middle">
																					<span id="sprypassword1" /> <label for="password1"></label>
																						<input name="password" type="text" id="password1"
																							value="${member.password}" size="25"
																							maxlength="16" /> <span
																						class="passwordRequiredMsg">需要输入一个值。</span><span
																						class="passwordMinCharsMsg">不符合最小字符数要求。</span><span
																						class="passwordMaxCharsMsg">已超过最大字符数。</span> </span>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					新密码：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<span id="sprypassword2"> <label
																							for="password2"></label> <input name="password1"
																							type="text" id="password2" size="25"
																							maxlength="16" /> <span
																						class="passwordRequiredMsg">需要输入一个值。</span><span
																						class="passwordMinCharsMsg">不符合最小字符数要求。</span><span
																						class="passwordMaxCharsMsg">已超过最大字符数。</span> </span>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					确认密码：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<span id="sprypassword3"> <label
																							for="password3"></label> <input name="password3"
																							type="text" id="password3" size="25"
																							maxlength="16" /> <span
																						class="passwordRequiredMsg">需要输入一个值。</span><span
																						class="passwordMinCharsMsg">不符合最小字符数要求。</span><span
																						class="passwordMaxCharsMsg">已超过最大字符数。</span> </span>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" colspan="2" align="right"
																					valign="middle">
																					<table width="100%" border="0" cellspacing="0"
																						cellpadding="0">
																						<tr>
																							<td width="28%" height="40" align="right"
																								valign="middle">
																								<label for="button3"></label>
																								<input type="submit" name="button3" id="button3"
																									value="确认修改" />
																							</td>
																							<td width="2%">
																								&nbsp;
																							</td>
																							<td width="70%">
																								&nbsp;
																							</td>
																						</tr>
																					</table>
																				</td>
																			</tr>
																		</table>
																		<p>
																			&nbsp;
																		</p>
																		<p>
																			&nbsp;
																		</p>
																		<p>
																			&nbsp;
																		</p>
																		<p>
																			&nbsp;
																		</p>
																		<p>
																			&nbsp;
																		</p>
																		<p>
																			&nbsp;
																		</p>
																	</form>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																</div>
																<div class="TabbedPanelsContent">
																	<div id="outer">
																		<div class="jcExample">
																		<form id="form3" name="form3" method="post" action="member!update.do">
																			<div class="article">																		

																				<table border="0" cellspacing="0" cellpadding="5">
																					<tr>
																						<font color="red">由于部分浏览器安全性限制，无法使用本地上传预览功能，请在提交后再使用头像编辑功能
																							！</font>
																					</tr>
																					<tr>
																						<td>
																							<input name="file" type="file" id="pic"
																								onchange="javascript:showimg(this);">
																						</td>
																					</tr>
																				</table>
																				<img src="images/member/${member.id}.jpg"
																					id="cropbox" name="cropbox"
																					onload="AutoResizeImage(600,600,this)" />
																				<div id="newPreview"></div>

																				<!-- 起始X坐标 -->
																				<input type="hidden" size="4" id="x"
																					name="cutPara.x" value="0" />
																				<!-- 起始Y坐标 -->
																				<input type="hidden" size="4" id="y"
																					name="cutPara.y" value="0" />
																				<!-- 终止X坐标 -->
																				<input type="hidden" size="4" id="x2" name="x2"
																					value="0" />
																				<!-- 终止Y坐标 -->
																				<input type="hidden" size="4" id="y2" name="y2"
																					value="0" />
																				<!-- 宽 -->
																				<input type="hidden" size="4" id="w"
																					name="cutPara.w" value="0" />
																				<!-- 高-->
																				<input type="hidden" size="4" id="h" name="h"
																					value="0" />
																				<!-- 缩放比例-->
																				<input type="hidden" size="4" id="rate"
																					name="cutPara.rate" value="" />
																			</div>
																			</form>
																		</div>
																	</div>
																</div>
																<div class="TabbedPanelsContent">
																	<form id="form4" name="form5" method="post" action="member!update.do">
																		<table width="100%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td height="40" colspan="2" align="left"
																					valign="bottom">
																					添加教育信息：
																				</td>
																			</tr>
																			<tr>
																				<td height="15" colspan="2" align="left"
																					valign="middle">
																					<hr width="90%" size="1" />
																				</td>
																			</tr>
																			<tr>
																				<td width="21%" height="40" align="right"
																					valign="middle">
																					学校类型：
																				</td>
																				<td width="79%" height="40" align="left"
																					valign="middle">
																					<label for="select2"></label>
																					<select name="select2" id="select2">
																						<option value="大学">
																							大学
																						</option>
																						<option value="高中">
																							高中
																						</option>
																						<option value="中专">
																							中专
																						</option>
																						<option value="初中">
																							初中
																						</option>
																						<option value="小学">
																							小学
																						</option>
																					</select>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					学校名称：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<label for="textfield4"></label>
																					<label for="textfield5"></label>
																					<input name="textfield3" type="text"
																						id="textfield5" size="25" />
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					院系：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<label for="textfield6"></label>
																					<input name="textfield4" type="text"
																						id="textfield6" size="25" />
																				</td>
																			</tr>
																			<tr>
																				<td height="40" align="right" valign="middle">
																					入学年份：
																				</td>
																				<td height="40" align="left" valign="middle">
																					<label for="select3"></label>
																					<select name="select3" id="select3">
																						<option value="2011">
																							2011
																						</option>
																						<option value="2010">
																							2010
																						</option>
																						<option value="2009">
																							2009
																						</option>
																						<option value="2008">
																							2008
																						</option>
																						<option value="2007">
																							2007
																						</option>
																						<option value="2006">
																							2006
																						</option>
																						<option value="2005">
																							2005
																						</option>
																						<option value="2004">
																							2004
																						</option>
																						<option value="2003">
																							2003
																						</option>
																						<option value="2002">
																							2002
																						</option>
																						<option value="2001">
																							2001
																						</option>
																						<option value="2000">
																							2000
																						</option>
																						<option value="1999">
																							1999
																						</option>
																						<option value="1998">
																							1998
																						</option>
																						<option value="1997">
																							1997
																						</option>
																						<option value="1996">
																							1996
																						</option>
																						<option value="1995">
																							1995
																						</option>
																						<option value="1994">
																							1994
																						</option>
																						<option value="1993">
																							1993
																						</option>
																						<option value="1992">
																							1992
																						</option>
																						<option value="1991">
																							1991
																						</option>
																						<option value="1990">
																							1990
																						</option>
																						<option value="1989">
																							1989
																						</option>
																						<option value="1988">
																							1988
																						</option>
																						<option value="1987">
																							1987
																						</option>
																						<option value="1986">
																							1986
																						</option>
																						<option value="1985">
																							1985
																						</option>
																						<option value="1984">
																							1984
																						</option>
																						<option value="1983">
																							1983
																						</option>
																						<option value="1982">
																							1982
																						</option>
																						<option value="1981">
																							1981
																						</option>
																						<option value="1980">
																							1980
																						</option>
																					</select>
																				</td>
																			</tr>
																			<tr>
																				<td height="40" colspan="2" align="right"
																					valign="middle">
																					<table width="100%" border="0" cellspacing="0"
																						cellpadding="0">
																						<tr>
																							<td width="33%" height="39" align="right"
																								valign="middle">
																								<label for="button4"></label>
																								<input type="submit" name="button4" id="button4"
																									value="保存" />
																							</td>
																							<td width="67%">
																								&nbsp;
																							</td>
																						</tr>
																					</table>
																				</td>
																			</tr>
																		</table>
																		<p>
																			&nbsp;
																		</p>
																		<p>
																			&nbsp;
																		</p>
																		<p>
																			&nbsp;
																		</p>
																		<p>
																			&nbsp;
																		</p>
																		<p>
																			&nbsp;
																		</p>
																	</form>
																</div>
																<div class="TabbedPanelsContent">
																	<table width="100%" border="0" cellspacing="0"
																		cellpadding="0">
																		<tr>
																			<td height="46" align="center" valign="top">
																				<img src="images/A3.jpg" width="755" height="80" />
																			</td>
																		</tr>
																		<tr>
																			<td height="203" align="center" valign="top">
																				<form id="form5" name="form5" method="post"
																					action="member!update.do">
																					<table width="100%" border="0" cellspacing="0"
																						cellpadding="0">
																						<tr>
																							<td width="42%" height="40" align="right"
																								valign="bottom">
																								手机号：
																							</td>
																							<td width="58%" height="41" align="left"
																								valign="bottom">
																								<span id="sprytextfield7"> <label
																										for="text7"></label> <input type="text"
																										name="phone" id="text7"
																										value="${member.phone}" /> <span
																									class="textfieldRequiredMsg">需要提供一个值。</span><span
																									class="textfieldInvalidFormatMsg">格式无效。</span><span
																									class="textfieldMaxCharsMsg">已超过最大字符数。</span><span
																									class="textfieldMinCharsMsg">不符合最小字符数要求。</span>
																								</span>
																							</td>
																						</tr>
																						<tr>
																							<td height="40" colspan="2" align="center"
																								valign="middle">
																								<h5>
																									<input type="checkbox" name="checkbox"
																										id="checkbox" />
																									<label for="checkbox">
																										我已阅读并同意《
																										<a href="#">XXX手机增值条款》</a>
																									</label>
																								</h5>
																								<h5>
																									<label for="checkbox"></label>
																								</h5>
																							</td>
																						</tr>
																						<tr>
																							<td height="40" align="right" valign="middle">
																								&nbsp;
																							</td>
																							<td height="40" align="left" valign="middle">
																								<h5>
																									<label for="button5"></label>
																									<input type="submit" name="button5"
																										id="button5" value="绑定手机" />
																								</h5>
																							</td>
																						</tr>
																					</table>
																					<p>
																						&nbsp;
																					</p>
																					<p>
																						&nbsp;
																					</p>
																					<p>
																						&nbsp;
																					</p>
																					<p>
																						&nbsp;
																					</p>
																					<p>
																						&nbsp;
																					</p>
																					<p>
																						&nbsp;
																					</p>
																					<p>
																						&nbsp;
																					</p>
																					<p>
																						&nbsp;
																					</p>
																				</form>
																			</td>
																		</tr>
																	</table>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																</div>
																<div class="TabbedPanelsContent">
																	<h5>
																		内容 7
																	</h5>
																</div>
																<div class="TabbedPanelsContent">
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																	<p>
																		&nbsp;
																	</p>
																</div>
															</div>
														</div>
														<p>
															&nbsp;
														</p>
														<p>
															&nbsp;
														</p>
														<p>
															&nbsp;
														</p>
														<p>
															&nbsp;
														</p>
													</td>
												</tr>
											</table>
										</td>
										<td width="14%" valign="top">
											&nbsp;
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="100" valign="top">
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<h5>
			<script type="text/javascript">
	var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
	var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1",
			"none", {
				minChars : 4,
				maxChars : 16,
				isRequired : false
			});
	var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2",
			"none", {
				isRequired : false
			});
	var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3",
			"integer", {
				isRequired : false
			});
	var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4",
			"email", {
				isRequired : false
			});
	var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5",
			"none", {
				minChars : 4,
				maxChars : 16,
				isRequired : false
			});
	var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6");
	var sprypassword1 = new Spry.Widget.ValidationPassword("sprypassword1", {
		minChars : 4,
		maxChars : 16
	});
	var sprypassword2 = new Spry.Widget.ValidationPassword("sprypassword2", {
		minChars : 4,
		maxChars : 16
	});
	var sprypassword3 = new Spry.Widget.ValidationPassword("sprypassword3", {
		minChars : 4,
		maxChars : 16
	});
	var sprytextfield7 = new Spry.Widget.ValidationTextField("sprytextfield7",
			"integer", {
				maxChars : 11,
				minChars : 11
			});
	//-->
</script>
		</h5>
	</body>
</html>
