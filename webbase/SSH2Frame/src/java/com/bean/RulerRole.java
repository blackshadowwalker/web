package com.bean;

import java.sql.Timestamp;

/**
 * RulerRole entity. @author MyEclipse Persistence Tools
 */

public class RulerRole implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer roleId;
	private Integer rulerId;
	private String rulerWord;
	private Timestamp lastUpdate;
	private Integer status;

	// Constructors

	/** default constructor */
	public RulerRole() {
	}

	/** full constructor */
	public RulerRole(Integer roleId, Integer rulerId, String rulerWord,
			Timestamp lastUpdate, Integer status) {
		this.roleId = roleId;
		this.rulerId = rulerId;
		this.rulerWord = rulerWord;
		this.lastUpdate = lastUpdate;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getRulerId() {
		return this.rulerId;
	}

	public void setRulerId(Integer rulerId) {
		this.rulerId = rulerId;
	}

	public String getRulerWord() {
		return this.rulerWord;
	}

	public void setRulerWord(String rulerWord) {
		this.rulerWord = rulerWord;
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