<!-- 提示页面 -->
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
#yangshi4 a{
  color:blue;
  
}
#yangshi4 a:hover{
  color:red;
text-decoration:underline;
}
</style>

<title>提示信息</title>
<%
String tishi=(String)session.getAttribute("404"); 
 %>
</head>

<body>
	<jsp:include page="manageTop.jsp" />
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
						<td><div><center>
							<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
							<div  style="font-size:30px"><strong><%=tishi %></strong></div><br/>
                      <div id="yangshi4" style="font-size:20px"><a href="<%=session.getAttribute("THIS") %>">返回上一页</a>&nbsp;&nbsp;
                       <a href="manage_index.jsp">返回首页</a></div> <br/>
					</center></div></td>
					</tr>
				</table></td>
		</tr>
	</table>
	<div align="center">
		<iframe src="manageBottom.jsp" width="1050"
			height="100" marginheight="0" marginwidth="0" frameborder="0"
			scrolling="no"></iframe>

	</div>
</body>
</html>
