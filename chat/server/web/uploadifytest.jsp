<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ taglib prefix="ww" uri="/struts-tags"%>

<html>
<head>
	<script type="text/javascript" src="/demo/server/web/jquery/jquery-2.0.2.js"></script> 
	<%@ include file='include/uploadifty.jsp'%>
	
	<script type="text/javascript"> 
	///demo/hotel.action?file_upload=1&model.submitFlag=EBL000009&os=w
		initUploadifty();
		function initUploadifty() {
			$("#uploadify").uploadify({  
                'uploader'       : 'uploadify/uploadify.swf',
                'script'         : 'uploadDoc.jsp?file_upload=1&model.submitFlag=EBL000009&os=w',
                'cancelImg'      : 'uploadify/cancel.png',
                'folder'         : 'uploads',
                'queueID'        : 'fileQueue',
                'fileDesc' 		 : '请选择doc,docx,xls,xlsx文件',
            	'fileExt' 		 : '*.doc;*.docx;*.xls;*.xlsx;*.jpg',
            	'sizeLimit'      : 1024*1024*10,
                'auto'           : false,
                'multi'          : true, 
                'simUploadLimit' : 2,
                'buttonText'     : 'BROWSE'
            });  
        }
	</script>
	
	<style type="text/css">  
		.inputcss  
		{  
		    color:#333333;  
		    font-family: "Tahoma";   
		    font-size: 12px;   
		    border:solid 1px #CCCCCC;  
		}  
		.buttoncss  
		{  
		    color:#333333;  
		    font-family: "Tahoma";   
		    font-size: 12px;   
		    background-color:#FFFFFF;  
		    border:solid 1px #CCCCCC;  
		}  
		</style> 
</head>

<body onload="initUploadifty()">
	<div id="fileQueue"></div>
    <input type="file" name="uploadify" id="uploadify" />
    <p>
        <a href="javascript:jQuery('#uploadify').uploadifyUpload()">开始上传</a>   
        <a href="javascript:jQuery('#uploadify').uploadifyClearQueue()">取消所有上传</a> 
    </p>
</body>
</html>
