<!-- 留言页面（作者：周华） -->
<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,entity.*,dao.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加留言</title>
<script language="javascript" src="../JS/addnote.js" type="text/javascript" charset="gb2312"></script>
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
#chakan a{
color:blue;
}
#chakan a:hover{
color:red;
text-decoration:underline;
}
</style>
</head>
<%
//保存当前页面信息
   session.setAttribute("THIS", "message/addnote.jsp");
//判断用户是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("../Book/shipping_Step1.jsp");
return;
}
  //获取用户相关信息
  UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
  %>
<body>
	<jsp:include page="../includeFile/shippingTop.jsp"></jsp:include>
    <br>
    <center><font size="5" >留言板</font></center>
    <table align="center"><tr><td align="right" width="400px" id="chakan"><a href="oneself.jsp">查看我的留言记录</a></td></tr></table>
    	
	<center>
	<form action="" method="post" name="mainForm">
		<table width="600px">
			<tr>
				<td width="60px">主题:</td>
  				<td align="left">
					<input id="subject" name="message.subject" type="text" onBlur="checkSubject()">
					<br>
				</td>
				<td>
					<span id="mgsubject"></span>
				</td>
			</tr>
			<tr>
				<td>作者:</td>
				<td align="left">					
					<input name="message.username" type="text" disabled="disabled" value="<%=user.getuPetname() %>"/>
				
				</td>
			</tr>
			<tr>
				<td>内容:</td>
				<td align="left">
					<textarea id="content" name="message.content" cols="50" rows="6"  onblur="checkContent()"></textarea>
				
				</td>
				<td>
					<span id="mgcontent"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><br><br>
		      <input name="" type="submit" value="提交" onClick="getSub()">
				</td>
		  </tr>
		</table>
	</form>
	</center>
	<div align="center">
	<br><br><br><br><br><br><br><br>
		<iframe src="../includeFile/shippingBottom.jsp" width="1050"
					height="100" marginheight="0" marginwidth="0" frameborder="0"
					scrolling="no"></iframe>

</div>
</body>
</html>