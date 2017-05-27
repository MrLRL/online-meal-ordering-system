package entity;
//留言回复表 实体类
public class HuifusInfo {
	private String fId; //回复ID
	private String lId;//留言ID
	private String fNeirong;//回复内容
	private String fTime;//回复时间
	//构造方法
	public HuifusInfo(){}
	public HuifusInfo(String id,String lid,String neirong,String time){
		this.setfId(id);
		this.setfNeirong(neirong);
		this.setfTime(time);
		this.setlId(lid);
	}
	
	public String getfId() {
		return fId;
	}
	public void setfId(String fId) {
		this.fId = fId;
	}
	public String getlId() {
		return lId;
	}
	public void setlId(String lId) {
		this.lId = lId;
	}
	public String getfNeirong() {
		return fNeirong;
	}
	public void setfNeirong(String fNeirong) {
		this.fNeirong = fNeirong;
	}
	public String getfTime() {
		return fTime;
	}
	public void setfTime(String fTime) {
		this.fTime = fTime;
	}
}
