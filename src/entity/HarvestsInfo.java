package entity;
//�ջ���Ϣ�� ʵ����
public class HarvestsInfo {
	private String hId;   //�ջ���ϢID
	private String uId;   //�û�ID
	private String hAddress;   //���͵�ַ
	private String hName;   //�ջ�������
	private String hTel;   //�ֻ�����
	
	//���췽��
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
