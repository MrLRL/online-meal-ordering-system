<!-- 用户查看订单页面（作者：周华） -->
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,dao.*,entity.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单查询</title>
<link href="../css/te.css" rel="stylesheet" type="text/css">
<style type="text/css">
.tr_sty {
	background-color:#FF9933;
}

.tr_sty0 {
	background-color:#FFCC66;
}
#caozuo a{
color:blue;
}
#caozuo a:hover{
color:red;
text-decoration:underline;
}
</style>
</head>
<%
//保存当前页面信息
   session.setAttribute("THIS", "order/queryOrder.jsp");
//判断用户是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("../Book/shipping_Step1.jsp");
return;
}
  //获取用户相关信息
  UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
    DetailDao dao=new DetailDao();
  int pIndex=1;//当前页数
	if(request.getParameter("pages")!=null){
	pIndex=Integer.parseInt(request.getParameter("pages"));
	}
	//调用查询方法
  List<DingdansInfo> list=dao.getDingdan(pIndex, user.getuId());
  %>
<body>
<jsp:include page="../includeFile/shippingTop.jsp" />
<br><br><div class="divworm">
			<table  border="0" align="center">
			<tr class="tr_sty" align="center">
			  <td width="33">序号</td>
			  <td width="100">菜名</td>
			  <td width="33">份额</td>
			  <td width="51">单价</td>
			  <td width="51">总价</td>
			  <td width="100">电话</td>
			  <td width="200">送餐地址</td>
			  <td width="100">下单时间</td>
			  <td width="100">备注</td>
			  <td width="60">订单状态</td>
			  <td width="100">操作</td>
			 </tr>
		<%if(list!=null){ 
		DetailsInfo info2=null;
		for(int i=0;i<list.size();i++){
		DingdansInfo info=list.get(i);//循环查询订单
		List<DetailsInfo> list2=dao.getDetail(info.getdId());//查询对应订单详情
		%>
			 <tr class="tr_sty0">
			  <td width="33"><%=i+1 %></td>
			  <td width="100"><%
		for(int j=0;j<list2.size();j++){ 
		info2=list2.get(j);%>
		<%=info2.getgName() %><br/>
		<%} %></td>
			  <td width="33"><%
		for(int j=0;j<list2.size();j++){ 
		info2=list2.get(j);%>
		<%=info2.getgCount() %><br/>
		<%} %></td>
			  <td width="51"><%
		for(int j=0;j<list2.size();j++){ 
		info2=list2.get(j);%>
		<%=Double.parseDouble(info2.getgPrice()) %><br/>
		<%} %></td>
			  <td width="51"><%=Double.parseDouble(info.getdPrice()) %></td>
			  <td width="100"><%=info.gethTel() %></td>
			  <td width="200"><%=info.gethAddress() %></td>
			  <td width="100"><%=Time.time(info.getdTime()) %></td>
			  <td width="100"><%
		for(int j=0;j<list2.size();j++){ 
		info2=list2.get(j);%>
		<%=info2.getDeBeizhu() %><br/>
		<%} %></td>
			  <td width="60"><%
			  if(info.getdState().equals("1")){
			   %>待接单<%
			   }else if(info.getdState().equals("2")){ 
			   %>已经接单<%
			   }else if(info.getdState().equals("3")){ 
			   %>交易成功<%
			   }else{
			   %>交易失败<%} %></td>
			  <td width="100" id="caozuo"><%
			  if(info.getdState().equals("1")){
			   %><a href="../do/doState.jsp?dId=<%=info.getdId() %>&dState=0">取消订单</a><%
			   }else if(info.getdState().equals("2")){ 
			   %><a href="../do/doState.jsp?dId=<%=info.getdId() %>&dState=3">确认送达</a>
			   <br/><a href="../do/doState.jsp?dId=<%=info.getdId() %>&dState=0">取消订单</a><%
			   }%>
			   &nbsp;<a href="../do/doDelDingdan.jsp?dId=<%=info.getdId() %>">删除</a></td>
			  </tr>
			  <% } } %>
			 </table></div>
<div align="center">
<br><br>
<iframe src="../includeFile/shippingBottom.jsp" width="1050"
					height="100" marginheight="0" marginwidth="0" frameborder="0"
					scrolling="no"></iframe>
</div>
</body>
</html>