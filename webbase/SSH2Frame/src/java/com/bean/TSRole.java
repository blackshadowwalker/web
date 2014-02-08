package com.bean;

import java.sql.Timestamp;

/**
 * TSRole entity. @author MyEclipse Persistence Tools
 */

public class TSRole implements java.io.Serializable {

	// Fields

	private Integer id;
	private String roleCode;
	private String roleName;
	private Integer deptLevel;
	private Integer sfld;
	private Integer sftq;
	private Timestamp tstamp;
	private Integer status;
	private Integer gwjb;

	// Constructors

	/** default constructor */
	public TSRole() {
	}

	/** minimal constructor */
	public TSRole(String roleCode, String roleName) {
		this.roleCode = roleCode;
		this.roleName = roleName;
	}

	/** full constructor */
	public TSRole(String roleCode, String roleName, Integer deptLevel,
			Integer sfld, Integer sftq, Timestamp tstamp, Integer status,
			Integer gwjb) {
		this.roleCode = roleCode;
		this.roleName = roleName;
		this.deptLevel = deptLevel;
		this.sfld = sfld;
		this.sftq = sftq;
		this.tstamp = tstamp;
		this.status = status;
		this.gwjb = gwjb;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRoleCode() {
		return this.roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Integer getDeptLevel() {
		return this.deptLevel;
	}

	public void setDeptLevel(Integer deptLevel) {
		this.deptLevel = deptLevel;
	}

	public Integer getSfld() {
		return this.sfld;
	}

	public void setSfld(Integer sfld) {
		this.sfld = sfld;
	}

	public Integer getSftq() {
		return this.sftq;
	}

	public void setSftq(Integer sftq) {
		this.sftq = sftq;
	}

	public Timestamp getTstamp() {
		return this.tstamp;
	}

	public void setTstamp(Timestamp tstamp) {
		this.tstamp = tstamp;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getGwjb() {
		return this.gwjb;
	}

	public void setGwjb(Integer gwjb) {
		this.gwjb = gwjb;
	}

}