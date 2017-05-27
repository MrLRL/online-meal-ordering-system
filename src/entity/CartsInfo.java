package entity;
//购物车表 实体类
public class CartsInfo {
	private String cartId; //购物车Id
	private String gCount; //商品数量 
	private String gId; //商品ID
	private String uId; //用户ID
	private String cBeizhu;//订单备注
//为了方便，新增数据
	 private String gName; //商品名称
	 private String gPrice; //商品价格
	//构造方法
	public CartsInfo(){}
    public CartsInfo(String id,String count,String gId,String uid,String beizhu){
		  this.setCartId(id);
		  this.setgCount(count);
		  this.setgId(gId);
		  this.setuId(uid);
		  this.setcBeizhu(beizhu);
	  }
	  public CartsInfo(String id,String count,String gId,String gName,String beizhu,String gPrice){
		  this.setCartId(id);
		  this.setgCount(count);
		  this.setgId(gId);
		  this.setgName(gName);
		  this.setcBeizhu(beizhu);
		  this.setgPrice(gPrice);
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
	public String getCartId() {
		return cartId;
	}
	public void setCartId(String cartId) {
		this.cartId = cartId;
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
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getcBeizhu() {
		return cBeizhu;
	}
	public void setcBeizhu(String cBeizhu) {
		this.cBeizhu = cBeizhu;
	}
	
}
