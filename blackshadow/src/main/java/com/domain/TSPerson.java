package com.domain;

import java.sql.Timestamp;

/**
 * TSPerson entity. @author MyEclipse Persistence Tools
 */

public class TSPerson implements java.io.Serializable {

	// Fields

	private Integer id;
	private TSRole TSRole;
	private String userCode;
	private String userName;
	private String password;
	private String language;
	private String email;
	private String photo;
	private Integer status;
	private Timestamp createdOn;
	private Timestamp updatedOn;
	private Timestamp lastLoginOn;
	private String lastLoginAt;

	// Constructors

	/** default constructor */
	public TSPerson() {
	}

	/** minimal constructor */
	public TSPerson(Integer status) {
		this.status = status;
	}

	/** full constructor */
	public TSPerson(TSRole TSRole, String userCode, String userName,
			String password, String language, String email, String photo,
			Integer status, Timestamp createdOn, Timestamp updatedOn,
			Timestamp lastLoginOn, String lastLoginAt) {
		this.TSRole = TSRole;
		this.userCode = userCode;
		this.userName = userName;
		this.password = password;
		this.language = language;
		this.email = email;
		this.photo = photo;
		this.status = status;
		this.createdOn = createdOn;
		this.updatedOn = updatedOn;
		this.lastLoginOn = lastLoginOn;
		this.lastLoginAt = lastLoginAt;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TSRole getTSRole() {
		return this.TSRole;
	}

	public void setTSRole(TSRole TSRole) {
		this.TSRole = TSRole;
	}

	public String getUserCode() {
		return this.userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLanguage() {
		return this.language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Timestamp getCreatedOn() {
		return this.createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public Timestamp getUpdatedOn() {
		return this.updatedOn;
	}

	public void setUpdatedOn(Timestamp updatedOn) {
		this.updatedOn = updatedOn;
	}

	public Timestamp getLastLoginOn() {
		return this.lastLoginOn;
	}

	public void setLastLoginOn(Timestamp lastLoginOn) {
		this.lastLoginOn = lastLoginOn;
	}

	public String getLastLoginAt() {
		return this.lastLoginAt;
	}

	public void setLastLoginAt(String lastLoginAt) {
		this.lastLoginAt = lastLoginAt;
	}

}