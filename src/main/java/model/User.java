package model;

public class User{
	private String id;
	private String fullName;
	private String email;
	private String password;
	private String repCode;
	
	public User(String id,String fullName,String email,String password,String repCode) {
		 this.id=id;
		 this.fullName=fullName;
		 this.email=email;
		 this.password=password;
		 this.repCode=repCode;
	}
	public User() {
		
	}
	
	public void setFullName(String fullName) {
		this.fullName=fullName;
	}
	
	public String getFullName() {
		return this.fullName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRepCode() {
		return repCode;
	}
	public void setRepCode(String repCode) {
		this.repCode = repCode;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", fullName=" + fullName + ", email=" + email + ", password=" + password
				+ ", repCode=" + repCode + "]";
	}
	
}
