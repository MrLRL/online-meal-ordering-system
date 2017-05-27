package entity;
//订单详情表 实体类
public class DetailsInfo {
	private String deld;   //订单详情ID
	private String gCount;   //商品数量
	private String gId;   //商品ID
	private String dId;   //订单ID
	private String deBeizhu;   //用户备注
	
	//新增属性，为方便查询
	private String gName;//商品名称
	private String gPrice;//商品价格
	//构造方法
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
