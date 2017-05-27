<!-- 修改用户信息（作者：周华） -->
<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,dao.*,entity.*"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>修改用户信息</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script type="text/javascript"  src="../JS/regist.js" charset="gb2312"></script>
	<link href="../css/css.css" rel="stylesheet" type="text/css">
  </head>
  <%
//保存当前页面信息
   session.setAttribute("THIS", "user/xiugai.jsp");
//判断用户是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("../Book/shipping_Step1.jsp");
return;
}
//读取当前用户信息
UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
%>
  <body>
	<jsp:include page="../includeFile/shippingTop.jsp"></jsp:include>
  <%
  request.setCharacterEncoding("utf-8");
  %>
  	<center>
  	<br>
  	<form action="../do/doUpUser.jsp" method="post" name="passform" onsubmit="return check()">
  	<table width="550" height="300">
				<tr>
					<td width="70" height="35">&nbsp;用&nbsp;户&nbsp;名&nbsp;</td>
					<td  width="160">
						<input id="name" name="person.user_name" type="text" value="<%=user.getuName() %>" onBlur="checkName()">
					</td>
					<td width="">
						<div align="left"><span id="username">*</span></div>
					</td>
				</tr>
				
				<tr>
					<td height="35">密&nbsp;&nbsp;&nbsp;码</td>
					<td>
						<input id="pass" name="person.user_pass" type="password" value="<%=user.getuPass() %>" onBlur="checkPass()">
					</td>
					<td>
						<div align="left"><span id="password">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="35">确认密码</td>
					<td>
						<input id="checkpass" name="chpass" value="<%=user.getuPass() %>" type="password" onBlur="checkRepass()">					
					</td>
					<td>
						<div align="left"><span id="repass">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="37">真实姓名</td>
					<td>
						<input id="realname" name="person.user_realname" value="<%=user.getuRealname() %>" type="text" onBlur="checkRealName()">
					</td>
					<td>
						<div align="left"><span id="rname">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="37">昵&nbsp;&nbsp;&nbsp;称</td>
					<td>
						<input id="petname" name="person.user_petname" type="text" value="<%=user.getuPetname() %>" onBlur="checkPetName()">
					</td>
					<td>
						<div align="left"><span id="pname">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="38">邮&nbsp;&nbsp;&nbsp;&nbsp;箱</td>
					<td>
						<input id="email" name="person.user_mail" value="<%=user.getuEmail() %>" type="text" onBlur="checkMail()">	
					</td>
					<td>
						<div align="left"><span id="mail">*</span></div>
					</td>
				</tr>
				<tr>
      <td>交易密码:</td>
      <td><input name="transPass" id="transPass" maxlength="6" value="<%=user.getuTransPass() %>" type="password" onBlur="checkTransPass()" /></td>
      <td>
      <div align="left"><span id="textTran">*</span></div>
      </td>
    </tr>
				<tr>
					<td>性&nbsp;&nbsp;&nbsp;&nbsp;别</td>
					<td>
						<input name="person.user_sex" type="radio" checked="checked" value="男">男
						<input name="person.user_sex" type="radio" value="女">女				
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
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
