<!-- 提示页面（作者：周华） -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*,dao.*,entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
.style21 {
	font-weight: bold
}
#lianjie a:hover{
color:#F00;
text-decoration:underline;
}
#lianjie a{
color:#00F;
text-decoration:none;
}
-->
</style>

<style type="text/css">
<!--
.STYLE22 {
	color: #FF0000
}
-->
a:hover{
    color:red;
}
</style>

<title>提示信息</title>
</head>
<body>
	<jsp:include page="../includeFile/shippingTop.jsp" />
	<table width="955" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>
		
		
		<tr>
			<td height="400" valign="top">
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					
					<tr>
						<td height="12" background="images/xian.gif"></td>
					</tr>
					<tr>
						<td id="lianjie"><div class="divworm"><center>
							<br/><br/><br/><br/><br/>
							<h1><%=session.getAttribute("404") %></h1>
                       <a href="../user/message.jsp">返回用户中心</a>&nbsp;
                       <a href="../index.jsp">返回首页</a>&nbsp;<br/>
					</center></div></td>
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
