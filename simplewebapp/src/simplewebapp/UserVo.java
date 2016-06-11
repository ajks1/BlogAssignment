package simplewebapp;

import java.io.Serializable;
import java.util.Date;

public class UserVo implements Serializable{

	public UserVo(String userName, String userPassword, String userConfirm, String userEmail) {
		super();
		this.userName = userName;
		this.userPassword = userPassword;
		this.userConfirm = userConfirm;
		this.userEmail = userEmail;
	}

	public UserVo(String userName,String userEmail, String name, String title, Date birthday,String occupation, String city,
			String country, String travel,String favourite,Integer userId) {
		// TODO Auto-generated constructor stub
		this.userName = userName;
		//this.profilePhoto = profilePhoto;
		this.userEmail = userEmail;
		this.name = name;
		this.title = title;
		this.birthday = birthday;
		this.occupation = occupation;
		this.city = city;
		this.country = country;
		this.travel =travel;
		this.favourite = favourite;
		this.userId =userId;
		
	}

	public UserVo() {
		// TODO Auto-generated constructor stub

	}
	
	private Integer userId;
	private String profilePhoto;
	
	private Date birthday;
	private String travel;
	private String favourite;
	private String country;
	private String city;
	private String name;
	private String title;

	private String userName;

	private String userPassword;

	private String userConfirm;

	private String userEmail;
	private String occupation;

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getTravel() {
		return travel;
	}

	public void setTravel(String travel) {
		this.travel = travel;
	}

	public String getFavourite() {
		return favourite;
	}

	public void setFavourite(String favourite) {
		this.favourite = favourite;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getProfilePhoto() {
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}
