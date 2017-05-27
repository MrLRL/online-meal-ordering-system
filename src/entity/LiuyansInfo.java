package entity;
//留言表 实体类
public class LiuyansInfo {
	private String lId; //留言ID
	private String uId; //用户ID
	private String lBiaoti; //留言标题
	private String lNeirong;//留言内容 
	private String lTime;//留言时间
	//	构造方法
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
