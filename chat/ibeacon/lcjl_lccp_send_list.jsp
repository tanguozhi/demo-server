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
			.label_275 {left:10px; width:300px; top:50px; font-size:13px;}
			.table1 {background-color:#ffffff; width:300px;left:10px;}
			.tr1 {height:30px;width:300px;background-color: #ffffff;}
			.td2 {width:160px;}
			.tr3 {height:50px;width:300px;background-color: #ffffff;} 
			.2label1{top:5px;left:10px;font-size:13px;color:#666666;}
			.2label2{top:5px;left:160px;font-size:13px;color:#666666;} 
			.2label3{top:25px;left:10px;width:140px;font-size:15px;color:#BF0018;}          
			.2label4{top:25px;left:155px;font-size:15px;color:#5185B2;}          
			.2label5{top:5px;left:220px;font-size:13px;color:#666666;}          
			.2label6{top:25px;left:220px;font-size:15px;color:#0d0d0d;}
			.gose{top:15px;left:270px;width: 24px;height: 24px;background-image:url(lccp_tab2_Arrow3.png);}
			.tddiv{top:0px;left:0px;height: 50px;width: 300px;background-color: #ffFFFF;} 
			.label-value-left {top: 10px;left:10px;width:240px;font-size:15px;color:#000000;}
			.srctp4{top:3px;left:270px;width: 27px;height: 27px;background-image:url(lccp_hot1.png);}
			.table3 {left:10px; top:220px; width:300px;background-color:#ffffff;border:1px #dadada solid;}
			.table4 {left:10px; top:350px; width:300px;background-color:#ffffff;border:1px #dadada solid;}
			.table5 {left:10px; top:480px; width:300px;background-color:#ffffff;border:1px #dadada solid;}
			.table6 {left:10px; top:610px; width:300px;background-color:#ffffff;border:1px #dadada solid;}
			.btn_login {height:30px; top:0px; left:0px; width:300px; background-image:url(LoginNormal.png);}
			. img_1{left:60px; top:100px; width:200px; height:100px;}
		</style>
		
		<script type="text/x-lua" src="RYTL.lua">
        </script>    <script type="text/x-lua">
            <![CDATA[
            	ryt = RYTL:new{};
            	
            	function aaaa()
            	
            	end;
            	
            	function toLJ(type) 
            		ryt:post(nil, "/push.action", "model.submitFlag=EBL000003&type="..type, aaaa, {}, false);	
            		ryt:alert("推荐已发送");
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
			
		<label class="label_275">尊敬的客户 "张三" 已经进入网点了，你可以向客户张三推荐适合他的理财产品：</label>
		
		<img src="local:info.png" class="img_1"/>
		
		<table  class='table3' name="table3" border="0" separator='#cccccc' cornerRadius= '0'>      
			<tr class="tr1">
		    	<td class="td2">
		    		<img src="" class="srctp4" />
		    		<label class='label-value-left' lineNumber='1'>薪加薪实时扣</label>
		    	</td>            
		    </tr>            
		    <tr class="tr3"'>                
		    	<td class="td2">                    
		    		<div class="tddiv"  onclick='detailedte()' border="0">                      
		    			<label class="2label1">预期年化收益率</label>                      
		    			<label class="2label3" lineNumber='1'>以网站每日公布为准</label>                      
		    			<label class="2label2">期限</label>                      
		    			<label class="2label4">99999天</label>                      
		    			<label class="2label5">起点金额</label>                      
		    			<label class="2label6">10.00</label>                      
		    			<img src="" class="gose"/>                    
		    		</div>                
		    	</td>            
		    </tr>  
		    <tr class="tr1">
		    	<td class="td2">
		    		<input type="button" value="推荐" class="btn_login" cap="15,15" onclick="toLJ('table3')"/>
		    	</td>            
		    </tr> 
		</table> 	
		
		<table  class='table4' name="table4" border="0" separator='#cccccc' cornerRadius= '0'>      
			<tr class="tr1">
		    	<td class="td2">
		    		<img src="" class="srctp4" />
		    		<label class='label-value-left' lineNumber='1'>全量测试结构性产品</label>
		    	</td>            
		    </tr>            
		    <tr class="tr3"'>                
		    	<td class="td2">                    
		    		<div class="tddiv"  onclick='detailedte()' border="0">                      
		    			<label class="2label1">预期年化收益率</label>                      
		    			<label class="2label3" lineNumber='1'>10</label>                      
		    			<label class="2label2">期限</label>                      
		    			<label class="2label4">99999天</label>                      
		    			<label class="2label5">起点金额</label>                      
		    			<label class="2label6">10.00</label>                      
		    			<img src="" class="gose"/>                    
		    		</div>                
		    	</td>            
		    </tr>  
		    <tr class="tr1">
		    	<td class="td2">
		    		<input type="button" value="推荐" class="btn_login" cap="15,15" onclick="toLJ('table4')"/>
		    	</td>            
		    </tr> 
		</table> 
		
		<table  class='table5' name="table5" border="0" separator='#cccccc' cornerRadius= '0'>      
			<tr class="tr1">
		    	<td class="td2">
		    		<label class='label-value-left' lineNumber='1'>薪满益足（人民币）</label>
		    	</td>            
		    </tr>            
		    <tr class="tr3"'>                
		    	<td class="td2">                    
		    		<div class="tddiv"  onclick='detailedte()' border="0">                      
		    			<label class="2label1">预期年化收益率</label>                      
		    			<label class="2label3" lineNumber='1'>8</label>                      
		    			<label class="2label2">期限</label>                      
		    			<label class="2label4">99999天</label>                      
		    			<label class="2label5">起点金额</label>                      
		    			<label class="2label6">10.00</label>                      
		    			<img src="" class="gose"/>                    
		    		</div>                
		    	</td>            
		    </tr>  
		    <tr class="tr1">
		    	<td class="td2">
		    		<input type="button" value="推荐" class="btn_login" cap="15,15" onclick="toLJ('table5')"/>
		    	</td>            
		    </tr> 
		</table> 
		
		<table  class='table6' name="table6" border="0" separator='#cccccc' cornerRadius= '0'>      
			<tr class="tr1">
		    	<td class="td2">
		    		<img src="" class="srctp4" />
		    		<label class='label-value-left' lineNumber='1'>T+0（AFA3）升级</label>
		    	</td>            
		    </tr>            
		    <tr class="tr3"'>                
		    	<td class="td2">                    
		    		<div class="tddiv"  onclick='detailedte()' border="0">                      
		    			<label class="2label1">预期年化收益率</label>                      
		    			<label class="2label3" lineNumber='1'>8</label>                      
		    			<label class="2label2">期限</label>                      
		    			<label class="2label4">99999天</label>                      
		    			<label class="2label5">起点金额</label>                      
		    			<label class="2label6">10.00</label>                      
		    			<img src="" class="gose"/>                    
		    		</div>                
		    	</td>            
		    </tr>  
		    <tr class="tr1">
		    	<td class="td2">
		    		<input type="button" value="推荐" class="btn_login" cap="15,15" onclick="toLJ('table6')"/>
		    	</td>            
		    </tr> 
		</table>
	</body>
</content>
