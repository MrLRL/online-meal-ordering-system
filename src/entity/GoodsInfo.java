package entity;
//��Ʒ�� ʵ����
public class GoodsInfo {
	private String gId; //��ƷID
	 private String gName; //��Ʒ����
	 private String gPrice; //��Ʒ�۸�
	 private String gCaixi; //��ϵ
	 private String gFood; //ʳ��
	 private String gNum; //��������
	 private String gDetails; //���
	 private String gImage; //ͼƬ
	 private String gShangjia; //��Ʒ״̬        1Ϊ�ϼܣ�0Ϊ�¼�
	 
	 //���췽��
	 public GoodsInfo(){}
		public GoodsInfo(String id,String name,String price,String caixi,String food,String num,String image,String details,String shangjia){
			this.setgDetails(details);
			this.setgCaixi(caixi);
			this.setgId(id);
			this.setgNum(num);
			this.setgImage(image);
			this.setgName(name);
			this.setgPrice(price);
			this.setgShangjia(shangjia);
			this.setgFood(food);
		}
		public String getgId() {
			return gId;
		}
		public void setgId(String gId) {
			this.gId = gId;
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
		public String getgCaixi() {
			return gCaixi;
		}
		public void setgCaixi(String gCaixsi) {
			this.gCaixi = gCaixsi;
		}
		public String getgFood() {
			return gFood;
		}
		public void setgFood(String gFood) {
			this.gFood = gFood;
		}
		public String getgNum() {
			return gNum;
		}
		public void setgNum(String gNum) {
			this.gNum = gNum;
		}
		public String getgDetails() {
			return gDetails;
		}
		public void setgDetails(String gDetails) {
			this.gDetails = gDetails;
		}
		public String getgImage() {
			return gImage;
		}
		public void setgImage(String gImages) {
			this.gImage = gImages;
		}
		public String getgShangjia() {
			return gShangjia;
		}
		public void setgShangjia(String gShangjia) {
			this.gShangjia = gShangjia;
		}
}