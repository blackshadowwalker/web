package com.bean;

import java.sql.Timestamp;

/**
 * UserInfo entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userName;
	private String userPasswd;
	private String userRole;
	private Timestamp userBirth;
	private String userPhoto;
	private String userDepartment;
	private Timestamp lastUpdate;
	private Integer status;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userName, String userPasswd) {
		this.userName = userName;
		this.userPasswd = userPasswd;
	}

	/** full constructor */
	public User(String userName, String userPasswd, String userRole,
			Timestamp userBirth, String userPhoto, String userDepartment,
			Timestamp lastUpdate, Integer status) {
		this.userName = userName;
		this.userPasswd = userPasswd;
		this.userRole = userRole;
		this.userBirth = userBirth;
		this.userPhoto = userPhoto;
		this.userDepartment = userDepartment;
		this.lastUpdate = lastUpdate;
		this.status = status;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPasswd() {
		return this.userPasswd;
	}

	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}

	public String getUserRole() {
		return this.userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public Timestamp getUserBirth() {
		return this.userBirth;
	}

	public void setUserBirth(Timestamp userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserPhoto() {
		return this.userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public String getUserDepartment() {
		return this.userDepartment;
	}

	public void setUserDepartment(String userDepartment) {
		this.userDepartment = userDepartment;
	}

	public Timestamp getLastUpdate() {
		return this.lastUpdate;
	}

	public void setLastUpdate(Timestamp lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}