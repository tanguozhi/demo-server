<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>

<%
	String name = (String)request.getParameter("name");
	String chatType = (String)request.getParameter("chatType");
%>

<?xml version="1.0" encoding="utf-8" ?>
<content>
	<head>
		<style>
			.title_div {position:fixed;top:0px;width:320px;height:45px;left:0px;background-image:url(toplogo.png);}
			.label_title {left:50px; top:10px;; width:200px; color:#ffffff;}
			.xmpp-chat-view {background-color:#ffffff; width:320px; height:415px; top:45px;}
			.img_exit {left:10px; height:35; width:35px;}
			.img_down {right:10px; width:32px; height:32px;}
			.img_up {right:10px; width:32px; height:32px; display:none;}
			.img_send_image {width:32px; height32px; left:10px;}
			.img_clear_log_image {width:32px; height32px;right:10px;}
			.div_more {top:45px; width:320px;left:0px; background-color:#cccccc; alpha:0.9; display:none;}
		</style>
		
		<script type="text/x-lua" src="RYTL.lua">
        </script>    <script type="text/x-lua">
            <![CDATA[
            	ryt = RYTL:new{};
            	
            	local toName = "<%=name%>";
            	local msgType = "<%=chatType%>";
            	
            	function doBack()
            		ryt:back();
            	end;
            	
            	
            	function doMoreShow(arg) 
            		local img_up_obj = document:getElementsByName("img_up");
            		local img_down_obj = document:getElementsByName("img_down");
            		img_up_obj[1]:setStyleByName("display", "none");
            		img_down_obj[1]:setStyleByName("display", "none");
            		
            		local div_more_obj = document:getElementsByName("div_more");
            		if arg=="up" then
            			div_more_obj[1]:setStyleByName("display", "none");
            			img_down_obj[1]:setStyleByName("display", "block");
					else
						div_more_obj[1]:setStyleByName("display", "block");  
						img_up_obj[1]:setStyleByName("display", "block");        			
            		end;
            	end;
            	
            	function doClearLogBack(button)
            		if button==0 then
            			local xmpp_chat_view_obj = document:getElementsByName("xmpp-chat-view");
            			xmpp:removeChatLog(toName, msgType);
            		end;
            	end;
            	
            	function doClearLog()
            		doMoreShow("up");
            		local xmpp_chat_view_obj = document:getElementsByName("xmpp-chat-view");
            		local toBuddyName = xmpp_chat_view_obj[1]:getPropertyByName("text");
            		window:alert("您确定要清空与 "..toBuddyName.." 的聊天记录？", "确定", "取消", doClearLogBack);
            	end;
            	
            	function openAlbumBack(arg)
            		local xmppChatViewObj = document:getElementsByName("xmpp-chat-view");
            		xmpp:sendMessage(xmppChatViewObj[1], arg["image"], "img");
            	end;
            	
            	function openAlbum()
            		doMoreShow("up");
            		camera:open("library",openAlbumBack);
            	end;
            ]]>
		</script>
	</head>
	<body>
		
		<div class='title_div'>
			<img class="img_exit" src="local:backButton.png" onclick="doBack()"/>
			
			<label class="label_title" name="label_top_login" align="center"><%=name%></label>
			
			<img class="img_up" name="img_up" src="local:display_up.png" onclick="doMoreShow('up')"/>
			<img class="img_down" name="img_down" src="local:display_down.png" onclick="doMoreShow('down')"/>
		</div>
		
		<xmpp type="xmpp-chat-view" class="xmpp-chat-view" name="xmpp-chat-view" sender="<%=name%>" ctype="<%=chatType%>" screen-adapter="yes"/>
		
		<div class="div_more" name="div_more" border="0">
			<img class="img_send_image" name="img_up" src="local:send_image.png" onclick="openAlbum()"/>
			<img class="img_clear_log_image" name="img_up" src="local:trash-full.png" onclick="doClearLog()"/>
		</div>
		
		</div>
	</body>
</content>
