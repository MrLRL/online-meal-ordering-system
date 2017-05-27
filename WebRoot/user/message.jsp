<!-- 用户中心（作者：周华） -->
<%@ page language="java"  import="java.util.*,entity.*,dao.*"  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>会员管理中心</title>
<link href="../css/te.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#yangshi a:hover{
color:blue;
text-decoration:none;
}
#yangshi1 a{
color:blue;
text-decoration:none;
}
#yangshi1 a:hover{
color:red;
text-decoration:underline;
}
#yangshi2 a{
color:blue;
text-decoration:underline;
}
#yangshi2 a:hover{
color:red;
text-decoration:underline;
}
</style>
</head>
  <%
//保存当前页面信息
   session.setAttribute("THIS", "user/message.jsp");
//判断用户是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("../Book/shipping_Step1.jsp");
return;
}else{
UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
  HarvestsDao dao=new HarvestsDao(); 
  List<HarvestsInfo> list=dao.getHarvests(user.getuId());
%>
<body>

		<jsp:include page="../includeFile/shippingTop.jsp"></jsp:include>
		<br><div class="divworm"><center>
		<table width="700" border="0">
  <tr align="center">
    <td>用户名：<%=user.getuName() %></td>
    <td>昵称：<%=user.getuPetname() %></td>
    <td>邮箱：<%=user.getuEmail() %></td>
    <td width="150" rowspan="2" style="background-color:#FF9933;font-size:20px" id="yangshi"><strong><a href="xiugai.jsp" >修改账户信息</a></strong></td>
  </tr>
  <tr align="center">
    <td>真实姓名：<%=user.getuRealname() %></td>
    <td>性别：<%=user.getuSex() %></td>
    <td>余额：<%=Double.parseDouble(user.getuBalance()) %></td>
  </tr>
</table><br/><br/>
<table width="850" border="0">
  <tr>
    <td width="150" style="background-color:#FF9933;text-align:center;font-size:20px"><strong>收货信息</strong></td>
    <td colspan="3">&nbsp;</td>
  </tr>
 <%
  if(list.size()>0){
  for(int i=0;i<list.size();i++){
  HarvestsInfo info=list.get(i);
 %>
  <tr align="center">
  <td width="70" style="font-size:15px;">收货人姓名：<%=info.gethName() %></td>
  <td width="200" style="font-size:15px;">手机号码：<%=info.gethTel() %></td>
  <td width="500" style="font-size:15px;">配送地址：<%=info.gethAddress() %></td>
  <td width="80" style="font-size:15px;" id="yangshi1"><a href="upAddress.jsp?hId=<%=info.gethId() %>">修改</a>&nbsp;<a href="../do/doDeAddress.jsp?hId=<%=info.gethId() %>">删除</a></td>
  </tr><% }} %>
  <tr>
  <td colspan="4" id="yangshi2" style="font-size:20px;"><strong><a href="address.jsp">新增地址</a></strong></td>
  </tr>
  </table>
<% } %>
</center></div>
		<div align="center">
		<iframe src="../includeFile/shippingBottom.jsp" width="1050"
			height="100" marginheight="0" marginwidth="0" frameborder="0"
			scrolling="no"></iframe>

		</div>

</body>
</html>