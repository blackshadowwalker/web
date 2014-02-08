package com.bean;

import java.sql.Timestamp;

/**
 * UserLogin entity. @author MyEclipse Persistence Tools
 */

public class UserLogin implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer loginId;
	private String loginIp;
	private Timestamp loginTime;

	// Constructors

	/** default constructor */
	public UserLogin() {
	}

	/** minimal constructor */
	public UserLogin(Integer loginId, Timestamp loginTime) {
		this.loginId = loginId;
		this.loginTime = loginTime;
	}

	/** full constructor */
	public UserLogin(Integer loginId, String loginIp, Timestamp loginTime) {
		this.loginId = loginId;
		this.loginIp = loginIp;
		this.loginTime = loginTime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getLoginId() {
		return this.loginId;
	}

	public void setLoginId(Integer loginId) {
		this.loginId = loginId;
	}

	public String getLoginIp() {
		return this.loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public Timestamp getLoginTime() {
		return this.loginTime;
	}

	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}

}