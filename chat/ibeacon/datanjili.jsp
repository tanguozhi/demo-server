<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>

<?xml version="1.0" encoding="utf-8" ?>
<content>
	<head>
		<style>
			.body {background-color:#F8F8F8;}
			.img_exit {left:10px; height:32; width:61px;}
			.title_div {position:fixed;top:0px;width:320px;height:45px;left:0px;background-image:url(i_toplogo.png);}
			.div1 {left:10px; width:300px; background-color:#ffffff; top:60px;}
			.div2 {left:10px; top:100px; width:300px; background-color:#ffffff;}
			.label_275 {left:10px; width:300px; top:50px; font-size:13px;}
			.table1 {background-color:#ffffff; width:300px;left:10px; top:100px;}
			.table2 {background-color:#ffffff; width:300px;left:10px; top:220px;}
			.label_1 {font-size:14px; left:100px; top:5px;}
			.label_2 {font-size:12px; left:50px; top:5px;}
			.label_4 {font-size:12px; left:65px; top:5px;}
			.label_3 {font-size:12px; left:170px; top:5px;}
			.label_5 {font-size:12px; left:185px; top:5px;}
			.btn_login {height:30px; top:0px; left:0px; width:300px; background-image:url(LoginNormal.png);}
			.label-table{left:5px; font-size:14px;}
			.label-table-min {left:5px; font-size:12px; color:#cccccc;}
			.btn_login_2 {height:30px; width:300px; background-image:url(LoginNormal.png);}
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
            	
            	function aaaa()
            	
            	end;
            	
            	function toPush(arg) 
            		
            		ryt:post(nil, "/push.action", "model.submitFlag=EBL000003&type="..arg, aaaa, {}, false);	
            	end;
            	
            	function toUpdate() 
            		ryt:post(nil, "/push.action", "model.submitFlag=EBL000005", aaaa, {}, false);	
            		ryt:alert("已推荐客户 '张三' 更新客户端！")
            	end;
            	
            	function toGg(arg) 
           			ryt:post(nil, "/push.action", "model.submitFlag=EBL000006&type="..arg, aaaa, {}, false);	
            		ryt:alert("已告知客户银行网的最新公告！")
           		end;
            	
            	function doBack()
            		ryt:back();
            	end;
            ]]>
		</script>
	</head>
	<body class="body">
		
		<div class='title_div'>
			<img class="img_exit" src="local:backButton_.png" onclick="doBack()"/>
		</div>
		
		<label class="label_275">尊敬的客户 "张三" 已经进入网点了，你可以向客户张三推荐以下信息：</label>
		
		<table class="table1" border="0" separator='#cccccc'>
				<tr>
					<td><label class="label_1">客户端更新推荐</label></td>
				</tr>
				<tr>
					<td>
						<label class="label_2">客户版本号</label>
						<label class="label_3">最新版本号</label>
					</td>
				</tr>
				<tr>
					<td>
						<label class="label_4">2.0</label>
						<label class="label_5">2.1</label>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="推荐更新客户端" class="btn_login" cap="15,15" onclick="toUpdate()"/>
					</td>
				</tr>
			</table>
			
			<table styleIndex='2' class='table2' separator='#cccccc'>                
				<tr separator='#cccccc' class='tr-height2' onclick='toGg("银行公告1")'>        
					<td class='tdmidde'>          
						<label class='label-table' singelline='yes' uriencode='true'>银行公告1</label><br/>                              
						<label class='label-table-min'>发布时间：2014-07-04</label>          
					</td>      
				</tr> 
				<tr separator='#cccccc' class='tr-height2' onclick='toGg("银行公告2')'>        
					<td class='tdmidde'>          
						<label class='label-table' singelline='yes' uriencode='true'>银行公告2</label><br/>                              
						<label class='label-table-min'>发布时间：2014-07-04</label>          
					</td>      
				</tr> 
				<tr separator='#cccccc' class='tr-height2' onclick='toGg("银行公告3")'>        
					<td class='tdmidde'>          
						<label class='label-table' singelline='yes' uriencode='true'>银行公告3</label><br/>                              
						<label class='label-table-min'>发布时间：2014-07-04</label>          
					</td>      
				</tr> 
				<tr separator='#cccccc' class='tr-height2' onclick='toGg("银行公告4")'>        
					<td class='tdmidde'>          
						<label class='label-table' singelline='yes' uriencode='true'>银行公告4</label><br/>                              
						<label class='label-table-min'>发布时间：2014-07-04</label>          
					</td>      
				</tr>   
			</table>
	</body>
</content>
