package com.bean;

import java.sql.Timestamp;

/**
 * UserInfo entity. @author MyEclipse Persistence Tools
 */

public class UserInfo implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userName;
	private String userPasswd;
	private Integer userRole;
	private Timestamp userBirth;
	private String userPhoto;
	private Integer userDepartment;
	private Timestamp lastUpdate;
	private Integer status;

	// Constructors

	/** default constructor */
	public UserInfo() {
	}

	/** minimal constructor */
	public UserInfo(String userName, String userPasswd) {
		this.userName = userName;
		this.userPasswd = userPasswd;
	}

	/** full constructor */
	public UserInfo(String userName, String userPasswd, Integer userRole,
			Timestamp userBirth, String userPhoto, Integer userDepartment,
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

	public Integer getUserRole() {
		return this.userRole;
	}

	public void setUserRole(Integer userRole) {
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

	public Integer getUserDepartment() {
		return this.userDepartment;
	}

	public void setUserDepartment(Integer userDepartment) {
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