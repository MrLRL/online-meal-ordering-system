<!-- 注册页面（作者：周华） -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312" %>
    <% request.setCharacterEncoding("utf-8");     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册</title>

<link href="../css/te.css" rel="stylesheet" type="text/css">

<script type="text/javascript"  src="../JS/regist.js" charset="gb2312">
</script>
</head>
<body>
	
		<jsp:include page="../includeFile/shippingTop.jsp"></jsp:include>
			<div class="divworm"><center>
			<form action="../do/doZhuce.jsp" method="post" name="mainForm" onsubmit="return check()">
			<br><br>
			<table width="600" height="350">
				<tr>
					<td width="70" height="35">&nbsp;用&nbsp;户&nbsp;名&nbsp;</td>
					<td  width="160">
						<input id="name" name="person.user_name" type="text" onBlur="checkName()">
					</td>
					<td height="50">
						<div align="left"><%if(request.getParameter("uName")==null){ %>
						<span id="username">*请输入以非数字开头的6-16位，不能有中文</span>
						<%}else{ %>
						<span id="username" style="color:red">×用户名已存在！</span>
						<%} %>
						</div>
					</td>
				</tr>
				<tr>
					<td height="35">密&nbsp;&nbsp;&nbsp;码</td>
					<td>
						<input id="pass" name="person.user_pass" type="password" onBlur="checkPass()">
					</td>
					<td>
						<div align="left"><span id="password">*请输入6-16位密码</span></div>
					</td>
				</tr>
				<tr>
					<td height="35">确认密码</td>
					<td>
						<input id="checkpass" name="chpass" type="password" onBlur="checkRepass()">					
					</td>
					<td>
						<div align="left"><span id="repass">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="37">昵&nbsp;&nbsp;&nbsp;称</td>
					<td>
						<input id="petname" name="person.user_petname" type="text" onBlur="checkPetName()">
					</td>
					<td>
						<div align="left"><span id="pname">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="37">真实姓名</td>
					<td>
						<input id="realname" name="person.user_realname" type="text" onBlur="checkRealName()">
					</td>
					<td>
						<div align="left"><span id="rname">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="38">邮&nbsp;&nbsp;&nbsp;&nbsp;箱</td>
					<td>
						<input id="email" name="person.user_mail" type="text" onBlur="checkMail()">	
					</td>
					<td>
						<div align="left"><%if(request.getParameter("uMail")==null){ %>
						<span id="mail">*</span>
						<%}else{ %>
						<span id="mail" style="color:red">×此邮箱已被注册！</span>
						<% } %></div>
					</td>
				</tr>
				<tr>
      <td>交易密码:</td>
      <td><input name="transPass" id="transPass" maxlength="6" type="password" onBlur="checkTransPass()" /></td>
      <td>
      <div align="left"><span id="textTran">*</span></div>
      </td>
    </tr>
				<tr>
					<td>性&nbsp;&nbsp;&nbsp;&nbsp;别</td>
					<td align="center">
						<input name="person.user_sex" type="radio" checked="checked" value="男">男
						<input name="person.user_sex" type="radio" value="女">女				
					</td>
				</tr>
				<tr align="center"><td></td>
					<td>
						<input name="okSub" value="注册" type="submit"   >&nbsp;&nbsp;
						<input name="" value="取消" type="reset">
						<br>					
					</td>
				</tr>
			</table>
		</form></center>
		</div>
		<div align="center">
		
		<iframe src="../includeFile/shippingBottom.jsp" width="1050"
			height="100" marginheight="0" marginwidth="0" frameborder="0"
			scrolling="no"></iframe>

		</div>
	<br><br>

</body>
</html>