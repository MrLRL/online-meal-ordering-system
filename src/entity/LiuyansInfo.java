package entity;
//���Ա� ʵ����
public class LiuyansInfo {
	private String lId; //����ID
	private String uId; //�û�ID
	private String lBiaoti; //���Ա���
	private String lNeirong;//�������� 
	private String lTime;//����ʱ��
	//	���췽��
	private String uPetName;
	
	public LiuyansInfo(){}
	public LiuyansInfo(String id,String uid,String biaoti,String neirong,String time){
		this.setlBiaoti(biaoti);
		this.setlId(id);
		this.setlNeirong(neirong);
		this.setlTime(time);
		this.setuId(uid);
	}
	public LiuyansInfo(String id,String uid,String biaoti ,String Petname,String time,String neirong){
		this.setlBiaoti(biaoti);
		this.setlId(id);
		this.setuId(uid);
		this.setlTime(time);
		this.setuPetName(Petname);
		this.setlNeirong(neirong);
	}
	public String getuPetName() {
		return uPetName;
	}
	public void setuPetName(String uPetName) {
		this.uPetName = uPetName;
	}
	public String getlId() {
		return lId;
	}
	public void setlId(String lId) {
		this.lId = lId;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getlBiaoti() {
		return lBiaoti;
	}
	public void setlBiaoti(String lBiaoti) {
		this.lBiaoti = lBiaoti;
	}
	public String getlNeirong() {
		return lNeirong;
	}
	public void setlNeirong(String lNeirong) {
		this.lNeirong = lNeirong;
	}
	public String getlTime() {
		return lTime;
	}
	public void setlTime(String lTime) {
		this.lTime = lTime;
	}
	
}
