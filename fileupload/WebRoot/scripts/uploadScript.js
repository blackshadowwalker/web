
function ClearAll(){
	tObject.setData({
		curPage:0,
		totalPage:0,
		totalRow:0,
		data:null
	});
	$("#serverData").val("");
}

function StopUpload(){
	
	bStoped = !bStoped;
	if(bStoped ){
		SWFUpload.stopUpload();
		$("#i_btcancel").html("Resume Upload");
		tObject.setTipInfo("Upload Stoped");
	}
	else{
		SWFUpload.startUpload();
		$("#i_btcancel").html("Stop Upload");
		tObject.setTipInfo("Uploading");
	}
}

function addFile(){
	
}

window.onbeforeunload = function(event) {
	var retdata = $("#serverData").val();
	
	if(tObject.ValidLines()>0 && swfu.getStats().files_queued>0)
		return "Some files have not uploaded yet!\n";
} 

function saveExit()
{
	if(tObject.ValidLines()>0 && swfu.getStats().files_queued>0)
		if(!confirm("Some files have not uploaded yet!\n"))
			return false;
	$("#i_returnForm").submit();
	
	$("#serverData").val("");
//	window.close();
}
function closeWin()
{
	window.close();
}