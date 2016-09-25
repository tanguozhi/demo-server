<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>

<?xml version="1.0" encoding="utf-8" ?>
<content>
	<head>
		<style>
			.body {background-color:#F8F8F8;}
			.title_div {position:fixed;top:0px;width:320px;height:45px;left:0px;background-image:url(i_toplogo.png);}
			.input_account {height:36px; left:15px; width:280px; background-color:#ffffff;}
			.div_11 {background-color:#ffffff; left:10px; width:300px; top:170px;}
			.img_head {left:110px; top:50px; width:100; height:100px;}
			.table_1 {width:300px;}
			.label_1 {font-size:13px; left:5px; top:5px;}
			.label_3 {font-size:13px; left:5px; top:25px;}
			.label_5 {font-size:13px; left:5px; top:45px;}
			.label_7 {font-size:13px; left:5px; top:65px;}
			.label_9 {font-size:13px; left:5px; top:85px;}
			.label_11 {font-size:13px; left:5px; top:105px;}
			.label_13 {font-size:13px; left:5px; top:125px;}
			
			.label_2 {font-size:13px; right:10px; top:5px; color:#cccccc;} 
			.label_4 {font-size:13px; right:10px; top:25px; color:#cccccc;}
			.label_6 {font-size:13px; right:10px; top:45px; color:#cccccc;}
			.label_8 {font-size:13px; right:10px; top:65px; color:#cccccc;}
			.label_10 {font-size:13px; right:10px; top:85px; color:#cccccc;}
			.label_12 {font-size:13px; right:10px; top:105px; color:#cccccc;}
			.label_14 {font-size:13px; right:10px; top:125px; color:#cccccc;}
		</style>
		
		<script type="text/x-lua" src="RYTL.lua">
        </script>    <script type="text/x-lua">
            <![CDATA[
            	ryt = RYTL:new{};
            	
            	function near_callback()
            		
            	end;
            	
            	function near(major, minor)
            		ryt:post(nil, "/push.action", "model.submitFlag=EBL000002&major="..major.."&minor="..minor, near_callback, {}, false);
            	end;
            	
            	function adj_callback(response)
                    if response["responseCode"]==200 then
                        local content = response["responseBody"];
                        ryt:add(content);
                        ryt:replace(content);
                    else
                        ryt:alert("网络请求失败，请重新再试!");
                    end;
                end;
            	
            	function adj(arg) 
            		ryt:post(nil, "/ibeacon/lccp.jsp", "type="..arg, adj_callback, {}, false);
            	end;
            ]]>
		</script>
	</head>
	<body class="body">
		
		<div class='title_div'></div>
		
		
		<img src="local:DefaultHead.png" class="img_head"/>
		
		<div class="div_11">
			<table border="0"  separator='#cccccc' class="table_1">
				<tr>
					<td><label  class="label_0">客户信息</label></td>
				</tr>
				
				<tr>
					<td>
						<label class="label_1">姓名</label>
						<label class="label_2">张三</label>
						<label class="label_3">性别</label>
						<label class="label_4">男</label>
						<label class="label_5">理财产品</label>
						<label class="label_6">963元</label>
						<label class="label_7">国债</label>
						<label class="label_8">1,128元</label>
						<label class="label_9">期货</label>
						<label class="label_10">1,128元</label>
						<label class="label_11">活期存款</label>
						<label class="label_12">766元</label>
						<label class="label_13">定期存款</label>
						<label class="label_14">1,729元</label>
					</td>
				</tr>
			</table>
		</div>
		
	</body>
</content>
