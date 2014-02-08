package com.action.xtgl;

import java.util.List;

import com.base.BaseAction;
import com.bean.RulerInfo;
import com.service.RulerService;

public class RulerAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	RulerService rulerService;
	List<RulerInfo> list;
	RulerInfo rulerInfo;
	
	public RulerService getRulerService() {
		return rulerService;
	}

	public void setRulerService(RulerService rulerService) {
		this.rulerService = rulerService;
	}

	public List<RulerInfo> getList() {
		return list;
	}

	public void setList(List<RulerInfo> list) {
		this.list = list;
	}

	public RulerInfo getRulerInfo() {
		return rulerInfo;
	}

	public void setRulerInfo(RulerInfo rulerInfo) {
		this.rulerInfo = rulerInfo;
	}

	@Override
	protected String handle() throws Exception {
		if(super.method.equals("query")){
			return query();
		}else if(super.method.equals("delete")){
			return delete();
		}else if (super.method.equals("add")) {
			return add();
		}else if (super.method.equals("beforeUpdate")) {
			return beforeUpdate();
		}else if (super.method.equals("update")) {
			return  update();
		}
		return null;
	}

	private String beforeUpdate() throws Exception  {
		int id=rulerInfo.getRulerId();
		list = rulerService.beforeUpdate(id);
		return "Update";
	}

	private String add() throws Exception {
		String result = rulerService.add(rulerInfo);
		rulerInfo=null;
		if(result.equals("ok"))
			return  query();
		else 
			return "error";
	}

	private String delete() throws Exception {
		int id=rulerInfo.getRulerId();
		String result = rulerService.delete(id);
		rulerInfo=null;
		if(result.equals("ok"))
			return  query();
		else 
			return "error";  
	}
 
	private String query() throws Exception {
		list = rulerService.query(rulerInfo);
		return "List";
	}
	
	public String update() throws Exception {
		int id=rulerInfo.getRulerId();
		String result = rulerService.update(id,rulerInfo);
		rulerInfo=null;
		if(result.equals("ok"))
			return query();
		else
			return "error";
	}
}
