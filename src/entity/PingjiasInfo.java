package entity;
//���۱� ʵ����
public class PingjiasInfo {
	private String pId;   //����Id
	private String uId;   //�û�ID
	private String gId;   //��ƷID
	private String pContent;   //��������
	private String pDate;   //����ʱ��
	private String pLeixing;   //�������� 1Ϊ������2Ϊ������3Ϊ����
	//����uPetName
	private String uPetname;   //�û��ǳ�
	//���췽��
	public PingjiasInfo(){}
	public PingjiasInfo(String id,String uid,String gId,String content,String date,String leixing){
		this.setgId(gId);
		this.setpContent(content);
		this.setpDate(date);
		this.setpId(pId);
		this.setpLeixing(leixing);
		this.setuId(uid);
		
	}
	public PingjiasInfo(String id,String uid,String gId,String content,String date,String leixing,String petname){
		this.setgId(gId);
		this.setpContent(content);
		this.setpDate(date);
		this.setpId(pId);
		this.setpLeixing(leixing);
		this.setuId(uid);
		this.setuPetname(petname);
	}
	
	public String getuPetname() {
		return uPetname;
	}
	public void setuPetname(String uPetname) {
		this.uPetname = uPetname;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getgId() {
		return gId;
	}
	public void setgId(String gId) {
		this.gId = gId;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public String getpLeixing() {
		return pLeixing;
	}
	public void setpLeixing(String pLeixing) {
		this.pLeixing = pLeixing;
	}

}
