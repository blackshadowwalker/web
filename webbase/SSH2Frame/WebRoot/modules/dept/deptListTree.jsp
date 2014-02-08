<%@ page language="java" import="java.util.*" import="com.bean.UserInfo" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
UserInfo user = (UserInfo)request.getSession().getAttribute("user");
//System.out.println("---------------"+user.getUserName()+" "+user.getUserId());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <base href="<%=basePath%>/" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>所有部门信息列表</title>
<link rel="stylesheet" href="css/common.css" type="text/css" media="all"/>
<link rel="stylesheet" href="css/main.css" type="text/css" media="all"/>

<link rel="stylesheet" href="scripts/jquery/jquery-ui/css/drop-down-list/jquery-ui.css" type="text/css" media="all"/>

<link rel="stylesheet" href="scripts/MiniTree/css/miniui/demo.css" type="text/css" media="all"/>
<link rel="stylesheet" href="scripts/MiniTree/css/miniui/icons.css" type="text/css" media="all"/>   
<link rel="stylesheet" href="scripts/MiniTree/css/miniui/miniui.css" type="text/css" media="all"/>
<script src="scripts/jquery/jquery-1.7.min.js" type="text/javascript"></script>


 <script src="scripts/MiniTree/core.js" type="text/javascript"></script>
<script src="scripts/MiniTree/jquery-1.6.2.min.js" type="text/javascript" ></script>
<script src="scripts/MiniTree/miniui.js" type="text/javascript" ></script>  
<script src="scripts/jquery/jquery-ui/js/jquery-ui-1.8.16.custom.min.js" type="text/javascript"></script>
<script src="scripts/common.js" type="text/javascript"></script>
<script src="scripts/validateForm.js" type="text/javascript"></script>
<script src="scripts/Calendar.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="scripts/prompt/skin/qq/ymPrompt.css" /> 
<script type="text/javascript" src="scripts/prompt/ymPrompt.js"></script>
<script type="text/javascript" src="scripts/frame/main.js"></script>

<style >
</style>

<script language="javascript">
	if("${nameError}"=="nameError"){
		alert("该部门已经存在 ");
	}
	if("${managerError}"=="managerError"){
		alert("上级部门不存在 ");
	}


$(function() {		
	//function getjson(){
	
		$.ajax({
			type:"post",
			url:"<%=basePath %>/DeptAction?method=listTree&rulerId=${r_id}",
			success:function(data){
		
				var availableName="[\"";
				var str="{json:"+data+"}";
				
				var array=eval("("+str+")");
				var len=array.json.length;
				for(var i=0;i<len;i++){
					//alert(array.json[i].deptManager);
					var deptName = array.json[i].deptName;
					if(deptName!="")
						availableName = availableName + deptName +"\",\"";
				}
				availableName=availableName.substring(0,availableName.length-2)+"]";
					
					$( "#dept_manager" ).autocomplete({
						source: eval("("+availableName+")")
					});
					
					$( "#dept_manager" ).autocomplete({
					  open: function( event, ui ) {
					  	$(".ui-autocomplete").css("z-index",999);
					  }
					});
					$( "#dept_name" ).autocomplete({
						source: eval("("+availableName+")")
					});
					
					$( "#dept_name" ).autocomplete({
					  open: function( event, ui ) {
					  	$(".ui-autocomplete").css("z-index",999);
					  }
					});
			}
		});
		
	//  }
	});

</script>
</head>
<body>
	
	<form action="DeptAction?method=getDeptView" id="opForm" name="opForm" method="post" >
	<input type="hidden" id="rulerId" name="rulerId"  value="${r_id}"/>
	<table id="table-data-outter">
	 <tr><td>
		<table id="table-data-inner" cellspacing="0">
			<tr id="tr-menu-path">
				<td colspan="2" nowrap="nowrap">
					<fieldset id="f-menu-path">当前位置:&nbsp;终端信息 &gt; 终端信息一览</fieldset>
					<fieldset id="f-condition-display">
						<img src="images/main/display_on.gif" onclick="displayCondition(this,'tr-menu-path')" 
							align="bottom" width="17" height="15" alt="隐藏查询条件" />
					</fieldset>
				</td>
			</tr>
			<tr>
				<td >
				
				部门名称：
					<input type="text" name="deptBean.deptName" id="deptBean_name" value="${deptBean.deptName}"/> 
			
				上级部门:
					<input type="text" name="deptBean.deptManager" id="deptBean_manager" value="${deptBean.deptManager}"
					/> 
                         	 <!--                                                   
                                                                                 修改时间:
					<input type="text" name="dept.lastUpdate" id="lastUpdate" value="最后修改时间" style="color:#999999" onblur="query0(this.id,this.value,'最后修改时间');" onfocus="query(this.id,this.value,'最后修改时间');"/>   
                             -->       
                    <input  type="submit" value="查询" class="btns_mouseout" onmouseover="this.className='btns_mouseover'" 
					onmouseout="this.className='btns_mouseout'" />                    
				</td>
			</tr> 
		</table>
	  </td></tr>
	</table>
	  </form>	

	<div id="treegrid1" class="mini-treegrid" style="width:600px;height:280px;"     
	   url="<%=basePath %>/DeptAction?method=listTree&rulerId=${r_id}" ondrawcell="onDrawCell" showTreeIcon="true"  
	    treeColumn="deptName" idField="deptName" parentField="deptManager" resultAsTree="false"
	    allowResize="true" expandOnLoad="true" allowCellEdit="false" allowCellSelect="true"
	>
	    <div property="columns">
	        <div type="indexcolumn"></div>
	        <div name="deptName" field="deptName" width="200">部门名称
	        <input property="editor" class="mini-textbox" style="width:100%;"  /> 
	        </div> 
	        <div field="lastUpdate" width="100" dateFormat="yyyy-MM-dd">最后修改日期
	        <input property="editor" class="mini-datepicker" style="width:100%;" />
	        </div>
	         <div field="operator" width="100" >操作
	         </div>        
	    </div>
	</div>
	<script type="text/javascript">
        mini.parse();
        var tree = mini.get("treegrid1");

        function onDrawCell(e){
            var node = e.node,
                column = e.column,
                field = e.field,
                value = e.value;

            //超链接任务
            if (field == "operator") {
                e.cellHtml = '<s:if test="#request.d>=0"><a href="javascript:add('+ node.deptId +',\''+ node.deptName+'\') "><img src="images/button/addnew.gif" title="添加" style="cursor:pointer "></img></a></s:if> <s:if test="#request.u>=0"><a href="DeptAction?method=deptBeforUpdate&id=' +node.deptId+ '&rulerId=${r_id}"><img src="images/button/pen.png" title="修改" border="0" style="cursor:pointer "></img></a></s:if> <s:if test="#request.d>=0"><a href="javascript:del('+ node.deptId +')"><img src="images/button/delete.png" title="删除" style="cursor:pointer "></img></a></s:if>';
            }
            //格式化日期
            if (field == "lastUpdate") {
                if (mini.isDate(value)) 
                	e.cellHtml = mini.formatDate(value, "yyyy年MM月dd日");
            }
        };
        
        function del(id){
			if(confirm("确定删除吗？")){
				location.href="<%= basePath%>/DeptAction?method=deptDel&rulerId=${r_id}&id="+id;
			}
		}
		function add(id,name){
		//alert("可以调用到该方法");
		location.href="<%= basePath%>/DeptAction?method=deptBeforAdd&rulerId=${r_id}&id="+id+"&sname="+name;
		}
	
    </script>
</body>

</html>