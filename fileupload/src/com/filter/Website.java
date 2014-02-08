package com.filter;

import java.util.ArrayList;
import java.util.List;

public class Website {
	private String name = "";
	private String title = "";
	private String url = "";
	private List<Host> hostlist = new ArrayList<Host>();
	
	public int Exist(String ip){
		int index =  -1;
		for(Host host : hostlist){
			index++;
			if(host.getIp().equals(ip))
			{
				break;
			}
		}
		return index;
	}
	
	public void  addIp(String ip){
		int index = Exist(ip);
		if(index>=0){
			hostlist.get(index).addConut();
		}
		else{
			Host e = new Host();
			e.setIp(ip);
			hostlist.add(e);
		}
	}
	
}
