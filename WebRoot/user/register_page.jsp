<!-- ע��ҳ�棨���ߣ��ܻ��� -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312" %>
    <% request.setCharacterEncoding("utf-8");     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>�û�ע��</title>

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
					<td width="70" height="35">&nbsp;��&nbsp;��&nbsp;��&nbsp;</td>
					<td  width="160">
						<input id="name" name="person.user_name" type="text" onBlur="checkName()">
					</td>
					<td height="50">
						<div align="left"><%if(request.getParameter("uName")==null){ %>
						<span id="username">*�������Է����ֿ�ͷ��6-16λ������������</span>
						<%}else{ %>
						<span id="username" style="color:red">���û����Ѵ��ڣ�</span>
						<%} %>
						</div>
					</td>
				</tr>
				<tr>
					<td height="35">��&nbsp;&nbsp;&nbsp;��</td>
					<td>
						<input id="pass" name="person.user_pass" type="password" onBlur="checkPass()">
					</td>
					<td>
						<div align="left"><span id="password">*������6-16λ����</span></div>
					</td>
				</tr>
				<tr>
					<td height="35">ȷ������</td>
					<td>
						<input id="checkpass" name="chpass" type="password" onBlur="checkRepass()">					
					</td>
					<td>
						<div align="left"><span id="repass">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="37">��&nbsp;&nbsp;&nbsp;��</td>
					<td>
						<input id="petname" name="person.user_petname" type="text" onBlur="checkPetName()">
					</td>
					<td>
						<div align="left"><span id="pname">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="37">��ʵ����</td>
					<td>
						<input id="realname" name="person.user_realname" type="text" onBlur="checkRealName()">
					</td>
					<td>
						<div align="left"><span id="rname">*</span></div>
					</td>
				</tr>
				<tr>
					<td height="38">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
					<td>
						<input id="email" name="person.user_mail" type="text" onBlur="checkMail()">	
					</td>
					<td>
						<div align="left"><%if(request.getParameter("uMail")==null){ %>
						<span id="mail">*</span>
						<%}else{ %>
						<span id="mail" style="color:red">���������ѱ�ע�ᣡ</span>
						<% } %></div>
					</td>
				</tr>
				<tr>
      <td>��������:</td>
      <td><input name="transPass" id="transPass" maxlength="6" type="password" onBlur="checkTransPass()" /></td>
      <td>
      <div align="left"><span id="textTran">*</span></div>
      </td>
    </tr>
				<tr>
					<td>��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
					<td align="center">
						<input name="person.user_sex" type="radio" checked="checked" value="��">��
						<input name="person.user_sex" type="radio" value="Ů">Ů				
					</td>
				</tr>
				<tr align="center"><td></td>
					<td>
						<input name="okSub" value="ע��" type="submit"   >&nbsp;&nbsp;
						<input name="" value="ȡ��" type="reset">
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