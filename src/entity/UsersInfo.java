package entity;
//�û��� ʵ����
public class UsersInfo {
 private String uId; //�û�ID
 private String uName; //�û���
 private String uPass;//����
 private String uPetname; //�ǳ�
 private String uRealname;//��ʵ����
private String uSex; //�Ա�
 private String uEmail; //����
 private String uTransPass; //��������
 private String uBalance; //���
 
 //���췽��
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
 