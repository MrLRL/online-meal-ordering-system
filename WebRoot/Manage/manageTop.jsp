<!-- 后台页面头部分 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" import="entity.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
<!--
.style21 {
	font-weight: bold
}
-->
</style>
<link href="../css/order_style.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript">
	function getTime() {
		document.getElementById("getTime").innerHTML = new Date()
				.toLocaleString();
		setTimeout("getTime()", 1000);
	}
</script>
</head>
<body onLoad="getTime()">

<table width="955" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="203" align="center" valign="bottom">
<%
//判断管理员是否已经登录
if(session.getAttribute("GUANLI")!=null){
//获得管理员信息
AdminInfo admin=(AdminInfo)session.getAttribute("GUANLI");
 %>管理员：<%=admin.getPetName() %><%} %><br><br>
			<span id="getTime"></span>
			</td>
			<td width="752" valign="bottom"><img
				src="manage_top.png" border="0" usemap="#Map">
			</td>
		</tr>
	</table>

	<map name="Map">
		<area shape="rect" coords="23,8,119,43" href="manage_index.jsp">
		<area shape="rect" coords="162,9,261,43"
			href="orderMange/orderMain.jsp">
		<area shape="rect" coords="294,9,415,43"
			href="caidan_manage/caidan_index.jsp">
		<area shape="rect" coords="469,9,563,42"
			href="userManage/usermanage_index.jsp">
		<area shape="rect" coords="626,10,717,42"
		    href="note_manage/manage.jsp">
	</map>
	<table width="1050" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="1050" height="10"></td>
		</tr>
		<tr>
			<td height="3" bgcolor="#F7942C"></td>
		</tr>
		</table>
</body>
</html>