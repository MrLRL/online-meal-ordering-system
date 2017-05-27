package entity;
//管理员账户表 实体类
public class AdminInfo {
	private String Id;   //管理员ID
	private String Name;   //管理员账户
	private String Pass;   //管理员密码
	private String PetName; //管理员昵称
	//构造方法
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
