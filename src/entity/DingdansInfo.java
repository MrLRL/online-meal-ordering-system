package entity;
//订单表 实体类
public class DingdansInfo {
	private String dId;   //订单ID 
	private String dTime;  //下单时间
	private String dState;  //订单状态  1为待接单，2为待收货，3为交易成功，0为交易失败
	private String dPrice;  //订单总价 
	private String uId;  //用户ID 
	private String hId;  //收货信息ID
	//  uName, hTel, hAddress
	 //为了方便，添加一些属性
	private String uPetname;//用户昵称
	private String hTel;//电话号码
	private String hAddress;//地址
	//为了方便立即购买，添加一些属性
	private String gCount;   //商品数量
	private String deBeizhu;   //用户备注
	private String gId;//商品编号
	private String gName;//商品名称
	private String gPrice;//商品价格
	//构造方法
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
					//  gId,dPrice,dTime,gCount，deBeizhu，gName，gPrice
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
