<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>

<?xml version="1.0" encoding="utf-8" ?>
<content>
	<head>
		<style>
			<%@ include file="/iphone/common/common_css.jsp"%> 
			
			.sudoku {left:0px;width:320px;height:460px;}
			.img1 {top:0px;left:0px;}
			.label1 {left:0px;top:65px;width:62px;font-size:13px;}
		</style>
		
		<script type="text/x-lua" src="RYTL.lua">
        </script>    <script type="text/x-lua">
            <![CDATA[
            	ryt = RYTL:new{};
            	local loadTag = 3;
            	
            	local function doChannel_callback(response)
            		ryt:hide(loadTag);
            		if response["responseCode"]==200 then
                        local content = response["responseBody"];
                        ryt:add(content);
                        ryt:replace(content);
                    else
                        ryt:alert("网络请求失败，请重新再试!");
                    end;
            	end;
            	
            	function doChannel(url, body)
            		ryt:show("local:FullSLoading.xml",loadTag,true);
            		ryt:post(nil, url, body, doChannel_callback, {}, false);
            	end;
            ]]>
		</script>
	</head>
	<body>
		<div class='title_div'></div>
		
		<div type="sudoku" class="sudoku" border="0">
			<div border="0">
				<img src="local:gdb_anno.png" class="img1" onclick="doChannel('/ebook.action', 'model.submitFlag=ebook')"/>
				<label class="label1" align="center">电子书</label>
			</div>
			
		</div>
	</body>
</content>
