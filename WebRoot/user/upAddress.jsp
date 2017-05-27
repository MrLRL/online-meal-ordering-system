<!-- 修改地址页面（作者：周华） -->
<%@ page language="java" import="java.util.*,entity.*,dao.*"
	pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改地址信息</title>
<script type="text/javascript" src="../JS/address.js" charset="GB2312"></script>
	<style type="text/css">
<!--
.red {
	color: #FF0000
}

.green {
	color: #00CC00;
}
-->
</style>
<script type="text/javascript">
function fanhui() {
	location.href="../user/message.jsp";
}
</script>
</head>
<%
//保存当前页面信息
    session.setAttribute("THIS", "user/upAddress.jsp");
    //判断用户是否登录，如果没有登录，则跳转到登录页面
    UsersInfo user=null;
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("shipping_Step1.jsp");
}else{
    user=(UsersInfo)session.getAttribute("LOGIN");
}    
   //获得地址ID
    String id="1";
    if(request.getParameter("hId")!=null){
    id=request.getParameter("hId");
    }
   AddressDao dao=new AddressDao();
    HarvestsInfo info=dao.upRess(id);
 %>
<body>
	<jsp:include page="../includeFile/shippingTop.jsp"></jsp:include>
	<br>
	<div class="divworm">
		<center>
			<form name="send_Order" action="../do/doUpAddress.jsp" method="post" onsubmit="return tianjia()">
				<table width="666" border="0">
					<tr>
						<td colspan="2">
							<div align="center">
								<h3>
									请输入新的地址信息&nbsp;&nbsp;
								</h3>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div align="right" style="font-size:18px">收货人姓名：</div>
						</td>
						<td>
							<div align="left">
								<input type="text" id="order_name" name="order_name" onblur="names()" value="<%=info.gethName() %>">
								<span id="uname" class="red">*</span>
							</div>
						</td>
					</tr>
					<tr height="50">
						<td>
							<div align="right" style="font-size:18px">手机号码：</div>
						</td>
						<td>
							<div align="left">
								<input type="text" maxlength="11" id="order_movPho" name="order_movPho" value="<%=info.gethTel() %>" onblur="tel()">
								<span id="tel" class="red">*</span>
							</div>
						</td>
					</tr>
					<tr valign="middle">
						<td width="217" style="font-size:18px">
							<div align="right">送餐地址：</div>
						</td>
						<td>
							<div align="left">
<input id="menpaihao" name="juti" type="text" value="<%=info.gethAddress() %>" onblur="menpai4()" /> <span id="address" class="red">*</span>
							</div>
						</td>
					</tr>
					<tr><td></td>
						<td><input type="hidden" name="id" value="<%=id %>"/></td>
					</tr>
					
					<tr>
						<td colspan="2" height="60">
							<div align="center">
								<input type="submit" value="确认修改" style="font-size:18px;background-color: #FF9933;font-weight: 800;border: 0" />&nbsp;&nbsp;
								<input type="button" value="返回" style="font-size:18px;background-color: #FF9933;font-weight: 800;border: 0" onclick="fanhui()" />&nbsp;&nbsp;&nbsp;
							</div>
						</td>
					</tr>
				</table>

			</form>
		</center>
	</div>
	<div align="center">
		<iframe src="../includeFile/shippingBottom.jsp" width="1050"
			height="100" marginheight="0" marginwidth="0" frameborder="0"
			scrolling="no"></iframe>

	</div>
</body>
</html>
