package com.bean;

import java.sql.Timestamp;

/**
 * RulerInfo entity. @author MyEclipse Persistence Tools
 */

public class RulerInfo implements java.io.Serializable {

	// Fields

	private Integer rulerId;
	private String rulerName;
	private String rulerUrl;
	private Integer rulerLevel;
	private Integer rulerEcho;
	private String rulerManager;
	private String rulerTarget;
	private Integer order;
	private Timestamp lastUpdate;
	private Integer status;

	// Constructors

	/** default constructor */
	public RulerInfo() {
	}

	/** full constructor */
	public RulerInfo(String rulerName, String rulerUrl, Integer rulerLevel,
			Integer rulerEcho, String rulerManager, String rulerTarget,
			Integer order, Timestamp lastUpdate, Integer status) {
		this.rulerName = rulerName;
		this.rulerUrl = rulerUrl;
		this.rulerLevel = rulerLevel;
		this.rulerEcho = rulerEcho;
		this.rulerManager = rulerManager;
		this.rulerTarget = rulerTarget;
		this.order = order;
		this.lastUpdate = lastUpdate;
		this.status = status;
	}

	// Property accessors

	public Integer getRulerId() {
		return this.rulerId;
	}

	public void setRulerId(Integer rulerId) {
		this.rulerId = rulerId;
	}

	public String getRulerName() {
		return this.rulerName;
	}

	public void setRulerName(String rulerName) {
		this.rulerName = rulerName;
	}

	public String getRulerUrl() {
		return this.rulerUrl;
	}

	public void setRulerUrl(String rulerUrl) {
		this.rulerUrl = rulerUrl;
	}

	public Integer getRulerLevel() {
		return this.rulerLevel;
	}

	public void setRulerLevel(Integer rulerLevel) {
		this.rulerLevel = rulerLevel;
	}

	public Integer getRulerEcho() {
		return this.rulerEcho;
	}

	public void setRulerEcho(Integer rulerEcho) {
		this.rulerEcho = rulerEcho;
	}

	public String getRulerManager() {
		return this.rulerManager;
	}

	public void setRulerManager(String rulerManager) {
		this.rulerManager = rulerManager;
	}

	public String getRulerTarget() {
		return this.rulerTarget;
	}

	public void setRulerTarget(String rulerTarget) {
		this.rulerTarget = rulerTarget;
	}

	public Integer getOrder() {
		return this.order;
	}

	public void setOrder(Integer order) {
		this.order = order;
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