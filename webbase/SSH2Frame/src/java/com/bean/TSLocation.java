package com.bean;

import java.sql.Timestamp;

/**
 * TSLocation entity. @author MyEclipse Persistence Tools
 */

public class TSLocation implements java.io.Serializable {

	// Fields

	private Integer id;
	private String locationId;
	private String locationName;
	private String adminAreaCode;
	private String longitude;
	private String latiTude;
	private Integer mapScaling;
	private String parentLocationId;
	private Timestamp ctTime;
	private Integer status;

	// Constructors

	/** default constructor */
	public TSLocation() {
	}

	/** full constructor */
	public TSLocation(String locationId, String locationName,
			String adminAreaCode, String longitude, String latiTude,
			Integer mapScaling, String parentLocationId, Timestamp ctTime,
			Integer status) {
		this.locationId = locationId;
		this.locationName = locationName;
		this.adminAreaCode = adminAreaCode;
		this.longitude = longitude;
		this.latiTude = latiTude;
		this.mapScaling = mapScaling;
		this.parentLocationId = parentLocationId;
		this.ctTime = ctTime;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLocationId() {
		return this.locationId;
	}

	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}

	public String getLocationName() {
		return this.locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getAdminAreaCode() {
		return this.adminAreaCode;
	}

	public void setAdminAreaCode(String adminAreaCode) {
		this.adminAreaCode = adminAreaCode;
	}

	public String getLongitude() {
		return this.longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatiTude() {
		return this.latiTude;
	}

	public void setLatiTude(String latiTude) {
		this.latiTude = latiTude;
	}

	public Integer getMapScaling() {
		return this.mapScaling;
	}

	public void setMapScaling(Integer mapScaling) {
		this.mapScaling = mapScaling;
	}

	public String getParentLocationId() {
		return this.parentLocationId;
	}

	public void setParentLocationId(String parentLocationId) {
		this.parentLocationId = parentLocationId;
	}

	public Timestamp getCtTime() {
		return this.ctTime;
	}

	public void setCtTime(Timestamp ctTime) {
		this.ctTime = ctTime;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}