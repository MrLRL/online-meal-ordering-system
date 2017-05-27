<!-- 找回密码（作者：周华） -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>找回密码</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script type="text/javascript"  src="../JS/regist.js" charset="gb2312"></script>
	<link href="../css/css.css" rel="stylesheet" type="text/css">
  </head>
  <body>
	<jsp:include page="../includeFile/shippingTop.jsp"></jsp:include>
  <%
    session.setAttribute("THIS", "user/regetpass.jsp");
  request.setCharacterEncoding("utf-8");
  %>
  	<center>
  	<br>
  	<form action="../do/doZhaohui.jsp" method="post" name="passform">
  	<table width="420" align="center">
  	<tr>
					<td width="70" height="38">用&nbsp;户&nbsp;名&nbsp;</td>
					<td  width="160">
						<input id="name" name="person.user_name" type="text" onBlur="checkName()">
					</td>
					<td>
						<div align="left">
						<span id="username">*</span>
						</div>
					</td>
				</tr>
				<tr>
					<td width="70" height="38">真实姓名</td>
					<td width="160">
						<input id="realname" name="person.user_realname" type="text" onBlur="checkRealName()">
					</td>
					<td>
						<div align="left"><span id="rname">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="38">邮&nbsp;&nbsp;箱</td>
					<td>
						<input id="email" name="person.user_mail" type="text" onBlur="checkMail()">	
					</td>
					<td>
						<div align="left"><span id="mail">*</span></div>
					</td>
				</tr>
				<tr height="35"><td colspan="3" style="color:green;font-size:20px" align="center">请输入以上信息验证您的身份</td></tr>
				<tr align="center"><td></td>
					<td>
						<input name="okSub" value="确定" type="submit">&nbsp;&nbsp;
						<input name="" value="重置" type="reset">
						<br>				
					</td>
				</tr>
			</table>
	
  	</form>
  	</center>
  		<br><br>
		<div align="center">
		<iframe src="../includeFile/shippingBottom.jsp" width="1050"
			height="100" marginheight="0" marginwidth="0" frameborder="0"
			scrolling="no"></iframe>

	</div>
  </body>
</html>
