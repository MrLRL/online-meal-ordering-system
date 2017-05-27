<%@ page language="java" import="java.util.*,dao.*,entity.*,java.text.*" pageEncoding="UTF-8"%>
<%	
//立即购买支付（作者：周华）
    //获得各个参数
    request.setCharacterEncoding("utf-8");//设置字符编码
    String hId=request.getParameter("address");//获得地址ID
    String shijian=request.getParameter("shijian");//获得配送时间
    String pass=request.getParameter("pass");//获得支付密码
    if(hId==null){
         session.setAttribute("404","无法完成支付，请先添加收货地址！");
    	 response.sendRedirect("../index/404.jsp");
    return;
    }
    String time=null;
    if(shijian.equals("1")){
    //获得当前时间
    Date date=new Date();
    DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    time=format.format(date);
    }else if(shijian.equals("0")){
    //获得用户选择的时间
    String day=request.getParameter("selectDay");
    String hour=request.getParameter("selectHour");
    String minu=request.getParameter("selectMinu");
    if(hour.equals("-1")||minu.equals("-1")){
         session.setAttribute("404","提交失败！您选择的时间有误！");
    	 response.sendRedirect("../index/404.jsp");
    	 return;
       }
       time=day+" "+hour+":"+minu;
    }
  //获取用户相关信息
  UsersInfo user=(UsersInfo)session.getAttribute("LOGIN");
  if(!pass.equals(user.getuTransPass())){//支付密码不匹配
    	 response.sendRedirect("../Book/shipping_Step3.jsp?pass=0");
    	 return;
  }
//获得当前选择的商品信息
DingdansInfo info=(DingdansInfo)session.getAttribute("LIJI");
  double price=Double.parseDouble(info.getdPrice());
  //计算新余额
  double balance=Double.parseDouble(user.getuBalance())-price;
  if(balance<0){//余额不足
         session.setAttribute("404","支付失败！您的余额不足！");
    	 response.sendRedirect("../index/404.jsp");
    	 return;
  }else{//修改用户余额
  DetailDao dao=new DetailDao();
  DingdansInfo dd=new DingdansInfo(null,time,"1",String.valueOf(price),user.getuId(),hId);
  int res=dao.addDingdan(dd);//创建订单
  if(res<=0){
         session.setAttribute("404","支付失败！订单创建未成功！");
    	 response.sendRedirect("../index/404.jsp");
    	 return;
  }
  DingdansInfo dd2=dao.getDingdansInfo(user.getuId());//读取生成的订单信息
  DetailsInfo de=new DetailsInfo(null,info.getgCount(),info.getgId(),dd2.getdId(),info.getDeBeizhu());
  int res2=dao.addDetail(de);
  if(res2<=0){
         session.setAttribute("404","订单详情添加失败！");
    	 response.sendRedirect("../index/404.jsp");
    	 return;
      }
 UserDao dao2=new UserDao();
  int res3=dao2.money(balance, user.getuId());//执行修改余额操作
  if(res3<=0){
         session.setAttribute("404","余额修改失败！");
    	 response.sendRedirect("../index/404.jsp");
    	 return;
  }
  GoodsDao dao3=new GoodsDao();
  int res4=dao3.upGood(info.getgCount(),info.getgId());
  if(res4<=0){
         session.setAttribute("404","已售数量修改失败！");
    	 response.sendRedirect("../index/404.jsp");
    	 return;
  }
         UsersInfo user2=new UsersInfo(user.getuId(),user.getuName(),user.getuPass(),user.getuPetname(),user.getuRealname(),user.getuSex(),user.getuEmail(),user.getuTransPass(),balance+"");
         session.setAttribute("LOGIN", user2);//刷新用户信息
    	 response.sendRedirect("../Book/shipping_Step4.jsp");
  }
%>