package entity;
//收货信息表 实体类
public class HarvestsInfo {
	private String hId;   //收货信息ID
	private String uId;   //用户ID
	private String hAddress;   //配送地址
	private String hName;   //收货人姓名
	private String hTel;   //手机号码
	
	//构造方法
	public HarvestsInfo(){}
	public HarvestsInfo(String hid,String uid,String address,String name,String tel){
		this.sethAddress(address);
		this.sethId(hid);
		this.sethName(name);
		this.sethTel(tel);
		this.setuId(uid);
	}
	
	
	public String gethId() {
		return hId;
	}
	public void sethId(String hId) {
		this.hId = hId;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String gethAddress() {
		return hAddress;
	}
	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public String gethTel() {
		return hTel;
	}
	public void sethTel(String hTel) {
		this.hTel = hTel;
	}
}
