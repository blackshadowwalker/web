package com.filter;

public class Host {
	
	private String ip;
	private String hostname;
	private long	conut=0;
	
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public long getConut() {
		return conut;
	}
	public void setConut(long conut) {
		this.conut = conut;
	}
	public void addConut() {
		this.conut ++;
	}
	
	
}
