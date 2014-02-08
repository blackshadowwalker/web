package com.bean;

import java.sql.Timestamp;

/**
 * TSNvr entity. @author MyEclipse Persistence Tools
 */

public class TSNvr implements java.io.Serializable {

	// Fields

	private Integer id;
	private String nvrCode;
	private String nvrName;
	private String nvrIp;
	private Integer port;
	private String longitude;
	private String latitude;
	private Integer mapScaling;
	private String userName;
	private String passWord;
	private Integer status;
	private Timestamp ctTime;

	// Constructors

	/** default constructor */
	public TSNvr() {
	}

	/** full constructor */
	public TSNvr(String nvrCode, String nvrName, String nvrIp, Integer port,
			String longitude, String latitude, Integer mapScaling,
			String userName, String passWord, Integer status, Timestamp ctTime) {
		this.nvrCode = nvrCode;
		this.nvrName = nvrName;
		this.nvrIp = nvrIp;
		this.port = port;
		this.longitude = longitude;
		this.latitude = latitude;
		this.mapScaling = mapScaling;
		this.userName = userName;
		this.passWord = passWord;
		this.status = status;
		this.ctTime = ctTime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNvrCode() {
		return this.nvrCode;
	}

	public void setNvrCode(String nvrCode) {
		this.nvrCode = nvrCode;
	}

	public String getNvrName() {
		return this.nvrName;
	}

	public void setNvrName(String nvrName) {
		this.nvrName = nvrName;
	}

	public String getNvrIp() {
		return this.nvrIp;
	}

	public void setNvrIp(String nvrIp) {
		this.nvrIp = nvrIp;
	}

	public Integer getPort() {
		return this.port;
	}

	public void setPort(Integer port) {
		this.port = port;
	}

	public String getLongitude() {
		return this.longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return this.latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public Integer getMapScaling() {
		return this.mapScaling;
	}

	public void setMapScaling(Integer mapScaling) {
		this.mapScaling = mapScaling;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return this.passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Timestamp getCtTime() {
		return this.ctTime;
	}

	public void setCtTime(Timestamp ctTime) {
		this.ctTime = ctTime;
	}

}