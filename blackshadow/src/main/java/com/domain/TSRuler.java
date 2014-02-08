package com.domain;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * TSRuler entity. @author MyEclipse Persistence Tools
 */

public class TSRuler implements java.io.Serializable {

	// Fields

	private Integer id;
	private String rulerCode;
	private String rulerName;
	private String rulerPage;
	private String target;
	private Integer rulerLevel;
	private String parentCode;
	private Integer echo;
	private Integer order;
	private Timestamp updatedOn;
	private Integer status;
	private Set TSRolevalues = new HashSet(0);

	// Constructors

	/** default constructor */
	public TSRuler() {
	}

	/** minimal constructor */
	public TSRuler(Integer rulerLevel, Integer echo, Integer order,
			Integer status) {
		this.rulerLevel = rulerLevel;
		this.echo = echo;
		this.order = order;
		this.status = status;
	}

	/** full constructor */
	public TSRuler(String rulerCode, String rulerName, String rulerPage,
			String target, Integer rulerLevel, String parentCode, Integer echo,
			Integer order, Timestamp updatedOn, Integer status, Set TSRolevalues) {
		this.rulerCode = rulerCode;
		this.rulerName = rulerName;
		this.rulerPage = rulerPage;
		this.target = target;
		this.rulerLevel = rulerLevel;
		this.parentCode = parentCode;
		this.echo = echo;
		this.order = order;
		this.updatedOn = updatedOn;
		this.status = status;
		this.TSRolevalues = TSRolevalues;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRulerCode() {
		return this.rulerCode;
	}

	public void setRulerCode(String rulerCode) {
		this.rulerCode = rulerCode;
	}

	public String getRulerName() {
		return this.rulerName;
	}

	public void setRulerName(String rulerName) {
		this.rulerName = rulerName;
	}

	public String getRulerPage() {
		return this.rulerPage;
	}

	public void setRulerPage(String rulerPage) {
		this.rulerPage = rulerPage;
	}

	public String getTarget() {
		return this.target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public Integer getRulerLevel() {
		return this.rulerLevel;
	}

	public void setRulerLevel(Integer rulerLevel) {
		this.rulerLevel = rulerLevel;
	}

	public String getParentCode() {
		return this.parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	public Integer getEcho() {
		return this.echo;
	}

	public void setEcho(Integer echo) {
		this.echo = echo;
	}

	public Integer getOrder() {
		return this.order;
	}

	public void setOrder(Integer order) {
		this.order = order;
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

}