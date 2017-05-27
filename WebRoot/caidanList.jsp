<!-- 分类页面（作者：周华） -->
<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="javascript">
function tiaozhuan() {
	var yeshu = document.getElementById('tiaozhuan').value;
	location.href = "caidanList.jsp?pages=" + yeshu;
}
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
#index{
font-size:15px;
height:25px;
}
#index a:hover{
color:#F00;
text-decoration:underline;
}
#index a{
color:#00F;
text-decoration:none;
}
</style>
 <title>快乐订餐 欢迎你的到来</title>
</head>

<%//保存当前页面信息
    session.setAttribute("THIS", "caidanList.jsp");
    //判断是否登录
    UsersInfo user=null;
if(session.getAttribute("LOGIN")!=null){
     user=(UsersInfo)session.getAttribute("LOGIN");
} 
 %>
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
						<td width="99"><a href="#" onClick="searchContent()"><font color="#FFFFFF" face="宋体">搜索</font></a></td>
						<td width="96"><font color="#FFFFFF"></font></td>
						<td width="289"><font color="#FFFFFF"></font></td>
						<td width="237"><font color="#FFFFFF"></font></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="8"></td>
		</tr>
	</table>
	<table width="955" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="203" valign="top" rowspan="2">
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
			<% 
			int pIndex=1;//当前页数
	if(request.getParameter("pages")!=null){
	String pages=request.getParameter("pages");
    if(pages.matches("[0-9]+")==true){
    pIndex=Integer.parseInt(pages);
    }else if(pages.matches("[0-9]+")==false){
         session.setAttribute("404","跳转的页面不是数字！");
    	 response.sendRedirect("index/404.jsp");
    	 }
    }
						GoodsDao dao=new GoodsDao();
						List<GoodsInfo> list=null;
						if(request.getParameter("name")!=null){
						String search=new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
						list=dao.search(pIndex,search);
						}else if(request.getParameter("fenlei")!=null){
						String caixi=new String(request.getParameter("fenlei").getBytes("iso-8859-1"),"utf-8");
						list=dao.caixi(pIndex, caixi);
						}else{
						list=dao.sel(pIndex);
						}
						if(list!=null){
						for(int i=0;i<list.size();i++){
						GoodsInfo good=list.get(i);
						 %>
							<div class="content" id="cptj_div2">
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
									</dl><%}} %></div></td></tr>
		<!-- -------------------------------以下是实现分页显示------------------------------------ -->
		
<%
     int sum=dao.num();//获得总条数
	 if(request.getParameter("fenlei")!=null){
		String caixi=new String(request.getParameter("fenlei").getBytes("iso-8859-1"),"utf-8");
		sum=dao.num2(caixi);
		if(sum==0){
		sum=1;}
		}else if(request.getParameter("name")!=null){
		String search=new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
		sum=dao.num3(search);
		if(sum==0){
		sum=1;}
		}
     int n=0;//总页数
     if(sum%12==0){
     n=sum/12;
     }else{
     n=sum/12+1;
     }
     if(pIndex>n||pIndex<1){
         session.setAttribute("404","跳转的页面不存在！");
    	 response.sendRedirect("index/404.jsp");}
   %><tr>
		<td align="center" height="25" valign="bottom">
		<%
  if(pIndex==1&&pIndex==n){
 %>
<div id="index">首页&nbsp; 上一页&nbsp; 下一页&nbsp; 末页&nbsp;&nbsp;&nbsp;</div>
<%
 }else if(pIndex==1){
 %>
<div id="index">首页&nbsp; 上一页&nbsp; <a href="caidanList.jsp?pages=<%=pIndex+1 %>">下一页</a>&nbsp; <a href="caidanList.jsp?pages=<%=n%>">末页</a>&nbsp;&nbsp;&nbsp;</div>

<%
} else if(pIndex==n){
%>
<div id="index"><a href="caidanList.jsp?pages=1">首页</a>&nbsp; <a href="caidanList.jsp?pages=<%=pIndex-1%>">上一页</a>&nbsp; 下一页&nbsp; 末页&nbsp;&nbsp;&nbsp;</div>
<%
} else{
%>
<div id="index"><a href="caidanList.jsp?pages=1">首页</a>&nbsp; <a href="caidanList.jsp?pages=<%=pIndex-1%>">上一页</a>&nbsp; <a href="caidanList.jsp?pages=<%=pIndex+1%>">下一页</a>&nbsp; <a href="caidanList.jsp?pages=<%=n%>">末页</a>&nbsp;&nbsp;&nbsp;</div>
<%
}
%>
			<div align="right" style="height:25;"><font size="3">共<%=sum %>条 &nbsp;&nbsp;&nbsp;
			第<%=pIndex %>页&nbsp;&nbsp;&nbsp;
			共<%=n %>页&nbsp;&nbsp;&nbsp;跳到第<input type="text" maxlength="3" style="width:30px" id="tiaozhuan"/>页<input type="button" value="跳转" onclick="tiaozhuan()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></div>
		</td></tr></table>
	<div align="center">
		<iframe src="includeFile/shippingBottom.jsp" width="1000" height="100"
			marginheight="0" marginwidth="0" frameborder="0" scrolling="no"></iframe>

	</div>
</body>
</html>