package entity;
//��������� ʵ����
public class DetailsInfo {
	private String deld;   //��������ID
	private String gCount;   //��Ʒ����
	private String gId;   //��ƷID
	private String dId;   //����ID
	private String deBeizhu;   //�û���ע
	
	//�������ԣ�Ϊ�����ѯ
	private String gName;//��Ʒ����
	private String gPrice;//��Ʒ�۸�
	//���췽��
	public DetailsInfo(){}
	public DetailsInfo(String gName,String gCount,String deBeizhu,String gPrice){
		this.setgName(gName);
		this.setgCount(gCount);
		this.setDeBeizhu(deBeizhu);
		this.setgPrice(gPrice);
		
	}
	public DetailsInfo(String deld,String count,String gid,String did,String beizhu){
		this.setDeBeizhu(beizhu);
		this.setDeld(deld);
		this.setgCount(count);
		this.setgId(gid);
		this.setdId(did);
		
	}
	
	

	public String getgPrice() {
		return gPrice;
	}
	public void setgPrice(String gPrice) {
		this.gPrice = gPrice;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getDeld() {
		return deld;
	}
	public void setDeld(String deld) {
		this.deld = deld;
	}
	public String getgCount() {
		return gCount;
	}
	public void setgCount(String gCount) {
		this.gCount = gCount;
	}
	public String getgId() {
		return gId;
	}
	public void setgId(String gId) {
		this.gId = gId;
	}
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	public String getDeBeizhu() {
		return deBeizhu;
	}
	public void setDeBeizhu(String deBeizhu) {
		this.deBeizhu = deBeizhu;
	}
	

}
