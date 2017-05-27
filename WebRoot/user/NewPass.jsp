<!-- 新密码（作者：周华） -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>找回密码</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script type="text/javascript"  src="../JS/regist.js" charset="gb2312">
	</script>
	<script type="text/javascript">
		function newpass() {
			//密码验证
	var pass = document.getElementById("pass").value;
	var pass2=document.getElementById("pass");
	textBox = document.getElementById("password");
	if(pass==""){
		textBox.innerHTML = "×密码不能为空！";
		textBox.style.color = "red";
		pass2.focus();
		return false;
	
	}else if(pass.length < 6 || pass.length > 16){
		textBox.innerHTML = "×密码长度须在6-16之间！";
		textBox.style.color = "red";
		pass2.focus();
		return false;
	}
	//确认密码验证
	var repass = document.getElementById("checkpass").value;
	var repass2 = document.getElementById("checkpass");
	textBox = document.getElementById("repass");
	if(repass==""){
		textBox.innerHTML = "×重复密码不能为空！";
		textBox.style.color = "red";
		repass2.focus();
		return false;
	
}else if(pass!=repass){
		textBox.innerHTML = "×两次输入的密码不一致！";
		textBox.style.color = "red";
		repass2.focus();
		return false;
	}
	return true;
}
</script>
	<link href="../css/css.css" rel="stylesheet" type="text/css">
  </head>
  <body>
	<jsp:include page="../includeFile/shippingTop.jsp"></jsp:include>
  <%
    request.setCharacterEncoding("UTF-8");//设置字符编码
    String name=request.getParameter("uName");//获得用户名
  %>
  	<center>
  	<br>
  	<form action="../do/doNewPass.jsp" method="post" name="passform" onsubmit="return newpass()">
  	<table width="420" align="center">
				<tr>
					<td width="70" height="37">新密码</td>
					<td width="160">
						<input id="pass" name="person.user_pass" type="password" onBlur="checkPass()">
					</td>
					<td>
						<div align="left"><span id="password">*请输入新密码</span></div>
					</td>
				</tr>
				<tr>
					<td height="38">确认密码</td>
					<td>
						<input id="checkpass" name="chpass" type="password" onBlur="checkRepass()">	
					</td>
					<td>
						<div align="left"><span id="repass">*</span></div>
					</td>
				</tr>
				<tr align="center"><td><input type="hidden" name="uName" value="<%=name %>"></td>
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
