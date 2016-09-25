<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>

<?xml version="1.0" encoding="utf-8" ?>
<content>ro
	<head>
		<style>
			.body {background-color:#F8F8F8;}
			.label_title {left:50px; top:10px;; width:200px; color:#ffffff;}
			.title_div {position:fixed;top:0px;width:320px;height:45px;left:0px;background-image:url(toplogo.png);}
			.bottom_div {bottom:0px; left:0px; width:320px; height:50px; background-image:url(tabbar_background.png);}
			.bottom_div_channel {width:80;}
			.bottom_div_icon {top:0px; left:25px; width:30px; height:30px;}
			.bottom_div_title {left:0px; top:33px; width:80px; color:#FFFFFF; font-size:12px;}
			.div_display {display:none;}
			.table_setting {top:45px; width:310px;background-color:#ffffff;}
			.scroll-x {top:45px; width:320px; height:400px;}
			.div_friend {background-color:#ffffff;}
			.div_room {background-color:#ffffff;}
			.xmpp-buddy-list {width:310px; height:355px;}
			.xmpp-room-list {width:310px; height:400px;}
			.img_search_buddy {right:10px; top:7px;}
			.img_search_room {right:10px; top:5px; display:none;}
			.img_logout {left:10px; height:32; width:60px;}
			.div_search {top:0px; left:0px; width:320px; height:500px; display:none;}			
			.div_search_alpha {top:0px; left:0px; width:320px; height:500px; background-color:#cccccc; alpha:0.5;}			
			.table_search {background-color:#ffffff; top:100px; width:310px;}
			.table_room {background-color:#ffffff; width:310px; top:100px;}
			.label_14 {font-size:14px;}
			.tr_50 {height:50px;background-color:#12c7eb;}
			.input_200 {width:200px;}
			.input_150 {width:150px;}
			.btn_1 {width:100px;height:30px;font-size:14px;color:#000000;background-color:#12c7eb;}
			.div_setting {width:320px;}
			.div_setting_my {left:0px; top:20px; width:320px; height:120px; background-color:#ffffff;}
			.img_header_photo {top:10px; left:20px;}
		</style>
		
		<script type="text/x-lua" src="RYTL.lua">
        </script>    <script type="text/x-lua">
            <![CDATA[
            	ryt = RYTL:new{};

            	local loadTag = 3;
            	
            	function pubSub(node, item)
            		if node=="available" then
            			local xmpp_buddy_list_obj = document:getElementsByName("xmpp-buddy-list");
            			xmpp:reloadBuddyList(xmpp_buddy_list_obj[1]);
            		elseif node=="unavailable" then
            			local xmpp_buddy_list_obj = document:getElementsByName("xmpp-buddy-list");
            			xmpp:reloadBuddyList(xmpp_buddy_list_obj[1]);
            		elseif node=="unsubscribe" then
            			local xmpp_buddy_list_obj = document:getElementsByName("xmpp-buddy-list");
            			xmpp:reloadBuddyList(xmpp_buddy_list_obj[1]);
            		elseif node=="subscribe" then
            			local xmpp_buddy_list_obj = document:getElementsByName("xmpp-buddy-list");
            			xmpp:reloadBuddyList(xmpp_buddy_list_obj[1]);
            		elseif node=="get-all-room" then
            			local xmpp_room_list_obj = document:getElementsByName("xmpp-room-list");
            			xmpp:reloadRoomList(xmpp_room_list_obj[1]);
            		elseif node=="join-room" then
            			xmpp:joinRoom(item, "", "");
            		end;
            	end;
        
            	xmpp:setPubSubListener(pubSub);
            	
            	function doChannel(arg_name)
            		local scrollObj = document:getElementsByName("scroll-x");
            		scroll:scrollToControlName(scrollObj[1], arg_name);
            	end;
            	
            	function changeChannel(arg_name) 
            		local img_search_buddy_obj = document:getElementsByName("img_search_buddy");
            		img_search_buddy_obj[1]:setStyleByName("display", "none");
            		local img_search_room_obj = document:getElementsByName("img_search_room");
            		img_search_room_obj[1]:setStyleByName("display", "none");
            		
            		
            		local label_top_buddyList_obj = document:getElementsByName("label_top_buddyList");
            		local label_top_roomList_obj = document:getElementsByName("label_top_roomList");
            		local label_top_dongtai_obj = document:getElementsByName("label_top_dongtai");
            		local label_top_setting_obj = document:getElementsByName("label_top_setting");
            		
            		label_top_buddyList_obj[1]:setStyleByName("display", "none");
            		label_top_roomList_obj[1]:setStyleByName("display", "none");
            		label_top_dongtai_obj[1]:setStyleByName("display", "none");
            		label_top_setting_obj[1]:setStyleByName("display", "none");
            		
            		if arg_name=="div_friend" then
            			label_top_buddyList_obj[1]:setStyleByName("display", "block");
            			img_search_buddy_obj[1]:setStyleByName("display", "block");
            		elseif arg_name=="div_setting" then
            			label_top_setting_obj[1]:setStyleByName("display", "block");
            		elseif arg_name=="div_dongtai" then
            			label_top_dongtai_obj[1]:setStyleByName("display", "block");
            		elseif arg_name=="div_room" then
            			label_top_roomList_obj[1]:setStyleByName("display", "block");
            			img_search_room_obj[1]:setStyleByName("display", "block");
            		end;
            	end;
            	
            	function doShowSearchBuddy(show)
            		local div_search_obj = document:getElementsByName("div_search");
            		if show==true then
            			--[[ 清空输入框 ]]--
            			local txt_buddy_name_obj = document:getElementsByName("txt_buddy_name");
            			txt_buddy_name_obj[1]:setPropertyByName("value", "");
            			
            			div_search_obj[1]:setStyleByName("display", "block");
            		else 
            			div_search_obj[1]:setStyleByName("display", "none");
            		end;
            	end;
            	
            	function doShowSearchRoom(show)
            		local div_search_room_obj = document:getElementsByName("div_search_room");
            		if show==true then
            			--[[ 清空输入框 ]]--
            			local txt_create_room_name_obj = document:getElementsByName("txt_create_room_name");
            			txt_create_room_name_obj[1]:setPropertyByName("value", "");
            			
            			div_search_room_obj[1]:setStyleByName("display", "block");
            		else 
            			div_search_room_obj[1]:setStyleByName("display", "none");
            		end;
            	end;
            	
            	function doSearchBuddy()
            		local txt_buddy_name_obj = document:getElementsByName("txt_buddy_name");
            		local name = txt_buddy_name_obj[1]:getPropertyByName("value");
            		
            		if name=="" then
            			ryt:alert("请输入您要添加好友的帐号！");
            			return;
            		end;
            		xmpp:addBuddy(name);
            		
            		doShowSearchBuddy(false);
            	end;
            	
            	function logout(buttonName)
            		if buttonName==0 then
            			xmpp:stopService();
            			xmpp:setPubSubListener(null);
            			xmpp:removeAllMessageNumber();
            			ryt:back();
            		end;
            	end
            	
            	function doLogout() 
            		window:alert("确认要注销当前帐号吗？", "注销", "取消", logout);
            	end;
            	
            	function doCreateRoom()
            		local txt_create_room_name_obj = document:getElementsByName("txt_create_room_name");
            		local value = txt_create_room_name_obj[1]:getPropertyByName("value");
            		if value=="" then
            			ryt:alert("请您输入要加入的聊天室名称！");
            			return;
            		end;
            		
            		xmpp:joinRoom(value, "", "");
            		
            		doShowSearchRoom(false);
            	end;
            	
            	function doChatView_callback(response)
            		ryt:hide(loadTag);
            		if response["responseCode"]==200 then
                    	local content = response["responseBody"];
                    	ryt:add(content);
                    	ryt:replace(content);
                	else
                    	ryt:alert("网络请求失败，请重新再试!");
                	end;
            	end;
            	
            	function toChatView(name, chatType)
            		ryt:show("local:FullSLoading.xml", loadTag, true);
            		ryt:post(nil, "/client/iphone/chatroom/chatview.jsp", "name="..name.."&chatType="..chatType, doChatView_callback, {}, false);
            	end;
            	
            	function init()
            		local label_top_buddyList_obj = document:getElementsByName("label_top_buddyList");
            		local label_top_roomList_obj = document:getElementsByName("label_top_roomList");
            		local label_top_dongtai_obj = document:getElementsByName("label_top_dongtai");
            		local label_top_setting_obj = document:getElementsByName("label_top_setting");
            		
            		label_top_roomList_obj[1]:setStyleByName("display", "none");
            		label_top_dongtai_obj[1]:setStyleByName("display", "none");
            		label_top_setting_obj[1]:setStyleByName("display", "none");
            	end;
            	
            	init();
            ]]>
		</script>
	</head>
	<body class="body">
		<div class='title_div'>
			<img class="img_logout" src="local:red_logout.png" onclick="doLogout()"/>
			
			<label class="label_title" name="label_top_buddyList" align="center">好友列表</label>
			<label class="label_title" name="label_top_roomList" align="center">群组列表</label>
			<label class="label_title" name="label_top_dongtai" align="center">动态</label>
			<label class="label_title" name="label_top_setting" align="center">设置</label>
			
			<img class="img_search_buddy" name="img_search_buddy" src="local:ff_IconAdd.png" onclick="doShowSearchBuddy(true)"/>
			<img class="img_search_room" name="img_search_room" src="local:chat_searchbtn.png" onclick="doShowSearchRoom(true)"/>
		</div>
		
		<div type="scroll-x" name="scroll-x" class="scroll-x" border="0" paging="true" onclick="changeChannel('arg_page_number')" screen-adapter="yes">
			<!-- 好友列表模块 -->
			<div name="div_friend" class="div_friend" border="0" screen-adapter="yes">
				<xmpp type="xmpp-buddy-list" class="xmpp-buddy-list" name="xmpp-buddy-list" onclick="toChatView('arg_name', 'chat')" screen-adapter="yes"/>
			</div>
			
			<!-- 群组模块 -->
			<div name="div_room" class="div_room" border="0">
				<xmpp type="xmpp-room-list" class="xmpp-room-list" name="xmpp-room-list" onclick="toChatView('arg_name', 'groupchat')" screen-adapter="yes"/>
			</div>
			
			<!-- 动态模块 -->
			<div name="div_dongtai" border="0">
				<table class="table_setting" separator="#cccccc">
					<tr align="center">
						<td><label>动态</label></td>
					</tr>
				</table>
			</div>
			
			<!-- 设置模块 -->
			<div name="div_setting" class="div_setting" border="0">
				<table class="div_setting_my" border="0">
					<tr onclick="aa()">
						<td>
							<img src="xmpp:self" class="img_header_photo"/>
						</td>
					</tr>
				</table>
				
			</div>
		</div>
		
		<!-- 添加用户 -->
		<div name="div_search" class="div_search" border="0">
			<div class="div_search_alpha" border="0"></div>
			<table class="table_search" separator="#cccccc">
				<tr align="center" onclick="doAddBuddy()" class="tr_50">
					<td><label class="label_14">添加好友</label></td>
				</tr>
				<tr align="center">
					<td>
						<label>帐号：</label>
						<input type="text" name="txt_buddy_name" class="input_200"/>
					</td>
				</tr>
				<tr align="center">
					<td>
						<input class="btn_1" type="button" value="添加" onclick="doSearchBuddy()"/>
						<input class="btn_1" type="button" value="取消" onclick="doShowSearchBuddy(false)"/>
					</td>
				</tr>
			</table>
		</div>
		
		<!-- 加入或创建聊天室 -->
		<div name="div_search_room" class="div_search" border="0">
			<div class="div_search_alpha" border="0"></div>
			<table class="table_room" separator="#cccccc">
				<tr align="center" onclick="doAddBuddy()" class="tr_50">
					<td><label class="label_14">创建聊天室</label></td>
				</tr>
				<tr align="center">
					<td>
						<label class="label_14">聊天室名称：</label>
						<input type="text" name="txt_create_room_name" class="input_150"/>
					</td>
				</tr>
				<tr align="center">
					<td>
						<input class="btn_1" type="button" value="创建" onclick="doCreateRoom()"/>
						<input class="btn_1" type="button" value="取消" onclick="doShowSearchRoom(false)"/>
					</td>
				</tr>
			</table>
			
		</div>
		
		<!-- 导航栏 -->
		<div type="scroll-x" class="bottom_div" border="0" space-x="0">
			<div border="0" padding="0" class="bottom_div_channel">
				<img src="local:tb_address_normal.png" class="bottom_div_icon" onclick="doChannel('div_friend')"/>
				<label class="bottom_div_title" align="center">好友列表</label>
			</div>
			
			<div border="0" padding="0" class="bottom_div_channel">
				<img src="local:tb_group_normal.png" class="bottom_div_icon" onclick="doChannel('div_room')"/>
				<label class="bottom_div_title" align="center">群组</label>
			</div>
			
			<div border="0" padding="0" class="bottom_div_channel">
				<img src="local:tb_apply_normal.png" class="bottom_div_icon" onclick="doChannel('div_dongtai')"/>
				<label class="bottom_div_title" align="center">动态</label>
			</div>
				
			<div border="0" padding="0" class="bottom_div_channel">
				<img src="local:tb_set_normal.png" class="bottom_div_icon" onclick="doChannel('div_setting')"/>
				<label class="bottom_div_title" align="center">设置</label>
			</div>
			
			
		</div>
	</body>
</content>
