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
			.table1 {background-color:#ffffff; width:300px;left:10px; top:70px;}
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
		
			<table styleIndex='1' class='table1' separator='#cccccc'>                
				<tr separator='#cccccc' class='tr-height2'>        
					<td class='tdmidde'>          
						<label class='label-table' singelline='yes' uriencode='true'>银行公告1</label><br/>                              
						<label class='label-table-min'>发布时间：2014-07-04</label>          
					</td>      
				</tr> 
				<tr separator='#cccccc' class='tr-height2'>        
					<td class='tdmidde'>          
						<label class='label-table' singelline='yes' uriencode='true'>银行公告2</label><br/>                              
						<label class='label-table-min'>发布时间：2014-07-04</label>          
					</td>      
				</tr> 
				<tr separator='#cccccc' class='tr-height2'>        
					<td class='tdmidde'>          
						<label class='label-table' singelline='yes' uriencode='true'>银行公告3</label><br/>                              
						<label class='label-table-min'>发布时间：2014-07-04</label>          
					</td>      
				</tr> 
				<tr separator='#cccccc' class='tr-height2'>        
					<td class='tdmidde'>          
						<label class='label-table' singelline='yes' uriencode='true'>银行公告4</label><br/>                              
						<label class='label-table-min'>发布时间：2014-07-04</label>          
					</td>      
				</tr>   
			</table>
	</body>
</content>
