<!-- 提示页面（作者：周华） -->
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
a:hover{
    color:red;
}
</style>

<title>提示信息</title>
<%
String tishi=(String)session.getAttribute("CART"); 
 %>
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
						<td><div class="divworm"><center>
							<br/><br/><br/><br/><br/>
							<h1><%=tishi %></h1> <br/>     
       <a href="../<%=session.getAttribute("THIS") %>">点击返回商品详情页</a>&nbsp;
       <a href="../Book/shipping_Step2.jsp">点击进入购物车</a><br/>
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
