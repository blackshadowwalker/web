package com.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import com.base.BaseAction;
import com.bean.Dept;
import com.bean.DeptInfo;
import com.service.DeptService;
import net.sf.json.JSONArray;
/**
 * @author Administrator
 *
 */
public class DeptAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	DeptService deptService;
	List<DeptInfo> list;
	List<Dept> listDeptBean;
	DeptInfo dept;
	Dept deptBean;

	int id;
	static String sname;
	static String smanager;
	

	@Override
	protected String handle() throws Exception {
		// TODO Auto-generated method stub
		if(method.equals("query")){
			return query();
		}
		else if(method.equals("getDeptView")){
			return getDeptView();
		}
		else if(method.equals("deptBeforAdd")){
			return deptBeforAdd();
		}
		else if(method.equals("deptAdd")){
			return deptAdd();
		}
		else if(method.equals("deptBeforUpdate")){
			return deptBeforUpdate();
		}
		else if(method.equals("deptUpdate")){
			return deptUpdate();
		}
		else if(method.equals("deptDel")){
			return deptDel();
		}
		else if(method.equals("listTree")){
			 listTree();
		}
		else if(method.equals("listTreeView")){
			listTreeView();
		}
		return null;
	}
	private String query(){
		
	/*	JSONArray json=deptService.queryDept();
		String str=json.toString();
		request.setAttribute("str", str);
		System.out.println("=============================");
		System.out.println(json);

		if(json.size()==0)
			return "error";*/
		return "list";
	}
	private void listTree(){

		JSONArray json=deptService.queryDept();
		//System.out.println("json::::"+json);
		String jsonstr=json.toString();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		response.setHeader("pragma", "no-cache");  
		response.setHeader("cache-control", "no-cache");
		try {
			response.getWriter().write(jsonstr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	private String getDeptView(){
		//System.out.println("111111111111111111111111111111111111111");
		sname=deptBean.getDeptName();
		smanager=deptBean.getDeptManager();
		
		return "deptView";
	}
	
	private void listTreeView(){

		System.out.println("2222222222222222222222222222222222222");
		
		System.out.println(sname);
		System.out.println(smanager);
		System.out.println("444444444444444444444444444444444");
		JSONArray json=deptService.getDeptView(sname,smanager);
		String jsonstr=json.toString();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		response.setHeader("pragma", "no-cache");  
		response.setHeader("cache-control", "no-cache");
		System.out.println(jsonstr);
		System.out.println("333333333333333333333333333333333333");
		
		try {
			response.getWriter().write(jsonstr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/*
	 	private String query(){
		list=deptService.queryDept();
		
		for(int i=0;i<list.size();i++){
			System.out.println("=======================");
			System.out.println(list.get(i).getDeptId());
			System.out.println(list.get(i).getDeptName());
			System.out.println(list.get(i).getDeptManager());
			System.out.println(list.get(i).getLastUpdate());
			System.out.println("=======================");
		}
		
		if(list.size()==0)
			return "error";
		return "list";
	}
	*/
	/*private String getDeptView(){
		System.out.println("=======================");
		System.out.println(dept.getDeptName());
		System.out.println(dept.getDeptManager());
		//System.out.println(dept.getLastUpdate());
		System.out.println("=======================");
		
		list=deptService.getDeptView(dept.getDeptName(),dept.getDeptManager());
		
		if(list.size()==0)
			return "error";
		
		return "deptView";
	}*/
	
	private String deptBeforAdd() throws UnsupportedEncodingException{

		request.setAttribute("deptId", id);
		request.setAttribute("managerName", new String(sname.getBytes("ISO-8859-1"),"utf-8"));
		
		return "deptBeforAdd";
	}
	
	private String deptAdd(){
		/*System.out.println("========add===========");
		System.out.println(dept.getDeptName());
		System.out.println(dept.getDeptManager());*/
		
		String res=deptService.deptAdd(dept);
		if(res.equals("true"))
			 return query();
		if(res.equals("managerError")){
			request.setAttribute("managerError", "managerError");
			return "addManagerError";
		}
		if(res.equals("nameError")){
			request.setAttribute("nameError", "nameError");
			return "addNameError";
		}
		return "error";
	}
	
	private String deptBeforUpdate(){
		//System.out.println("=======================begin1");
		listDeptBean=deptService.deptBeforUpdate(id);
		/*System.out.println("=======================begin2");
		for(int i=0;i<listDeptBean.size();i++){
			System.out.println(listDeptBean.get(i).getDeptId());
			System.out.println(listDeptBean.get(i).getDeptName());
			System.out.println(listDeptBean.get(i).getPid());
			System.out.println(listDeptBean.get(i).getDeptManager());
			System.out.println(listDeptBean.get(i).getLastUpdate());
		}
		System.out.println("=======================begin3");*/
		
		if(listDeptBean!=null)
			return "deptBeforUpdate";
		else
			return "error";
	}
	private String deptUpdate(){
		
		/*System.out.println("=======================update1");
		System.out.println(deptBean.getDeptId());
		System.out.println(deptBean.getDeptName());
		System.out.println(deptBean.getPid());
		System.out.println(deptBean.getDeptManager());
		
		System.out.println("=======================update2");*/
		
		String str=deptService.deptUpdate(id,deptBean);
		if(str.equals("true"))
			return query();
		if(str.equals("managerError")){
			request.setAttribute("managerError", "managerError");
			return "updateManagerError";
		}
		if(str.equals("nameError")){
			request.setAttribute("nameError", "nameError");
			return "updateNameError";
		}
		return "error";
	}
	/*
	private String deptBeforDel(){
		//System.out.println("=======================begin1");
		list=deptService.deptBeforDel(id);
		System.out.println("=======================begin2");
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getDeptId());
			System.out.println(list.get(i).getDeptName());
			System.out.println(list.get(i).getDeptManager());
			System.out.println(list.get(i).getLastUpdate());
			System.out.println(list.get(i).getStatus());
		}
		System.out.println("=======================begin3");
		
		if(list!=null)
			return "deptBeforDel";
		else
			return "error";
	}
	*/
	private String deptDel(){
		boolean flag=deptService.deptDel(id);
		
		if(flag==true)
			return query();
		else
			return "error";
	}
	
	/*
	public String execute(){
		list=deptService.queryDept();
		
		return "list";
		
		
		//return "DeptList";
	}
	*/

	//spring 注入
	public DeptService getDeptService() {
		return deptService;
	}

	
	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}


	public List<DeptInfo> getList() {
		return list;
	}


	public void setList(List<DeptInfo> list) {
		this.list = list;
	}

	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSmanager() {
		return smanager;
	}
	public void setSmanager(String smanager) {
		this.smanager = smanager;
	}
	
	public DeptInfo getDept() {
		return dept;
	}

	public void setDept(DeptInfo dept) {
		this.dept = dept;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public Dept getDeptBean() {
		return deptBean;
	}
	public void setDeptBean(Dept deptBean) {
		this.deptBean = deptBean;
	}

	public List<Dept> getListDeptBean() {
		return listDeptBean;
	}
	public void setListDeptBean(List<Dept> listDeptBean) {
		this.listDeptBean = listDeptBean;
	}


}
