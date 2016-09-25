function initUploadify(uploadButtonId, uploadButtonText, body, fileQueue, limit){
	$("#"+uploadButtonId).uploadify({  
                'uploader'       : '/demo/server/web/uploadify/uploadify.swf',
                'script'         : '/demo/server/web/common/uploadify_page.jsp?'+body,
                'cancelImg'      : 'uploadify/cancel.png',
                'folder'         : 'uploads',
                'queueID'        : fileQueue,
                'fileDesc' 		 : '请选择doc,docx,xls,xlsx文件',
            	'fileExt' 		 : '*.doc;*.docx;*.xls;*.xlsx;*.jpg',
            	'sizeLimit'      : 1024*1024*10,
                'auto'           : false,
                'multi'          : true, 
                'simUploadLimit' : limit,
                'buttonText'     : uploadButtonText
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

<body>
	<div id="fileQueue"></div>
    <input type="file" name="uploadify" id="uploadify" />
    <p>
        <a href="javascript:jQuery('#uploadify').uploadifyUpload()">开始上传</a>   
        <a href="javascript:jQuery('#uploadify').uploadifyClearQueue()">取消所有上传</a> 
    </p>
</body>
</html>
