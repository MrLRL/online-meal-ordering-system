package entity;
//����Ա�˻��� ʵ����
public class AdminInfo {
	private String Id;   //����ԱID
	private String Name;   //����Ա�˻�
	private String Pass;   //����Ա����
	private String PetName; //����Ա�ǳ�
	//���췽��
	public AdminInfo(){}
	public AdminInfo(String id,String name,String pass,String petname){
		this.setId(id);
		this.setName(name);
		this.setPass(pass);
		this.setPetName(petname);
	}

	
	public String getPetName() {
		return PetName;
	}
	public void setPetName(String petName) {
		PetName = petName;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getPass() {
		return Pass;
	}
	public void setPass(String pass) {
		Pass = pass;
	}
	

}
