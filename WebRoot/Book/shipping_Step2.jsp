<!-- ���ﳵҳ�棨���ߣ��ܻ��� -->
<%@ page language="java" import="java.util.*,dao.*,entity.*,dao.*" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.style21 {
	font-weight: bold
}
#yangshi a{
color:blue;
text-decoration:none;
}
#yangshi a:hover{
color:red;
text-decoration:underline;
}
-->
</style>
<link href="../css/order_style.css" rel="stylesheet" type="text/css" />
<link href="../css/css.css" rel="stylesheet" type="text/css">

<style type="text/css">
<!--
.STYLE22 {
	color: #FF0000
}
-->
</style>
<script language="javascript" type="text/javascript">
	function gotoServlet(obj) {

		obj.submit();
	}
	function xiugai(){
var count=document.getElementById("count").value;
var beizhu=document.getElementById("beizhu").value;	
var cId=document.getElementById("cId").value;	
location.href="../do/doUpCart.jsp?cId="+cId+"&count="+count+"&beizhu="+beizhu;	
}									
</script>
<%
//���浱ǰҳ����Ϣ
   session.setAttribute("THIS", "Book/shipping_Step2.jsp");
//�ж��û��Ƿ��¼�����û�е�¼������ת����¼ҳ��
if(session.getAttribute("LOGIN")==null){
response.sendRedirect("shipping_Step1.jsp");
return;
}
  int num=0;
//��õ�ǰ��¼�ߵ�ID
UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
//���û�ù��ﳵ�ķ���
CartDao dao=new CartDao();
List<CartsInfo> list=dao.getCartInfo(user.getuId());
 %>
<title>�ҵĹ��ﳵ</title>
</head>

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
										<td width="65%"><img src="../images/lc02.gif" width="599"
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
									<td height="225" align="center"><span class="style21">���Ĺ��ﳵ�б���Ϣ
											(��:<%=dao.num(user.getuId()) %>  ��) </span><font color="#FF6600">&nbsp;</font>
										<table width="666" height="69" border="0">
											<tr align="center" class="tr_sty">
												<td width="44" height="24">���</td>
												<td width="144">����</td>
												<td width="80">����</td>
												<td width="80">����</td>
												<td width="100">�ܼ�</td>
												<td width="108">��ע</td>
												<td width="110">����</td>
											</tr>  <%
                                            if(list!=null){
                                              for(int i=0;i<list.size();i++){
                                              CartsInfo cart=list.get(i);
                                              num=num+Integer.parseInt(cart.getgCount());
                                              if(request.getParameter("cId")!=null&&cart.getCartId().equals(request.getParameter("cId"))){ %>
											<tr align="center" class="tr_sty1">
												<td><%=i+1 %>
												<input id="cId" type="hidden" value="<%=cart.getCartId() %>"></td>
												<td><%=cart.getgName() %></td>
												<td><input id="count" type="text" maxlength="3" style="width:20px;" value="<%=cart.getgCount() %>"></td>
												<td><%=Double.parseDouble(cart.getgPrice()) %></td>
												<td><%=Double.parseDouble(cart.getgPrice())*Integer.parseInt(cart.getgCount()) %></td>
												<td><input id="beizhu" type="text" size="7" value="<%=cart.getcBeizhu() %>"/></td>
												<td id="yangshi"><a href="#" onclick="xiugai()">ȷ��</a>&nbsp;&nbsp;<a href="../do/doDelCart.jsp?cId=<%=cart.getCartId() %>">ɾ��</a></td>
											</tr><%}else{ %>
											<tr align="center" class="tr_sty1">
												<td><%=i+1 %></td>
												<td><%=cart.getgName() %></td>
												<td><%=cart.getgCount() %></td>
												<td><%=Double.parseDouble(cart.getgPrice()) %></td>
												<td><%=Double.parseDouble(cart.getgPrice())*Integer.parseInt(cart.getgCount()) %></td>
												<td><%=cart.getcBeizhu() %></td>
												<td id="yangshi"><a href="shipping_Step2.jsp?cId=<%=cart.getCartId() %>">�޸�</a>&nbsp;&nbsp;<a href="../do/doDelCart.jsp?cId=<%=cart.getCartId() %>">ɾ��</a></td>
											</tr>
											<% } } } %>
											<tr>
												<td></td>
												<td></td>
												<td>��������<%=num %></td>
												<td></td>
												<td>�ܼۣ�<%=dao.sum(user.getuId()) %></td>
												<td align="left"></td>
												<td></td>
											</tr>
											<tr>
												<td colspan="7" align="right">
												<a href="shipping_Step3.jsp"> <img src="../images/Settlement.png" /> </a>
												</td>
											</tr>							
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
