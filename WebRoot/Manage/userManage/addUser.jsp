<!-- 添加用户界面 (作者：徐辉)-->
<!-- 页面已修改 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../../css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../orderMange/manageTop.jsp"/>
	<div class="divworm"><center>
			<form action="../../do/doAddUser.jsp" method="post" name="mainForm" onsubmit="return check()">
			<br><br><br>
			<table width="450" height="300">
				<tr height="40">
					<td width="70" height="35">用&nbsp;户&nbsp;名&nbsp;</td>
					<td  width="160">
						<input id="name" name="person.user_name" type="text" onBlur="checkName()">
					</td>
					<td width="">
						<div align="left"><span id="username">*请输入以非数字开头的6-16位，不能有中文</span></div>
					</td>
				</tr>
				<tr>
					<td height="35">密&nbsp;&nbsp;&nbsp;码</td>
					<td>
						<input type="password" id="pass" name="person.user_pass" onBlur="checkPass()"  />
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
						<input id="realname" name="person.user_realname" type="text" onBlur="checkRealName()">
					</td>
					<td>
						<div align="left"><span id="rname">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="38">邮&nbsp;&nbsp;&nbsp;箱</td>
					<td>
						<input id="email" name="person.user_mail" type="text" onBlur="checkMail()">	
					</td>
					<td>
						<div align="left"><span id="mail">*</span></div>
					</td>
				</tr>
				<tr>
					<td>交易密码</td>
					<td>
					<input type="password" name="transPass" id="transPass" onBlur="checkTransPass()" />			
					</td>
					<td>
						<div align="left"><span id="textTran">*</span></div>
					</td>
				</tr>
				<tr>
				<td>性&nbsp;&nbsp;&nbsp;别</td>		
					<td align="center">					
						<input name="person.user_sex" type="radio"  checked="checked" value="男">男
						<input name="person.user_sex" type="radio"  value="女">女				
					</td>
				</tr>
				<tr align="center"><td></td>
					<td>
						<input name="okSub" value="提交" type="submit" >&nbsp;&nbsp;
						<input name="" value="重置" type="reset">				
					</td><td align="left"><a href="usermanage_index.jsp"><img src="../../images/fanhui.gif" border="0"/></a></td>
				</tr>
			</table>
		</form></center>
		</div>
		<jsp:include page="../manageBottom.jsp"/>
</body>
</html>