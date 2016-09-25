<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>

<?xml version="1.0" encoding="utf-8" ?>
<content>
	<head>
		<style>
			.body {background-color:#F8F8F8;}
			.title_div {position:fixed;top:0px;width:320px;height:45px;left:0px;background-image:url(i_toplogo.png);}
			.label1 {top:64px; left:10px; font-size:13px;}
			.div_1 {left:20px; top:50px;}
			.div_2 {left:120px; top:50px;}
			.btn_login {height:30px; left:260px; width:50px; background-image:url(LoginNormal.png);}
		</style>
		
		<script type="text/x-lua" src="RYTL.lua">
        </script>    <script type="text/x-lua">
            <![CDATA[
            	ryt = RYTL:new{};
            	
            	local function doMain_callback(response)
                    if response["responseCode"]==200 then
                    	iBeacon:startRangingForBeacons();
                    	
                        local content = response["responseBody"];
                        ryt:add(content);
                        ryt:replace(content);
                    else
                        ryt:alert("网络请求失败，请重新再试!");
                    end;
                end;
                
            	function toClient()
            		ryt:post(nil, "/ibeacon/client.jsp", "os=i", doMain_callback, {}, false);
            	end;
            	
            	local ii = 0;
            	
            	function toStartAdvertisingBeacon() 
            		if ii==0 then
            			ii = 1;
            			iBeacon:startAdvertisingBeacon();
            		end;
            		ryt:alert("基站已经打开了");
            	end;
            	
            	local function dodatanlcli_callback(response)
                    if response["responseCode"]==200 then
                        local content = response["responseBody"];
                        ryt:add(content);
                        ryt:replace(content);
                    else
                        ryt:alert("网络请求失败，请重新再试!");
                    end;
                end;
            	
            	function datanlcli()
            		ryt:post(nil, "/ibeacon/lcjl_lccp_send_list.jsp", "os=i", dodatanlcli_callback, {}, false);
            	end;
            	
            	function datandtjl()
            		ryt:post(nil, "/ibeacon/datanjili.jsp", "os=i", dodatanlcli_callback, {}, false);
            	end;
            	
            	local function ent_callback(response)
                    if response["responseCode"]==200 then
                        local content = response["responseBody"];
                        ryt:add(content);
                        ryt:replace(content);
                    else
                        ryt:alert("网络请求失败，请重新再试!");
                    end;
                end;
                
            	function ent()
            		ryt:post(nil, "/ibeacon/ent.jsp", "os=i", ent_callback, {}, false);
            	end;
            	
            	function ale(arg)
            		ryt:alert(arg);
            	end;
            	
            	function conf(arg)
            		window:alert(arg, "更新", "忽略");
            	end;
            	
            	function init()
            		local token = iBeacon:deviceToken();
            		if token=="d378264d2a8f5acd26c1ac124c323c16c304a2cf4d291d58039fb039a2b56070" then
            			toClient();
            		end;
            	end;
            	
            	init();
            	
            	function imgGongGe(arg) 
            		if arg=="licai" then
            			ryt:post(nil, "/ibeacon/lcjl_lccp_list.jsp", "os=i", ent_callback, {}, false);
            		elseif arg=="gonggao" then
            			ryt:post(nil, "/ibeacon/gonggao_list.jsp", "os=i", ent_callback, {}, false);
            		end;
            	end;
            ]]>
		</script>
	</head>
	<body class="body">
		
		<div class='title_div'>
		</div>
		
		<div border="0" class="div_1">
			<img src="local:gdb_card_tjbk.png" onclick="imgGongGe('gonggao')"/>
			<label class="label1">银行公告</label>
		</div>
		
		<div border="0" class="div_2">
			<img src="local:gdb_lccp.png" onclick="imgGongGe('licai')"/>
			<label class="label1">理财产品</label>
		</div>
		
	</body>
</content>
