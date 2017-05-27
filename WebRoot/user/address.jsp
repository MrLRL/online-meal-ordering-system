<!-- 新增收货地址（作者：周华） -->
<%@ page language="java" import="java.util.*,entity.*,dao.*"
	pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加地址信息</title>
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
    session.setAttribute("THIS", "user/address.jsp");
    //判断用户是否登录，如果没有登录，则跳转到登录页面
    UsersInfo user=null;
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("shipping_Step1.jsp");
}else{
    user=(UsersInfo)session.getAttribute("LOGIN");
} 
 %>
<body>
	<jsp:include page="../includeFile/shippingTop.jsp"></jsp:include>
	<br>
	<div class="divworm">
		<center>
			<form name="send_Order" action="../do/doAddress.jsp" method="post" onsubmit="return tianjia()">
				<table width="666" border="0">
					<tr>
						<td colspan="2">
							<div align="center">
								<h3>
									请你填写你的地址信息&nbsp;&nbsp;
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
								<input type="text" id="order_name" name="order_name" onblur="names()" value="<%=user.getuRealname() %>">
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
								<input type="text" maxlength="11" id="order_movPho" name="order_movPho" onblur="tel()">
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
								 <select name="shi">
									<option>长沙市</option>
								</select>&nbsp;<select id="qu5" name="qu" onchange="jiedao3()">
									<option selected="selected">天心区</option>
									<option>岳麓区</option>
									<option>雨花区</option>
									<option>芙蓉区</option>
									<option>开福区</option>
								</select>&nbsp;<select id="jiedao" name="jie">
									<option selected="selected">金盆岭街道</option>
									<option>赤岭路街道</option>
									<option>城南路街道</option>
									<option>新开铺街道</option>
									<option>坡子街街道</option>
									<option>裕南街街道</option>
									<option>青园街道</option>
									<option>桂花坪街道</option>
									<option>文源街道</option>
									<option>先锋街道</option>
									<option>黑石路街道</option>
									<option>大托铺街道</option>
								</select>

							</div>
						</td>
					</tr>
					<tr><td></td>
						<td><input id="menpaihao" name="juti" type="text"  style="color:#ccc" value="请输入门牌号" onfocus="menpai()" onblur="menpai2()" /> <span id="address" class="red">*</span></td>
					</tr>
					
					<tr>
						<td colspan="2" height="60">
							<div align="center">
								<input type="submit" value="确认添加" style="font-size:18px;background-color: #FF9933;font-weight: 800;border: 0" />&nbsp;&nbsp;
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
