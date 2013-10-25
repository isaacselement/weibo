<%@ page language="java" contentType="text/html; charset=utf-8" import="com.eleyuan.bean.*,java.util.Date,java.text.DateFormat"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/3-2-1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>私信</title>
<!-- InstanceEndEditable -->
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	left:863px;
	top:116px;
	width:173px;
	height:31px;
	z-index:1;
}
-->
</style>
<script type="text/javascript">
<!--
function logout(){
	if(confirm("确认要退出系统吗？")){
		parent.location.href="logout.do";
	}
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<!-- InstanceBeginEditable name="head" -->
<script src="SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css" />
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('images/button(3).jpg','images/button(8).jpg','images/button(2)-2.gif','images/button(6).gif','images/button(7).gif','images/button(4).gif','images/button(5).gif')">
<% 
Member member = (Member) session.getAttribute("member");
String username=member.getUsername();
Date dateTime=new Date();
DateFormat df2 = DateFormat.getDateTimeInstance(); 
String time=df2.format(dateTime);
%>
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" background="images/1260X2000.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="130" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" colspan="10" bgcolor="#CCCCCC"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="165" height="30">&nbsp;</td>
                <td width="554" height="30" align="left" valign="middle">您好！欢迎来到XX微博.</td>
                <td width="160" height="30" align="center" valign="middle"><a href="posttopic!listPosttopicAll.do"><%=username%></a></td>
                <td width="81" height="30" align="center" valign="middle"><a href="member!init.do">帐号设置</a></td>
                <td width="2" height="30"><img src="images/1X30.jpg" width="1" height="30" /></td>
                <td width="57" height="30" align="center" valign="middle"><a href="javascript:logout()"><span class="item">退出</span></a></td>
                <td width="165" height="30">&nbsp;</td>
              </tr>
            </table></td>
            </tr>
          <tr>
            <td width="168">&nbsp;</td>
            <td width="261">&nbsp;</td>
            <td height="100" colspan="7" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="44" colspan="7">&nbsp;</td>
              </tr>
              <tr>
                <td width="34" height="36" align="center" valign="bottom" bgcolor="#CCCCFF">&nbsp;</td>
                <td width="84" align="center" valign="middle" bgcolor="#CCCCFF"><a href="list!listPosttopic.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','images/button(6).gif',1)"><img src="images/button(2).gif" name="Image2" width="84" height="22" border="0" id="Image2" /></a></td>
                <td width="84" align="center" valign="middle" bgcolor="#CCCCFF"><a href="posttopic!listPosttopicAll.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','images/button(7).gif',1)"><img src="images/button(3).gif" name="Image3" width="84" height="22" border="0" id="Image3" /></a></td>
                <td width="84" align="center" valign="middle" bgcolor="#CCCCFF"><a href="space/friend.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','images/button(4).gif',1)"><img src="images/button(8).gif" name="Image4" width="84" height="22" border="0" id="Image4" /></a></td>
                <td width="84" align="center" valign="middle" bgcolor="#CCCCFF"><a href="list!listMessage.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','images/button(5).gif',1)"><img src="images/button(1).gif" name="Image5" width="84" height="22" border="0" id="Image5" /></a></td>
                <td colspan="2" align="center" valign="middle" bgcolor="#CCCCFF"><form id="form1" name="form1" method="post" action="">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="83%" align="right" valign="middle"><label for="textfield"></label>
                        <input type="text" name="textfield" id="textfield" /></td>
                      <td width="17%" align="left" valign="middle"><label for="button"></label>
                        <input type="submit" name="button" id="button" value="搜索" /></td>
                    </tr>
                  </table>
                </form></td>
                </tr>
              <tr>
                <td height="10" colspan="7">&nbsp;</td>
                </tr>
            </table></td>
            <td width="168">&nbsp;</td>
          </tr>
          </table></td>
      </tr>
      <tr>
        <td height="419" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="14%" height="419" valign="top"></td>
            <td width="72%" valign="top"><!-- InstanceBeginEditable name="EditRegion3" -->
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="36" colspan="2" align="left" valign="middle"><h2>私信&raquo;</h2></td>
                    </tr>
                    
                    
      
      
                    
<tr>
       <td height="200" colspan="2">
               <form name="form1" id="messageForm" method="post" action="message!add.do"> 
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td align="center" valign="top"><hr width="100%" size="1" /></td>
                          </tr>
                        <tr>
                          <td height="40" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="24%" height="40" align="right" valign="bottom">发送私信给：</td>
                              <td width="35%" align="left" valign="bottom"><label for="textfield"></label>
                                <input name="reciever" type="text" id="textfield" size="25" maxlength="16" /></td>
                              <td width="41%" align="left" valign="bottom">最多140字</td>
                            </tr>
                          </table></td>
                          </tr>
                        <tr>
                          <td height="120"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="11%" height="100">&nbsp;</td>
                              <td width="60%" align="center" valign="top"><span id="sprytextarea1">
                              <label for="textarea1"></label>
                              <textarea name="content" id="textarea1" cols="60" rows="7"></textarea>
                              <span class="textareaMaxCharsMsg">已超过最大字符数。</span><br />
                              <span class="textareaMinCharsMsg">不符合最小字符数要求。</span></span></td>
                              <td width="29%">&nbsp;</td>
                            </tr>
                          </table></td>
                          </tr>
                        <tr>
                          <td height="40"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="63%" height="40">&nbsp;</td>
                              <td width="37%" align="left" valign="middle">
                              <input type="hidden" name="time" value="<%=time %>"/>
                              <input type="hidden" name="username" value="<%=username %>"/>
                              <input type="submit" name="submit" id="button" value="发送" /></td>
                            </tr>
                          </table>
                            <label for="button"></label></td>
                          </tr>
                      </table>
               </form>
       </td>
</tr>






<tr>
      <td colspan="2" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="13%">&nbsp;</td>
                        <td width="71%"><div id="TabbedPanels1" class="TabbedPanels">
                          <ul class="TabbedPanelsTabGroup">
                            <li class="TabbedPanelsTab" tabindex="0">收件箱</li>
                            <li class="TabbedPanelsTab" tabindex="0">发件箱<br />
                            </li>
                          </ul>
                          <div class="TabbedPanelsContentGroup">
                            <div class="TabbedPanelsContent">
                              <iframe src="message!listMessageByReciever.do?pageModel.pageSize=6" height="800" width="100%"></iframe>
                            </div>
                            <div class="TabbedPanelsContent">
                            <%--<%
                              out.write("<script>location.href='<iframe src="message!listMessageByUsername.do?pageModel.pageSize=6" height="800" width="100%"></iframe>';</script>");
                            %>                          
                            --%>
                             <iframe src="message!listMessageByUsername.do?pageModel.pageSize=6" height="800" width="100%"></iframe>
                            </div>
                          </div>
                        </div></td>
                        <td width="16%">&nbsp;</td>
                      </tr>
                    </table>
                      <p>&nbsp;</p>
                      <p>&nbsp;</p>
                      <p>&nbsp;</p></td>
                  </tr>
                  </table>
              <script type="text/javascript">
<!--
var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1", {maxChars:280, validateOn:["blur"], minChars:1});
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
//-->
              </script>
            <!-- InstanceEndEditable --></td>
            <td width="14%" valign="top"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="100" valign="top"></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
