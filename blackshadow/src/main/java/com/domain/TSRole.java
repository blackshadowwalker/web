package com.domain;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * TSRole entity. @author MyEclipse Persistence Tools
 */

public class TSRole implements java.io.Serializable {

	// Fields

	private Integer id;
	private String roleCode;
	private String roleName;
	private Timestamp updatedOn;
	private Integer status;
	private Set TSRolevalues = new HashSet(0);
	private Set TSPersons = new HashSet(0);

	// Constructors

	/** default constructor */
	public TSRole() {
	}

	/** minimal constructor */
	public TSRole(Integer status) {
		this.status = status;
	}

	/** full constructor */
	public TSRole(String roleCode, String roleName, Timestamp updatedOn,
			Integer status, Set TSRolevalues, Set TSPersons) {
		this.roleCode = roleCode;
		this.roleName = roleName;
		this.updatedOn = updatedOn;
		this.status = status;
		this.TSRolevalues = TSRolevalues;
		this.TSPersons = TSPersons;
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

	public Timestamp getUpdatedOn() {
		return this.updatedOn;
	}

	public void setUpdatedOn(Timestamp updatedOn) {
		this.updatedOn = updatedOn;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set getTSRolevalues() {
		return this.TSRolevalues;
	}

	public void setTSRolevalues(Set TSRolevalues) {
		this.TSRolevalues = TSRolevalues;
	}

	public Set getTSPersons() {
		return this.TSPersons;
	}

	public void setTSPersons(Set TSPersons) {
		this.TSPersons = TSPersons;
	}

}