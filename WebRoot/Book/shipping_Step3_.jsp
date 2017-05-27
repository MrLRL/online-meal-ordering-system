<!-- 确认订单（作者：周华） -->
<%@ page language="java" import="java.util.*,java.text.*,entity.*,dao.*" contentType="text/html; charset=utf-8"
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
#yangshi a{
color:blue;
text-decoration:underline;
}
#yangshi a:hover{
color:red;
text-decoration:underline;
}
#xuanze a{
color:blue;
text-decoration:none;
}
#xuanze a:hover{
color:red;
text-decoration:underline;
}
-->
</style>
<link href="../css/css.css" rel="stylesheet" type="text/css">

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
function dizhi(){
document.getElementById("xuanze").style.display="none";
document.getElementById("dizhi2").style.display="block";
}
     //隐藏时间选择层
    function shijians(obj) {
    	if(obj.value=='1'){
    	       document.getElementById('times').style.display = "none"; 
    	    }else if(obj.value=='0'){
    	       document.getElementById('times').style.display = "block"; 
    	    }
	}
function TransPass()
{
	var d=/^\d{6}$/;
	var transPass = document.getElementById("pass").value;
	var textBox = document.getElementById("textTran");
	if(transPass==""){
		textBox.innerHTML = "×交易密码不能为空";
		textBox.style.color = "red";
	}
	else if(d.test(transPass)){
		textBox.innerHTML = "√";
		textBox.style.color = "green";
	}else{
		textBox.innerHTML = "×交易密码必须为6位纯数字";
		textBox.style.color = "red";
		}
	}
	function tijiao(){
	var d=/^\d{6}$/;
	var transPass = document.getElementById("pass");
	var textBox = document.getElementById("textTran");
	if(transPass.value==""){
		textBox.innerHTML = "×交易密码不能为空";
		textBox.style.color = "red";
		transPass.focus();
		return false;
	}
	else if(d.test(transPass.value)){
		textBox.innerHTML = "√";
		textBox.style.color = "green";
		return true;
	}else{
		textBox.innerHTML = "×交易密码必须为6位纯数字";
		textBox.style.color = "red";
		transPass.focus();
		return false;
		}
	}
</script>

<title>快乐订餐 欢迎你的到来</title>
</head>
<%
//保存当前页面信息
   session.setAttribute("THIS", "Book/shipping_Step3_.jsp");
//判断用户是否登录，如果没有登录，则跳转到登录页面
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("shipping_Step1.jsp");
return;
}
  //获取用户相关信息
  UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
  %>
<body onLoad="checkEmpty()">

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
							<img src="../images/lc03.gif" width="599" height="49"><div align="center">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="1%">&nbsp;</td>
										<td width="65%">
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
									<td height="225" align="center">
										<table width="845" height="69" border="0" align="center">
											<tr>
												<td colspan="7">
													<center>
			<form name="send_Order" action="../do/doZhifu2.jsp" method="post" onsubmit="return tijiao()">
				<table width="800" border="0">
					<tr>
						<td colspan="2">
							<div align="center">
								<h3>
									请你填写你的收货信息&nbsp;&nbsp;
								</h3>
							</div>
						</td>
					</tr>
					<tr>
						<td width="217" style="font-size:18px">
							<div align="right">选择地址：</div>
						</td>
	<%				
  HarvestsDao dao=new HarvestsDao(); 
  List<HarvestsInfo> list=dao.getHarvests(user.getuId());
     %>	
 <%
  if(list.size()>0){
  HarvestsInfo info=list.get(0);
 %>
                             <td rowspan="2">
							<input type="radio" name="address" value="<%=info.gethId() %>" checked="checked"/>收货人姓名：<%=info.gethName() %>&nbsp;	手机号码：<%=info.gethTel() %>&nbsp;配送地址：<%=info.gethAddress() %> 
							<%
                     if(list.size()>1){ %>
                     <div id="xuanze" onclick="dizhi()" style="font-size:15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">选择其他地址</a></div>
					
					<div id="dizhi2" style="display: none">
					  <%
                     for(int i=1;i<list.size();i++){
                     HarvestsInfo info2=list.get(i); %><input type="radio" name="address" value="<%=info2.gethId() %>"/>收货人姓名：<%=info2.gethName() %>&nbsp;	手机号码：<%=info2.gethTel() %>&nbsp;配送地址：<%=info2.gethAddress() %>
					  <br/><%}  }%></div></td><%} %>
					</tr>
					<tr><td rowspan="2"></td>
					</tr>
					<tr>
						<td id="yangshi" style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><a href="../user/address.jsp">新增地址</a></strong></td>
					</tr>
					<tr>
						<td height="30">
							<div align="right" style="font-size:18px">送货时间：</div>
						</td>
						<td>
							<div align="left">
								<input type="radio" name="shijian" id="shijian1" value="1"
									checked="checked" onClick="shijians(this)" />立即配送 
								<input type="radio" name="shijian" id="shijian2" value="0"
									onClick="shijians(this)" />选择配送时间 <br />
							</div>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<div id="times" style="display: none">
								<select name="selectDay" id="selectDay">
									<%
										Calendar can = Calendar.getInstance();
										can.setTime(new Date());
										SimpleDateFormat sdfOne = new SimpleDateFormat("yyyy-MM-dd");
										SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd EEE");
										for (int i = 0; i < 7; i++) {
									%>
									<option value="<%=sdfOne.format(can.getTime())%>">
										<%
											out.print(sdf.format(can.getTime()));
												if (i == 0) {
													out.print(" 今天");
												}
										%>
									</option>
									<%
										can.add(Calendar.DAY_OF_WEEK,1);
										}
									%>
								</select> <select name="selectHour" id="selectHour"
									onChange="checkDate()">
									<option value="-1">请选择时间</option>
									<option value="10">早上9点</option>
									<option value="10">早上10点</option>
									<option value="11">早上11点</option>
									<option value="12">中午12点</option>
									<option value="13">下午1点</option>
									<option value="14">下午2点</option>
									<option value="15">下午3点</option>
									<option value="16">下午4点</option>
									<option value="17">下午5点</option>
									<option value="18">下午6点</option>
									<option value="19">晚上7点</option>
									<option value="20">晚上8点</option>
									<option value="21">晚上9点</option>

								</select> <select name="selectMinu" id="selectMinu"
									onchange="checkDate()">
									<option value="-1">请选择时间</option>
									<option value="00">0分</option>
									<option value="10">10分</option>
									<option value="20">20分</option>
									<option value="30">30分</option>
									<option value="40">40分</option>
									<option value="50">50分</option>

								</select>&nbsp;<span id="times" class="red">*</span>
							</div>
						</td>
					</tr>
					<tr>
						<td height="30" style="font-size:18px">
							<div align="right">支付方式：</div>
						</td>
						<td>
							<div align="left">
								<input type="radio" name="zhifu" checked="checked" />余额（<%=Double.parseDouble(user.getuBalance()) %>元）
								</div>
						</td>
					</tr>
					<tr><td height="30" style="font-size:18px">
					<div align="right">交易密码：</div></td>
					<td>
							<div align="left">
								<input type="password" id="pass" name="pass" maxlength="6" onblur="TransPass()" />
								<%if(request.getParameter("pass")!=null){ %>
								<span id="textTran" class="red">*交易密码错误！！！</span>
								<%}else{ %>
								<span id="textTran" class="red">*</span>
								<%} %>
							</div></td></tr>
					<tr>
						<td colspan="2">
							<div align="center">
								<input type="submit" value="提交订单" style="font-size:15px" />&nbsp;&nbsp;
								<a href="shipping_Step2.jsp"><img alt="" src="../images/fanhui.gif"
									align="middle" /></a>&nbsp;&nbsp;&nbsp;
							</div>
						</td>
					</tr>
				</table>

			</form>
		</center></td>
											</tr>
									<tr align="center">
												<td width="54" height="24">编号</td>
												<td width="164">菜名</td>
												<td width="100">数量</td>
												<td width="100">单价</td>
												<td width="120">总价</td>
												<td width="128">备注</td>
											</tr>
  <%
//获得当前选择的商品信息
DingdansInfo info2=(DingdansInfo)session.getAttribute("LIJI");
 if(info2!=null){ %>
											<tr align="center">
												<td>1</td>
												<td><%=info2.getgName() %></td>
												<td><%=info2.getgCount() %></td>
												<td><%=Double.parseDouble(info2.getgPrice()) %></td>
												<td><%=Double.parseDouble(info2.getdPrice()) %></td>
												<td align="left"><%=info2.getDeBeizhu() %></td>												
											</tr>
											<tr>
												<td colspan="2">&nbsp;</td>
												<td class="red" align="center"><font size="3" class="red">共：<%=info2.getgCount() %>份</font></td>
												
												<td colspan="2">
													<font size="3" class="red">
														总计：<%=Double.parseDouble(info2.getdPrice()) %>元
													</font></td>
												<td align="left">&nbsp;</td>
											</tr>
											<%} %>
										</table></td>
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
