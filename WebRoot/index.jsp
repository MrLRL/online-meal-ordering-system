<!-- 首页（作者：周华） -->
<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="javascript">
function searchContent() {
	var objVal = document.getElementById('searchCont').value;
		location.href = "caidanList.jsp?name=" + objVal;
}
	function getTime() {
		var date=new Date();
		var fen=date.getMinutes();
		var miao=date.getSeconds();
	if(fen<10){
		fen="0"+fen;}
	if(miao<10){
		miao="0"+miao;}
	    document.getElementById("getTime").innerHTML =date.toLocaleDateString()+" "+date.getHours()+":"+fen+":"+miao;
		setTimeout("getTime()", 1000);
	}
</script>
<style type="text/css">
#zhuxiao:hover{
text-decoration:underline;
}
#zhuxiao:link{
color:#999;
}
</style>
<title>快乐订餐 欢迎你的到来</title>
<%
    session.setAttribute("THIS", "index.jsp");
    UsersInfo user=null;
if(session.getAttribute("LOGIN")!=null){
    user=(UsersInfo)session.getAttribute("LOGIN");
} 
 %>
</head>
<body>
	<table width="955" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="203" height="138" rowspan="2" align="center" valign="bottom" style="font-size:18px"><img
				src="images/logo.gif" width="155" height="120">
				<span id="getTime"></span> 
				<script language="javascript">
	              getTime();
                </script>
			</td>
			<td width="752" height="35" valign="bottom">
                 <br/>
				<div align="center"><br/>
				<%
				if(user!=null){%>
					<font color="#FF0000" size="3"><%=user.getuPetname() %> </font>
					<font color="" size="1"><a href="do/dozhuxiao.jsp?uId=<%=user.getuId() %> " id="zhuxiao">注销</a></font>
					<%} %>
					<font color="#FFCC00"> 您好！欢迎来到快乐餐</font>
					<font color="#0000FF">
					<%if(user==null){ %>
					<a href="Book/shipping_Step1.jsp" target="_parent">[请登录]</a>
					</font> &nbsp; <font color="#0000FF"><a
						href="user/register_page.jsp">[注册]</a>
					</font> &nbsp; <font color="#0000FF"><a href="user/regetpass.jsp">[找回密码]</a>
					</font><%} 
					if(user!=null){ 
					CartDao dao=new CartDao();%>
					<br/>当前购物车：商品数(
					<%=dao.num(user.getuId()) %>
					种)&nbsp;&nbsp;总共(<%=dao.sum(user.getuId()) %>
					元)
					<%} %>
				</div>
			</td>
		</tr>
		<tr>
			<td valign="bottom"><img src="images/t.gif" border="0" 
				usemap="#Map"><br /><br /> <map name="Map">
					<area shape="rect" coords="23,8,119,43" href="index.jsp">
					<area shape="rect" coords="162,9,261,43"
						href="Book/shipping_Step2.jsp">
					<area shape="rect" coords="301,9,422,43" href="user/message.jsp">
					<area shape="rect" coords="473,9,567,42"
						href="order/queryOrder.jsp">
					<area shape="rect" coords="633,10,724,42" href="about/aboutwe.jsp">
				</map>
			</td>
		</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="80" background="images/sb.gif" bgcolor="#F7942C">
				<table width="955" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td width="234" align="right"><font color="#FFFFFF" face="宋体">
								<input name="Input" id="searchCont" type="text"> </font>
								<a href="#"><img src="images/i_fdj.gif" onClick="searchContent()" title="搜索"></a>
						</td>
						<td width="99"><a href="#" onClick="searchContent()"><font color="#FFFFFF" face="宋体">搜索</font></a>
						</td>
						<td width="96">
						</td>
						<td width="289">
						</td>
						<td width="237">
						</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td height="8"></td>
		</tr>
	</table>
	<table width="955" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="203" valign="top">
				<table width="188" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="27" background="images/kb.gif"
							style="background-repeat: no-repeat">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="15%">&nbsp;</td>
									<td width="85%" class="w12">网站公告</td>
								</tr>
							</table></td>
					</tr>
				</table>
				<table width="180" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;顾客，你好，在订餐之前，请留意我们的订餐时间，我们订餐时间是早10点到夜晚9点。</p>
							<p>如果需要订餐，请提前2小时预定，否则我们视其为无效订餐，我们会根据情况取消你的订单，请谅解。</p>
							<p>&nbsp;&nbsp;---快乐订餐欢迎您的到来</p></td>
					</tr>
				</table>
				<table width="188" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="8"></td>
					</tr>
				</table>
				<table width="188" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="27" background="images/kb.gif"
							style="background-repeat: no-repeat">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="15%">&nbsp;</td>
									<td width="85%" class="w12">送餐时间</td>
								</tr>
							</table></td>
					</tr>
				</table>
				<table width="180" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>早餐(09:00-11:00)</td>
					</tr>
					<tr>
						<td>午餐(11:00-15:00)</td>
					</tr>
					<tr>
						<td>晚餐(15:00-21:00)</td>
					</tr>
				</table>
				<table width="188" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="8"></td>
					</tr>
				</table>
				<table width="188" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="27" background="images/kb.gif"
							style="background-repeat: no-repeat">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="15%">&nbsp;</td>
									<td width="85%" class="w12">商品分类</td>
								</tr>

							</table></td>
					</tr>
				</table>
				<table height="350" width="180" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td><a href="caidanList.jsp">&nbsp;<img src="images/jt.gif">&nbsp;<font size="3"><strong>所有菜</strong></font></a>
						</td>
					</tr>
					<tr>
						<td><a href="caidanList.jsp?fenlei=湘菜">&nbsp;<img src="images/jt.gif">&nbsp;<font size="3"><strong>湘菜</strong></font></a>
						</td>
					</tr>
					<tr>
						<td><a href="caidanList.jsp?fenlei=川菜">&nbsp;<img src="images/jt.gif">&nbsp;<font size="3"><strong>川菜</strong></font></a>
						</td>
					</tr>
					<tr>
						<td><a href="caidanList.jsp?fenlei=苏菜">&nbsp;<img src="images/jt.gif">&nbsp;<font size="3"><strong>苏菜</strong></font></a>
						</td>
					</tr>
					<tr>
						<td><a href="caidanList.jsp?fenlei=鲁菜">&nbsp;<img src="images/jt.gif">&nbsp;<font size="3"><strong>鲁菜</strong></font></a>
						</td>
					</tr>
					<tr>
						<td><a href="caidanList.jsp?fenlei=粤菜">&nbsp;<img src="images/jt.gif">&nbsp;<font size="3"><strong>粤菜</strong></font></a>
						</td>
					</tr>
					<tr>
						<td><a href="caidanList.jsp?fenlei=闽菜">&nbsp;<img src="images/jt.gif">&nbsp;<font size="3"><strong>闽菜</strong></font></a>
						</td>
					</tr>
					<tr>
						<td><a href="caidanList.jsp?fenlei=浙菜">&nbsp;<img src="images/jt.gif">&nbsp;<font size="3"><strong>浙菜</strong></font></a>
						</td>
					</tr>
					<tr>
						<td><a href="caidanList.jsp?fenlei=徽菜">&nbsp;<img src="images/jt.gif">&nbsp;<font size="3"><strong>徽菜</strong></font></a>
						</td>
					</tr>
					<tr>
						<td><a href="caidanList.jsp?fenlei=其他">&nbsp;<img src="images/jt.gif">&nbsp;<font size="3"><strong>其他</strong></font></a>
						</td>
					</tr>
				</table>
				<table width="188" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td><a href="message/addnote.jsp"><img
								src="images/message.gif" width="187" height="61" border="0">
						</a>
						</td>
					</tr>
				</table></td>
			<td width="752" valign="top">
				<table width="100%" cellspacing="0" cellpadding="0">
					<tr>
						<td width="81%" style="margin-top: 1000px" >
						 <%
						GoodsDao dao=new GoodsDao();
						List<GoodsInfo> list=dao.getAll();
						if(list!=null){
						for(int i=0;i<list.size();i++){
						GoodsInfo good=list.get(i);
						 %>
							<div class="content" id="cptj_div2">
									<dl style="margin-left: 15px; float: left; margin-top: 10px">
										<dt style="float: left">
										<a href="Book/bookCook.jsp?gId=<%=good.getgId() %>">
											<img src="img/<%=good.getgImage() %>" width="130"
												height="120" title="" /></a>
										<dd style="clear: left; float: left; margin: 0px; text-align: center; width: 130px">
										<a href="Book/bookCook.jsp?gId=<%=good.getgId() %>"><%=good.getgName() %>
										<br>
											分类：<%=good.getgCaixi() %><br> 价格：<%=Double.parseDouble(good.getgPrice()) %>元 </a>								  
									   </dl>
									</div>
<%}
} %>
									</td>
						<td width="19%" valign="top" bordercolor="#FF00CC">
							<table id="__4" width="230" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td colspan="3"><img src="images/yh_01.gif" width="230"
										height="41" alt="">
									</td>
								</tr>
								<tr>
									<td width="15" background="images/yh_02.gif">&nbsp;</td>
									<td width="208"><marquee height="150"
											onMouseOut=this.start(); onMouseOver=this.stop()
											direction="up" scrollamount="2">
											<p style="color: #FF3300">一次订购两件以上商品送饮料</p>
											<p style="color: #FF3300">订购大盘鸡一份，送10个馒头</p>
											<p style="color: #FF3300">订购四道家常菜，可获赠水果沙拉一份</p>
											<p style="color: #FF3300">情人节，情侣订餐可获赠甜蜜蜜一份</p>
											<p style="color: #FF3300">端午节，订购任意商品送肉粽一个</p>
											<p style="color: #FF3300">团购享受8折超值优惠</p>

										</marquee>
									</td>
									<td width="7" background="images/yh_04.gif">&nbsp;</td>
								</tr>
								<tr>
									<td colspan="3"><img src="images/yh_05.gif" width="230"
										height="13" alt="">
									</td>
								</tr>
							</table></td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="36"><img src="images/tjsp.gif" width="748"
							height="36" border="0" usemap="#Map2"></td>
					</tr>
					<tr>
						<td align="center">
						<%
						List<GoodsInfo> list1=dao.get();
						if(list1!=null){
						for(int i=0;i<list1.size();i++){
						GoodsInfo good=list1.get(i);
						 %>
							<div class="content" id="cptj_div2" style="display: block;">
								
								
									<dl style="margin-left: 25px; margin-top: 10px; float: left">
										<dt style="float: left">
										<a href="Book/bookCook.jsp?gId=<%=good.getgId() %>">
											<img src="img/<%=good.getgImage() %>" width="130"
												height="120" title="" /></a>
										</dt>
										<dd style="clear: left; float: left; margin: 0px; text-align: center; width: 130px">
										<a href="Book/bookCook.jsp?gId=<%=good.getgId() %>">
										<%=good.getgName() %>
										<br>
											分类：<%=good.getgCaixi() %><br> 价格：<%=Double.parseDouble(good.getgPrice()) %>元</a>
										</dd>
									</dl> 
								
							</div><%}} %></td>
					</tr>

				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="36" background="images/zxsj.gif"
							style="background-repeat: no-repeat"><img
							src="images/zxsj.gif" width="748" height="36" border="0"
							usemap="#Map3">
						</td>
					</tr>
					<tr>
						<td align="center">
						<%
						List<GoodsInfo> list2=dao.getNew();
						if(list2!=null){
						for(int i=0;i<list2.size();i++){
						GoodsInfo good=list2.get(i);
						 %>
							<div class="content" id="cptj_div2" style="display: block;">
								
								
									<dl style="margin-left: 25px; margin-top: 10px; float: left">
										<dt style="float: left">
										<a href="Book/bookCook.jsp?gId=<%=good.getgId() %>">
											<img src="img/<%=good.getgImage() %>" width="130"
												height="120" title="" /></a>
										</dt>
										<dd style="clear: left; float: left; margin: 0px; text-align: center; width: 130px">
										<a href="Book/bookCook.jsp?gId=<%=good.getgId() %>">
										<%=good.getgName() %><br>
											分类：<%=good.getgCaixi() %><br> 价格：<%=Double.parseDouble(good.getgPrice()) %>元</a>
										</dd>
									</dl> 
								
							</div><%}} %></td>
					</tr>

				</table></td>
		</tr>
	</table>
	<div align="center">
		<iframe src="includeFile/shippingBottom.jsp" width="1000" height="100"
			marginheight="0" marginwidth="0" frameborder="0" scrolling="no"></iframe>

	</div>
	<map name="Map2">
		<area shape="rect" coords="17,7,108,33" href="test/menu_menuSearch.action">
	</map>
	<map name="Map3">
		<area shape="rect" coords="18,8,112,34" href="test/menu_menuSearch.action">
	</map>

</body>
</html>