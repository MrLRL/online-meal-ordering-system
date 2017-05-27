<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="utf-8"%>
 <%
    //注册操作（作者：徐辉、周华）
  //逻辑处理
	//获得用户信息
	request.setCharacterEncoding("utf-8");//设置字符编码
	String name=request.getParameter("person.user_name");
	String pass=request.getParameter("person.user_pass");
	String petname=request.getParameter("person.user_petname");
	String realname=request.getParameter("person.user_realname");
	 String sex=request.getParameter("person.user_sex");
	 String mail=request.getParameter("person.user_mail");
	 String transPass=request.getParameter("transPass");
	UserDao dao=new UserDao();
	//判断用户名是否已经存在
	ArrayList<String> list=dao.uName();
	if(list!=null){
	for(int i=0;i<list.size();i++){
	String uName=list.get(i);
	if(name.equals(uName)){
    response.sendRedirect("../user/register_page.jsp?uName=0");
    return;
	}
	   }
	 }
	   //判断邮箱是否已被注册
	ArrayList<String> list2=dao.uEmail();
	if(list2!=null){
	for(int j=0;j<list.size();j++){
	String uEmail=list2.get(j);
	if(mail.equals(uEmail)){
    response.sendRedirect("../user/register_page.jsp?uMail=0");
    return;
	}
	   }
	}
	//调用UserDao中的login的方法
	UsersInfo user=new UsersInfo("",name,pass,petname,realname,sex,mail,transPass,"0");
    int res	= dao.Reg(user);//用变量接收
    //根据结果判定是否注册成功
    if(res>0){
         session.setAttribute("404","注册成功！请登录！");
    	 response.sendRedirect("../index/404.jsp");
    }else{   
         session.setAttribute("404","注册失败！");
    	 response.sendRedirect("../index/404.jsp");
    }
 
 %>