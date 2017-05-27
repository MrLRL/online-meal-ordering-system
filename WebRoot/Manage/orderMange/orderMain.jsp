<!-- 订单管理(作者：徐辉) -->
<!-- 页面已修改 -->
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,dao.*,entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单管理</title>
<link href="../../css/order_style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" language="java">
	function searchMethod()
	{
		var name = document.getElementById("search").value;
		var fm = document.sForm;
		fm.action="orderMain.jsp?name="+name;
		fm.submit();
	}
</script>
</head>
 <%
 //保存当前页面信息
session.setAttribute("THIS", "orderMange/orderMain.jsp");
  int currPages=1;  //当前页数
  if(request.getParameter("pages")!=null){
  	currPages=Integer.parseInt(request.getParameter("pages"));
  }
    DingdansDao dao=new DingdansDao();  //调用方法，显示当前页，每页显示10条
  List<DingdansInfo> list =  dao.getDingdan1(currPages);
  int sum=dao.num1();  //获得总条数
  if(sum==0){
  sum=1;}
 if(request.getParameter("name")!=null){
 String search=new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
 list=dao.getDingdan3(currPages, search);
 }
  int n=0;   //总页数
  if(sum%10==0){
  	 n=sum/10;
  }else{
     n=sum/10+1;
  }
   %>
<body>
	<jsp:include page="manageTop.jsp" />
	<table width="995" border="0" align="center">
	<tr>
		<td width="150">
		
		<a href="orderSearch.jsp?dStade=1">
		<img src="../../images/10.gif" border="0"/>
		</a>
		</td>
		<td width="150">
		
		<a href="orderSearch.jsp?dStade=2">
		<img src="../../images/9.gif" border="0"/>
		</a>
		</td>
		<td width="150">
		<a href="orderSearch.jsp?dStade=3">
		<img src="../../images/11.gif" border="0"/>
		</a>
		</td>
		<td width="250"></td>
		<td align="center">
			<form action="" name="sForm" method="post">
			搜索用户：<input type="text" id="search"/>
			<a href="#"><img src="../../images/i_fdj.gif" border="0" width="23px" height="23px" onclick="searchMethod()"/></a>
			</form>
		</td>
	</tr>
	</table>

	<form action="" name="orderform" method="post">
		<table width="995"  border="0" align="center">
			<tr class="tr_sty" align="center">
			  <td width="33">序号</td>
			  <td width="33">订餐者ID</td>
			  <td width="50">订餐者</td>
			  <td width="101">菜名</td>
			  <td width="33">份额</td>
			  <td width="50">单价</td>
			  <td width="50">总价</td>
			  <td width="100">电话</td>
			  <td width="205">送餐地址</td>
			  <td width="100">下单时间</td>
			  <td width="80">备注</td>
			  <td width="60">订单状态</td>
			  <td width="100">操作</td>
			 </tr>
	     <%
	     //循环读取
                 if(list!=null){
		         DetailsInfo info2=null;
                 for(int i=0;i<list.size();i++){
  	              DingdansInfo info=list.get(i);
		List<DetailsInfo> list2=dao.getDetail(info.getdId());//查询对应订单详情
  	            
           %>
			<tr class="tr_sty0" align="center">
			    <td align="center"><%=(i+1) %></td>
				<td align="center"><%=info.getuId() %></td>
				<td align="center"><%=info.getuPetname() %></td>
				<td align="center"><%
		for(int j=0;j<list2.size();j++){ 
		info2=list2.get(j);%><%=info2.getgName() %><br/>
		        <%} %></td>
				<td align="center"><%
		for(int j=0;j<list2.size();j++){ 
		info2=list2.get(j);%><%=info2.getgCount() %><br/>
		        <%} %></td>
				<td align="center"><%
		for(int j=0;j<list2.size();j++){ 
		info2=list2.get(j);%><%=Double.parseDouble(info2.getgPrice()) %><br/>
		        <%} %></td>
				<td align="center"><%=Double.parseDouble(info.getdPrice()) %></td>
				<td align="center"><%=info.gethTel() %></td>
				<td align="center"><%=info.gethAddress() %></td>
				<td align="center"><%=Time.time(info.getdTime()) %></td>
				<td align="center"><%
		for(int j=0;j<list2.size();j++){ 
		info2=list2.get(j);%><%=info2.getDeBeizhu() %><br/>
		        <%} %></td>	
				<td align="center"><%
			  if(info.getdState().equals("1")){
			   %>待接单<%
			   }else if(info.getdState().equals("2")){ 
			   %>已经接单<%
			   }else if(info.getdState().equals("3")){ 
			   %>交易成功<%
			   }else{
			   %>交易失败<%} %></td>		
				<td align="center">
              <%
			  if(info.getdState().equals("1")){
			   %><a href="../../do/doDingdan.jsp?dId=<%=info.getdId() %>&dState=2">接受订单</a><%
			   }else if(info.getdState().equals("2")){ 
			   %><a href="../../do/doDingdan.jsp?dId=<%=info.getdId() %>&dState=3">确认送达</a><%
			   }%>
 <a href="../../do/doDelDingdan1.jsp?dId=<%=info.getdId()%>">删除</a>
				</td>
			</tr>	
			 <%
      }    }
      %>	
		</table>
		</form>
		<!-- -------------------------------以下是实现分页显示------------------------------------ -->
		<p>&nbsp;</p><%
 if(n==1){  //如果只有一页
 %>
 <div align="center" >首页  &nbsp;上一页 &nbsp;  下一页 &nbsp; 末页 </div>
<%}else if(currPages==1){ //如果是首页 %> 
 <div align="center">首页  &nbsp;上一页 &nbsp;  <a href="orderMain.jsp?pages=<%=currPages+1%>">下一页</a>&nbsp; <a href="orderMain.jsp?pages=<%=n%>">末页</a></div>
 <%
}else if(currPages==n){  //如果是末页
 %>
 <div align="center"><a href="orderMain.jsp?pages=1">首页</a>  &nbsp;<a href="orderMain.jsp?pages=<%=currPages-1%>">上一页</a> &nbsp;  下一页 &nbsp; 末页 </div>
 <%}else{ %>
 <div align="center"><a href="orderMain.jsp?pages=1">首页</a>  &nbsp;<a href="orderMain.jsp?pages=<%=currPages-1%>">上一页</a> &nbsp;  <a href="orderMain.jsp?pages=<%=currPages+1%>">下一页</a>&nbsp; <a href="orderMain.jsp?pages=<%=n%>">末页</a></div>
 <%} %><br/>
		<jsp:include page="../manageBottom.jsp" />
</body>
</html>
