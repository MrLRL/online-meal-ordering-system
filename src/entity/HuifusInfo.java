package entity;
//���Իظ��� ʵ����
public class HuifusInfo {
	private String fId; //�ظ�ID
	private String lId;//����ID
	private String fNeirong;//�ظ�����
	private String fTime;//�ظ�ʱ��
	//���췽��
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
