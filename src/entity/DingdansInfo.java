package entity;
//������ ʵ����
public class DingdansInfo {
	private String dId;   //����ID 
	private String dTime;  //�µ�ʱ��
	private String dState;  //����״̬  1Ϊ���ӵ���2Ϊ���ջ���3Ϊ���׳ɹ���0Ϊ����ʧ��
	private String dPrice;  //�����ܼ� 
	private String uId;  //�û�ID 
	private String hId;  //�ջ���ϢID
	//  uName, hTel, hAddress
	 //Ϊ�˷��㣬���һЩ����
	private String uPetname;//�û��ǳ�
	private String hTel;//�绰����
	private String hAddress;//��ַ
	//Ϊ�˷��������������һЩ����
	private String gCount;   //��Ʒ����
	private String deBeizhu;   //�û���ע
	private String gId;//��Ʒ���
	private String gName;//��Ʒ����
	private String gPrice;//��Ʒ�۸�
	//���췽��
			public DingdansInfo(){}
			public DingdansInfo(String id,String time,String state,String Price,String uid,String hid){
				this.setdId(id);
				this.setdPrice(Price);
				this.setdState(state);
				this.setdTime(time);
				this.setuId(uid);
				this.sethId(hid);
			}
		//  uId, uPetName, dPrice,hTel,dTime,hAddress
					public DingdansInfo(String dId,String uId,String uPetname,String dPrice,String hTel,String dTime,String hAddress,String state){
						this.sethTel(hTel);
						this.setdId(dId);
						this.setdPrice(dPrice);
					    this.setdTime(dTime);
					    this.setdState(state);
					    this.sethAddress(hAddress);
					    this.setuId(uId);
					    this.setuPetname(uPetname);
					}
					//  gId,dPrice,dTime,gCount��deBeizhu��gName��gPrice
					public DingdansInfo(String dId,String gId,String dPrice,String gCount,String deBeizhu,String gName,String gPrice){
						this.setdId(dId);
						this.setdPrice(dPrice);
						this.setgId(gId);
					    this.setgCount(gCount);
					    this.setDeBeizhu(deBeizhu);
					    this.setgName(gName);
					    this.setgPrice(gPrice);
					}
	
	        public String getgId() {
						return gId;
					}
					public void setgId(String gId) {
						this.gId = gId;
					}
			public String getgCount() {
				return gCount;
			}
			public void setgCount(String gCount) {
				this.gCount = gCount;
			}
			public String getDeBeizhu() {
				return deBeizhu;
			}
			public void setDeBeizhu(String deBeizhu) {
				this.deBeizhu = deBeizhu;
			}
			public String getgName() {
				return gName;
			}
			public void setgName(String gName) {
				this.gName = gName;
			}
			public String getgPrice() {
				return gPrice;
			}
			public void setgPrice(String gPrice) {
				this.gPrice = gPrice;
			}
	public String getuPetname() {
				return uPetname;
			}
			public void setuPetname(String uPetname) {
				this.uPetname = uPetname;
			}
	public String gethTel() {
		return hTel;
	}
	public void sethTel(String hTel) {
		this.hTel = hTel;
	}
	public String gethAddress() {
		return hAddress;
	}
	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}
	public String getdId() {
		return dId;
	}
	public void setdId(String dId) {
		this.dId = dId;
	}
	 
	public String getdTime() {
		return dTime;
	}
	public void setdTime(String dTime) {
		this.dTime = dTime;
	}
	public String getdState() {
		return dState;
	}
	public void setdState(String dState) {
		this.dState = dState;
	}
	public String getdPrice() {
		return dPrice;
	}
	public void setdPrice(String dPrice) {
		this.dPrice = dPrice;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String gethId() {
		return hId;
	}
	public void sethId(String hId) {
		this.hId = hId;
	}

}
