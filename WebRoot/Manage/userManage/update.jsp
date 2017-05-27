<!-- 修改用户界面 (作者：徐辉)-->
<!-- 页面已修改 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*,dao.*,entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户</title>
<link href="../../css/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript"  src="../../JS/regist.js" charset="gb2312"></script>

<script type="text/javascript">
function check1(){
	var uname = document.getElementById("username");
	var pass = document.getElementById("password");
	var repass = document.getElementById("repass");
	var realname = document.getElementById("rname");
	var petname = document.getElementById("pname");
	var transpass = document.getElementById("textTran");
	var mail = document.getElementById("mail");
	if(uname.innerHTML == "√"&&pass.innerHTML == "√"&&repass.innerHTML == "√"&&realname.innerHTML == "√"&&petname.innerHTML == "√"&&transpass.innerHTML == "√"&&mail.innerHTML == "√"){
	return true;
	}else{
	alert("请按规则填写注册信息！");
	return false;
	}
}
</script>
</head>
<% 
//保存当前页面信息
session.setAttribute("THIS", "userManage/usermanage_index.jsp");
  //获得当前商品的ID
  	String uId="1";
     //获得传递过来的参数uId
     if(request.getParameter("uId")!=null){
     	uId=request.getParameter("uId");
     } 
     //调用方法，根据传递过来的uId
     UsersDao dao=new UsersDao();
     UsersInfo info=dao.getUserById(uId);
    %>
<body>
<jsp:include page="../orderMange/manageTop.jsp"/>
	<div class="divworm"><center>
			<form action="../../do/doUpUsers.jsp" method="post" name="mainForm" onsubmit="return check()">
			<br><br><br>
			<table width="450" height="300">
				<tr height="40">
					<td width="70" height="35">用&nbsp;户&nbsp;名&nbsp;</td>
					<td  width="160">
						<input id="name" name="person.user_name" type="text" onBlur="checkName()" value="<%=info.getuName() %>">
					</td>
					<td width="">
						<div align="left"><span id="username">*请输入以非数字开头的6-16位，不能有中文</span></div>
					</td>
				</tr>
				<tr>
					<td height="35">密&nbsp;&nbsp;&nbsp;码</td>
					<td>
						<input type="password" id="pass" name="person.user_pass" onBlur="checkPass()" value="<%=info.getuPass() %>" />
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
					<td height="37">真实姓名</td>
					<td>
						<input id="realname" name="person.user_realname" value="<%=info.getuRealname() %>" type="text" onBlur="checkRealName()">
					</td>
					<td>
						<div align="left"><span id="rname">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="38">邮&nbsp;&nbsp;&nbsp;箱</td>
					<td>
						<input id="email" name="person.user_mail" value="<%=info.getuEmail() %>" type="text" onBlur="checkMail()">	
					</td>
					<td>
						<div align="left"><span id="mail">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="38">余&nbsp;&nbsp;&nbsp;额</td>
					<td>
						<input id="email" name="person.user_balance" value="<%=info.getuBalance() %>" type="text" onBlur="checkMail()">	
					</td>
					<td>
						<div align="left"><span id="mail">*</span></div>
					</td>
				</tr>
				<tr>
					<td>交易密码</td>
					<td>
					<input type="password" name="transPass" id="transPass" onBlur="checkTransPass()" value="<%=info.getuTransPass() %>" />			
					</td>
					<td>
						<div align="left"><span id="textTran">*</span></div>
					</td>
				</tr>
				<tr>
				<td>性&nbsp;&nbsp;&nbsp;别</td>
				 
					<td align="center">					
						<input name="person.user_sex" type="radio"  checked="checked" value="<%=info.getuSex() %>">男
						<input name="person.user_sex" type="radio"  value="<%=info.getuSex() %>">女				
					</td>
				</tr>
				<tr align="center"><td></td>
					<td>
						<input name="okSub" value="确定" type="submit"  >&nbsp;&nbsp;
						<input name="" value="重置" type="reset">	
						<input type="hidden" name="uId" value="<%=info.getuId() %>" />			
					</td><td align="left"><a href="usermanage_index.jsp"><img src="../../images/fanhui.gif" border="0"/></a></td>
				</tr>
			</table>
		</form></center>
		</div>
		<jsp:include page="../manageBottom.jsp"/>
</body>
</html>