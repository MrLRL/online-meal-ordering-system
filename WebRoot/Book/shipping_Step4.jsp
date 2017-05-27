<!-- 支付成功页面（作者：周华） -->
<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,dao.*,entity.*" pageEncoding="utf-8"%>
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
<link href="../css/css.css" rel="stylesheet" type="text/css">
<title>快乐订餐 欢迎你的到来</title>
</head>
<%
//保存当前页面信息
   session.setAttribute("THIS", "Book/shipping_Step4.jsp");
//判断用户是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("shipping_Step1.jsp");
return;
}
//读取用户信息
  UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
  //读取最新的订单
  DetailDao dao=new DetailDao();
  DingdansInfo info=dao.getDingdansInfo(user.getuId());
  //读取订单详情
  List<DetailsInfo> list=dao.getDetail(info.getdId());
  int num=0;
  %>
<body>
	<jsp:include page="../includeFile/shippingTop.jsp" />
	<table width="955" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>

		<tr>
			<td height="8"></td>
		</tr>
		<tr>
			<td height="400" valign="top">
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="25">
							<div align="center">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="1%">&nbsp;</td>
										<td width="65%"><img src="../images/lc04.gif" width="599"
											height="49">
										</td>
										<td width="34%" valign="bottom">&nbsp;</td>
									</tr>
								</table>
							</div></td>
					</tr>
					<tr>
						<td height="1" bgcolor="#E9E9E9"></td>
					</tr>
					<tr>
						<td height="12" background="../images/xian.gif"></td>
					</tr>
					<tr>
						<td>
							<table width="95%" height="334" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr valign="top">
									<td height="225" align="center"><span class="style21">提交订单成功，您的当前的清单如下
											</span><font color="#FF6600">&nbsp;</font>

										<table width="691" height="121" border="0">
											<tr>
												<td width="55" height="24">编号</td>
												<td width="167">菜名</td>
												<td width="127">数量</td>
												<td width="94">单价</td>
												<td width="107">总价</td>
												<td width="111">备注</td>
											</tr>
											<%
											 if(list!=null){
											for(int i=0;i<list.size();i++){
											DetailsInfo detail=list.get(i);
											num=num+Integer.parseInt(detail.getgCount());
											 %>
											<tr>
												<td><%=i+1 %></td>
												<td><%=detail.getgName() %></td>
												<td><%=detail.getgCount() %></td>
												<td><%=detail.getgPrice() %></td>
												<td><%=Integer.parseInt(detail.getgCount())*Double.parseDouble(detail.getgPrice()) %></td>
												<td><%=detail.getDeBeizhu() %></td>
																								
											</tr>
											<% } }%>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>总共数量：<%=num %></td>
												<td>&nbsp;</td>
												<td colspan="2">总结消费：<%=Double.parseDouble(info.getdPrice()) %>元</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td colspan="2"><br>
														<a href="../index.jsp"><img
														src="../images/go.gif" title="返回首页继续订购" /></a></td>
											</tr>
										</table>
									</td>
								</tr>
							</table></td>
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
