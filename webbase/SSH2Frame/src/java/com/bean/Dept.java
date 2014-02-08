package com.bean;

public class Dept implements java.io.Serializable{
	
	private Integer deptId;
	private String deptName;
	private Integer pid;
	private String deptManager;
	private String lastUpdate;
	private Integer status;
	
	public Dept(){}
	public Dept(Integer deptId,String deptName,Integer pid,String deptManager,String lastUpdate){
		this.deptId=deptId;
		this.deptName=deptName;
		this.pid=pid;
		this.deptManager=deptManager;
		this.lastUpdate=lastUpdate;
	}
	
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptManager() {
		return deptManager;
	}
	public void setDeptManager(String deptManager) {
		this.deptManager = deptManager;
	}
	public String getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	
	
}
