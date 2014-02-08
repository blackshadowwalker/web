package com.bean;

/**
 * DeptInfo entity. @author MyEclipse Persistence Tools
 */

public class DeptInfo implements java.io.Serializable {

	// Fields

	private Integer deptId;
	private String deptName;
	private Integer deptManager;
	private String lastUpdate;
	private Integer status;

	// Constructors

	/** default constructor */
	public DeptInfo() {
	}

	/** minimal constructor */
	public DeptInfo(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	/** full constructor */
	public DeptInfo(String deptName, Integer deptManager, String lastUpdate,
			Integer status) {
		this.deptName = deptName;
		this.deptManager = deptManager;
		this.lastUpdate = lastUpdate;
		this.status = status;
	}

	// Property accessors

	public Integer getDeptId() {
		return this.deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Integer getDeptManager() {
		return this.deptManager;
	}

	public void setDeptManager(Integer deptManager) {
		this.deptManager = deptManager;
	}

	public String getLastUpdate() {
		return this.lastUpdate;
	}

	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}