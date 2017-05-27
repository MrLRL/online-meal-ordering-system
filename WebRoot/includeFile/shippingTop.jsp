<!-- 头部页面 -->
<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="utf-8" import="java.util.*,entity.*,dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
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
<% 
    UsersInfo user=null;
if(session.getAttribute("LOGIN")!=null){
     user=(UsersInfo)session.getAttribute("LOGIN");
   }
 %>
	<table width="955" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr valign="top">
			<td width="203" height="138" rowspan="2" align="center" valign="bottom" style="font-size:18px"> <img
				src="../images/logo.gif" width="155" height="120">
 <span id="getTime"></span>
 <script language="javascript" type="text/javascript">
	getTime();
</script>
			</td>
 
			<td width="752" height="35" valign="bottom">
				<br/><div align="center"><br/>
				<%
				if(user!=null){%>
					<font color="#FF0000" size="3"><%=user.getuPetname() %> </font>
					<font color="" size="1"><a href="../do/dozhuxiao.jsp?uId=<%=user.getuId() %> " id="zhuxiao">注销</a></font>
					<%} %>
					<font color="#FFCC00"> 您好！欢迎来到快乐餐</font>
					<font color="#0000FF">
					<%if(user==null){ %>
					<a href="../Book/shipping_Step1.jsp" target="_parent">[请登录]</a>
					</font> &nbsp; <font color="#0000FF"><a
						href="../user/register_page.jsp">[注册]</a>
					</font> &nbsp; <font color="#0000FF"><a href="../user/regetpass.jsp">[找回密码]</a>
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
			</tr><tr>
			<td width="752" valign="bottom"><img src="../images/t.gif"
				border="0" usemap="#Map"><br />
			<br />
			</td>
		</tr>
		<tr>
			<td height="3" colspan="2" bgcolor="#F7942C"></td>
		</tr>
	</table>

	<map name="Map">
		<area shape="rect" coords="23,8,119,43" href="../index.jsp">
		<area shape="rect" coords="162,9,261,43"
			href="../Book/shipping_Step2.jsp">
					<area shape="rect" coords="301,9,422,43" href="../user/message.jsp">
		<area shape="rect" coords="473,9,567,42"
			href="../order/queryOrder.jsp">
		<area shape="rect" coords="633,10,724,42" href="../about/aboutwe.jsp">
	</map>
