package simplewebapp;

public class UserVo {

	public UserVo(String userName, String userPassword, String userConfirm, String userEmail) {
		super();
		this.userName = userName;
		this.userPassword = userPassword;
		this.userConfirm = userConfirm;
		this.userEmail = userEmail;
	}

	public UserVo(String userName2,String userEmail) {
		// TODO Auto-generated constructor stub
		this.userName = userName2;
		this.userEmail = userEmail;
	}

	public UserVo() {
		// TODO Auto-generated constructor stub
	}

	private String userName ;
	
	private String userPassword;
	
	private String userConfirm;
	
	private String userEmail;

	
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserPassword(String userPassword) {

		this.userPassword = userPassword;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public void setUserconfirm(String userConfirm) {
		this.userConfirm = userConfirm;

	}

	public String getUserName() {
		return userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public String getuserConfirm() {
		return userConfirm;
	}

}
