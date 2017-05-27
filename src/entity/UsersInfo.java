package entity;
//用户表 实体类
public class UsersInfo {
 private String uId; //用户ID
 private String uName; //用户名
 private String uPass;//密码
 private String uPetname; //昵称
 private String uRealname;//真实姓名
private String uSex; //性别
 private String uEmail; //邮箱
 private String uTransPass; //交易密码
 private String uBalance; //余额
 
 //构造方法
 public UsersInfo(){}
	public UsersInfo(String id,String name,String pass,String petname,String realname,String sex,String email,String transpass,String balance){
	 this.setuBalance(balance);
	 this.setuEmail(email);
	 this.setuId(id);
	 this.setuName(name);
	 this.setuPass(pass);
	 this.setuPetname(petname);
	 this.setuSex(sex);
	 this.setuRealname(realname);
	this.setuTransPass(transpass);
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPass() {
		return uPass;
	}
	public void setuPass(String uPass) {
		this.uPass = uPass;
	}
	public String getuPetname() {
		return uPetname;
	}
	public void setuPetname(String uPetname) {
		this.uPetname = uPetname;
	}
	public String getuRealname() {
		return uRealname;
	}
	public void setuRealname(String uRealname) {
		this.uRealname = uRealname;
	}
	public String getuSex() {
		return uSex;
	}
	public void setuSex(String uSex) {
		this.uSex = uSex;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getuTransPass() {
		return uTransPass;
	}
	public void setuTransPass(String uTransPass) {
		this.uTransPass = uTransPass;
	}
	public String getuBalance() {
		return uBalance;
	}
	public void setuBalance(String uBalance) {
		this.uBalance = uBalance;
	}
}
 