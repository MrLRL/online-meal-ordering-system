<!-- 后台管理首页 (作者：徐辉)-->
<%@ page language="java" contentType="text/html; charset=utf-8" import="entity.*"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 

"http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="../CSS/manage.css" rel="stylesheet" type="text/css">
<link href="../css/order_style.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>快乐订餐 欢迎你的到来</title>
</head>
<%
//保存当前页面信息
   session.setAttribute("THIS", "Manage/manage_index.jsp");
//判断管理员是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("GUANLI")==null){
response.sendRedirect("../Book/shipping_Step1.jsp");
return;
}
%>
<body >
	<jsp:include page="manageTop.jsp"/>

	<table width="1050" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="8"></td>
		</tr>
		<tr>
			<td width="1050" align="center" valign="top">
			<iframe src="manage_firstShow.jsp" width="1050"
					height="500" marginheight="0" marginwidth="0" frameborder="0"
					scrolling="no"></iframe>
			</td>
		</tr>
	</table>
	<jsp:include page="orderMange/manageBottom.jsp"></jsp:include>
</body>
</html>
