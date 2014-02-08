package com.domain;

/**
 * TSRolevalue entity. @author MyEclipse Persistence Tools
 */

public class TSRolevalue implements java.io.Serializable {

	// Fields

	private Integer id;
	private TSRole TSRole;
	private TSRuler TSRuler;
	private String ruleWord;
	private Integer status;

	// Constructors

	/** default constructor */
	public TSRolevalue() {
	}

	/** minimal constructor */
	public TSRolevalue(Integer status) {
		this.status = status;
	}

	/** full constructor */
	public TSRolevalue(TSRole TSRole, TSRuler TSRuler, String ruleWord,
			Integer status) {
		this.TSRole = TSRole;
		this.TSRuler = TSRuler;
		this.ruleWord = ruleWord;
		this.status = status;
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

	public TSRuler getTSRuler() {
		return this.TSRuler;
	}

	public void setTSRuler(TSRuler TSRuler) {
		this.TSRuler = TSRuler;
	}

	public String getRuleWord() {
		return this.ruleWord;
	}

	public void setRuleWord(String ruleWord) {
		this.ruleWord = ruleWord;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}