/* Demo Note:  This demo uses a FileProgress class that handles the UI for displaying the file name and percent complete.
The FileProgress class is not part of SWFUpload.
*/


/* **********************
   Event Handlers
   These are my custom event handlers to make my
   web application behave the way I went when SWFUpload
   completes different tasks.  These aren't part of the SWFUpload
   package.  They are part of my application.  Without these none
   of the actions SWFUpload makes will show up in my application.
   ********************** */

function swfUploadPreLoad() {
	var self = this;
	var loading = function () {
		//document.getElementById("divSWFUploadUI").style.display = "none";
		document.getElementById("divLoadingContent").style.display = "";

		var longLoad = function () {
			document.getElementById("divLoadingContent").style.display = "none";
			document.getElementById("divLongLoading").style.display = "";
		};
		this.customSettings.loadingTimeout = setTimeout(function () {
				longLoad.call(self)
			},
			15 * 1000
		);
	};
	
	this.customSettings.loadingTimeout = setTimeout(function () {
			loading.call(self);
		},
		1*1000
	);
}
function swfUploadLoaded() {
	var self = this;
	clearTimeout(this.customSettings.loadingTimeout);
	//document.getElementById("divSWFUploadUI").style.visibility = "visible";
	//document.getElementById("divSWFUploadUI").style.display = "block";
	document.getElementById("divLoadingContent").style.display = "none";
	document.getElementById("divLongLoading").style.display = "none";
	document.getElementById("divAlternateContent").style.display = "none";
	
	//document.getElementById("btnBrowse").onclick = function () { self.selectFiles(); };
	document.getElementById("btnCancel").onclick = function () { self.cancelQueue(); };
}
   
function swfUploadLoadFailed() {
	clearTimeout(this.customSettings.loadingTimeout);
	//document.getElementById("divSWFUploadUI").style.display = "none";
	document.getElementById("divLoadingContent").style.display = "none";
	document.getElementById("divLongLoading").style.display = "none";
	document.getElementById("divAlternateContent").style.display = "";
}

function getLineNum(fileid){
	var totalline = tObject.MaxLineNum();
	for(var i=1; i<=totalline; i++ ){
		var id = tObject.getRowColValue(i,1);
		if(fileid == id )
			return i;
	}
	return -1;
}
function cancelFile(obj, index, id){
	var lineNum = getLineNum(id); // tObject.getSelectRowNum();
	swfu.cancelUpload(id,false);
	tObject.delRowValue(lineNum);
	
	$("#totalFile").html("Total &nbsp; "+tObject.ValidLines()+" &nbsp;File");
}
function getstate(state){
	switch(state){
		case SWFUpload.FILE_STATUS.QUEUED:{
			return "Waiting";
		}
		case SWFUpload.FILE_STATUS.IN_PROGRESS:{
			return "Uploading";
		}
		case SWFUpload.FILE_STATUS.ERROR:{
			return "Error";
		}
		case SWFUpload.FILE_STATUS.COMPLETE:{
			return "Uploaded";
		}
		case SWFUpload.FILE_STATUS.SUCCESS :{
			return "Uploaded";
		}
		case SWFUpload.FILE_STATUS.CANCELLED:{
			return "Canceled";
		}
	}
}


var kbByte = 1000;
var mByte = kbByte*1000;
var gByte = mByte*1000;
function formatSize(insize){
	var size="";
//	alert(insize);
	//parseInt
	var t=0;
	if(insize<1000){
		size = insize+"B";
	}
	else if(insize<mByte){
		size = (insize*1.0/1000).toFixed(2)+"KB";
	}
	else if(insize<gByte) {
		size = (insize*1.0/mByte).toFixed(2)+"MB";
	}
	else{
		size = (insize*1.0/gByte).toFixed(2)+"GB";
	}
	return size;
}

function addReadyFileInfo(file){

	var pbar = "<div class=progress style='width:190px;'><div id=progress_"+file.id+"  class='bar' style='width:0%'></div></div>";
	var op = "<div align=center><span class='delete-btn' style='cursor:hand;width:60px;' title='delete' onclick=\"cancelFile(this,'"+file.index+"','"+file.id+"');\" >&nbsp;</span></div>";
	var size = formatSize(file.size);
	tObject.InsertRow({
		data:[file.id,
		      file.index.toString(),
              file.name,
              size,
              pbar,
              getstate(file.filestatus),
              op
             ] 
	});
	
}

function fileQueued(file) {
	addReadyFileInfo(file);
	try {
		/*
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setStatus("Pending...");
		progress.toggleCancel(true, this);
		*/
	} catch (ex) {
		this.debug(ex);
	}

}
function fileDialogComplete(numFilesSelected, numFilesQueued) {
	$("#totalFile").html("Total &nbsp; "+tObject.ValidLines()+" &nbsp;File");
	try {
		if (numFilesSelected > 0) {
			
		}
		/* I want auto start the upload and I can do that here */
		
		this.startUpload();
	} catch (ex)  {
        this.debug(ex);
	}
}

function fileQueueError(file, errorCode, message) {
	try {
		if (errorCode === SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED) {
			alert("You have attempted to queue too many files.\n" + (message === 0 ? "You have reached the upload limit." : "You may select " + (message > 1 ? "up to " + message + " files." : "one file.")));
			return;
		}
		/*
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setError();
		progress.toggleCancel(false);
		*/
		switch (errorCode) {
		case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
			progress.setStatus("File is too big.");
			this.debug("Error Code: File too big, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
			progress.setStatus("Cannot upload Zero Byte files.");
			this.debug("Error Code: Zero byte file, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
			progress.setStatus("Invalid File Type.");
			this.debug("Error Code: Invalid File Type, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		default:
			if (file !== null) {
				progress.setStatus("Unhandled Error");
			}
			this.debug("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		}
	} catch (ex) {
        this.debug(ex);
    }
}



function uploadStart(file) {
	try {
		/* I don't want to do any file validation or anything,  I'll just update the UI and
		return true to indicate that the upload should start.
		It's important to update the UI here because in Linux no uploadProgress events are called. The best
		we can do is say we are uploading.
		 */
		var postobj = { 
				"dir" : $("#i_dir").val(),
				"fileTypes" : $("#i_filetype").val(),
				"dirroot" : $("#i_dirroot").val(),
				"fileNum" : file.index
		};
		swfu.setPostParams(postobj);
		swfu.setUseQueryString(true);
		bStoped = false;
		this.setButtonDisabled(true);
//		document.getElementById(this.customSettings.cancelButtonId).disabled = false;
		/*
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setStatus("Uploading...");
		progress.toggleCancel(true, this);
		*/
	}
	catch (ex) {}
	
	return true;
}


function uploadProgress(file, bytesLoaded, bytesTotal) {
	try {
		var percent = Math.ceil((bytesLoaded / bytesTotal) * 100);
		$("#progress_"+file.id).width(percent+"%");
		
		/*
		this.customSettings.tdFilesQueued.innerHTML = this.getStats().files_queued;
		this.customSettings.tdFilesUploaded.innerHTML = this.getStats().successful_uploads;
		this.customSettings.tdErrors.innerHTML = this.getStats().upload_errors;
		SWFUpload.speed.formatPercent(file.percentUploaded);
		*/
		var speed = SWFUpload.speed.formatBPS(file.currentSpeed);
		$("#speedLabel").html("Speed: " +speed);
		
		var timeRemain = SWFUpload.speed.formatTime(file.timeRemaining);
		$("#remainTime").html("Remained: " +timeRemain+"&nbsp;&nbsp;");
		
		$("#progress_total").width(percent+"%");
		
		tObject.setTipInfo("["+file.name+","+getstate(file.filestatus)+"]"+"...@ percent:"+percent+"%");
		
		/*
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setProgress(percent);
		progress.setStatus("Uploading...");
		*/
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadSuccess(file, serverData) {
//	document.getElementById(this.customSettings.cancelButtonId).disabled = true;
	try {
		var lineNum = getLineNum(file.id);
		if(lineNum>0)
		{
			tObject.setRowValue({
				row_num:lineNum,
				data:['no',
				      'no',
		              'no',
		              'no',
		              'no',
		              getstate(file.filestatus),
		              'no'
		             ]                		
			});  
		}
		tObject.setTipInfo("["+file.name+","+getstate(file.filestatus)+"]");

		var val = $("#serverData").val()+"\n"+serverData;
		$("#serverData").val($.trim(val)); 
		
		/*
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setComplete();
		progress.setStatus("Complete.");
		progress.toggleCancel(false);
		*/
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadError(file, errorCode, message) {
	this.setButtonDisabled(true);
	try {
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setError();
		progress.toggleCancel(false);

		switch (errorCode) {
		case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
			progress.setStatus("Upload Error: " + message);
			this.debug("Error Code: HTTP Error, File name: " + file.name + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
			progress.setStatus("Upload Failed.");
			this.debug("Error Code: Upload Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.IO_ERROR:
			progress.setStatus("Server (IO) Error");
			this.debug("Error Code: IO Error, File name: " + file.name + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
			progress.setStatus("Security Error");
			this.debug("Error Code: Security Error, File name: " + file.name + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
			progress.setStatus("Upload limit exceeded.");
			this.debug("Error Code: Upload Limit Exceeded, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
			progress.setStatus("Failed Validation.  Upload skipped.");
			this.debug("Error Code: File Validation Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
			// If there aren't any files left (they were all cancelled) disable the cancel button
			if (this.getStats().files_queued === 0) {
				document.getElementById(this.customSettings.cancelButtonId).disabled = true;
			}
			progress.setStatus("Cancelled");
			progress.setCancelled();
			break;
		case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
			progress.setStatus("Stopped");
			break;
		default:
			progress.setStatus("Unhandled Error: " + errorCode);
			this.debug("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		}
	} catch (ex) {
        this.debug(ex);
    }
}

function uploadComplete(file) {
	if (this.getStats().files_queued === 0) {
		this.setButtonDisabled(false);
		bStoped = true;
		$("#speedLabel").html("Speed: 0 byte/s" );
		$("#remainTime").html("Remained: 0s  &nbsp;&nbsp;");
		$("#progress_total").width("100%");
		tObject.setTipInfo("");
	//	document.getElementById(this.customSettings.cancelButtonId).disabled = true;
	}else{
	}
}

// This event comes from the Queue Plugin
function queueComplete(numFilesUploaded) {
	tObject.setTipInfo(numFilesUploaded + " file" + (numFilesUploaded === 1 ? "" : "s") + " uploaded.");
	
}
