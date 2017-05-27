<!-- 登录页面（作者：周华） -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
.style21 {
	font-weight: bold
}
-->
</style>
<style type="text/css">
<!--
.STYLE22 {
	color: #FF0000
}
-->
</style>
<script type="text/javascript"  src="../JS/regist.js" charset="gb2312">
</script>
<title>快乐订餐 欢迎你的到来</title>
</head>
<body>
	<jsp:include page="../includeFile/shippingTop.jsp" />
	<table width="955" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>
		
		<tr>
			<td height="8"></td>
		</tr>
		<tr>
			<td height="400" valign="top">
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="25">
							<div align="center">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="1%">&nbsp;</td>
										<td width="65%"><img src="../images/lc01.gif" width="599"
											height="49">
										</td>
										<td width="34%" valign="bottom">&nbsp;</td>
									</tr>
								</table>
							</div></td>
					</tr>
					<tr>
						<td height="1" bgcolor="#E9E9E9"></td>
					</tr>
					<tr>
						<td height="12" background="../images/xian.gif"></td>
					</tr>
					<tr>
						<td>
	<form action="../do/doDenglu.jsp" method="post" name="mainForm" onsubmit="return denglu()">
						<br><br><div style="font-size:35px;font-weight:bold;" align="center">用户登录</div>
		    <br><table align="right" width="700">
		    <tr height="40"><td style="font-size:20px" align="right" width="150">用户名</td><td align="center" width="150">
			<input  name="person.user_name" id="name" type="text" onblur="checkName()" ></td><td align="left" width="400"> <span id="username">*</span></td></tr> 
			<tr height="40"><td style="font-size:20px" align="right" width="150"> 密&nbsp;码</td><td align="center" width="150">
			<input  type="password" name="person.user_pass" id="pass" onblur="checkPass()"></td><td align="left" width="150"> <span id="password">*</span></td></tr> 
			<tr height="40"><td></td><td style="font-size:20px" align="center">
			<input type="radio" name="person.user_flag" value="1" checked="checked">用户
			<input type="radio" name="person.user_flag" value="0">管理员 </td></tr> 
			<tr height="40"><td></td><td align="center"><input type="submit" value="登录"/>&nbsp;&nbsp;
			<input type="reset" value="取消">&nbsp;</td></tr> 
			<tr><td></td><td align="center"><%if(session.getAttribute("CUO")!=null){ %>
			<span style="color:red;" id="cuowu"><%=session.getAttribute("CUO") %></span>
			<% session.setAttribute("CUO",null); } %></td></tr> 
		</table>
	</form></td>
					</tr>
				</table></td>
		</tr>
	</table>
	<div align="center">
		<iframe src="../includeFile/shippingBottom.jsp" width="1050"
			height="100" marginheight="0" marginwidth="0" frameborder="0"
			scrolling="no"></iframe>
	</div>
</body>
</html>
