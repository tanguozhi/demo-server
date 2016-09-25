<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>

<?xml version="1.0" encoding="utf-8" ?>
<content>
	<head>
		<style>
			.body {background-color:#F8F8F8;}
			.title_div {position:fixed;top:0px;width:320px;height:45px;left:0px;background-image:url(toplogo.png);}
			.img_exit {right:5px; top:2px; height:41; width:46px;}
			.input_account {height:36px; left:15px; width:280px; background-color:#ffffff;}
			.label_14 {font-size:14px;}
			.label_login {font-size:18px; color:#ffffff; left:130px; top:10px;}
			.img_back {font-size:15px; color:#ffffff; left:5px; width:46px; height:41px; top:2px; display:none;}
			.btn_login {height:50px; left:15px; width:280px; background-image:url(LoginNormal.png);}
			.label_reg {font-size:14px; left:35px;}
			.label_top_reg {font-size:18px; color:#ffffff; left:130px; top:10px; display:none;}
			.div_reg {display:none; top:0px; left:0px;}
			.img_head {left:100px; width:100; height:100px;}
			.div_login {top:30px;}
			.label_question {left:180px; font-size:15px;}
			.div_20 {height:20px;}
			.label_proc {left:15px; width:280px; font-size:14px;}
			.div_reg_btn {background-color:#ffffff; top:330px; left:100px; width:100px; height:30px;}
		</style>
		
		<script type="text/x-lua" src="RYTL.lua">
        </script>    <script type="text/x-lua">
            <![CDATA[
            	ryt = RYTL:new{};
            	local loadTag = 3;
            	
            	local isRegisting;
            	local register_account;
            	local register_password;
            	
            	function doLogin_callback(response)
            		ryt:hide(loadTag);
        			if response["responseCode"]==200 then
                    	local content = response["responseBody"];
                    	ryt:add(content);
                    	ryt:replace(content);
                	else
                    	ryt:alert("网络请求失败，请重新再试!");
                	end;
        		end;
            	
            	function pubSub(node, item)
            		ryt:hide(loadTag);
            		
            		if node=="register" then
            			isRegisting = false;
            			xmpp:stopService();
            			if item=="0" then
            				ryt:alert("注册失败!");
            				return;
            			end;
            			xmpp:startService(register_account, register_password);
	            	elseif node=="authenticate" then
	            		if item=="1" then
	            			xmpp:setPubSubListener(null);
	            			ryt:post(nil, "/client/iphone/chatroom/index.jsp", "", doLogin_callback, {}, false);
	            		else
	            			xmpp:stopService();
	            			ryt:alert("登录失败，请检查帐号和密码!");
	            		end;
	            		
            		end;
            	end;
        
            	xmpp:setPubSubListener(pubSub);
            	
            	function doLoginOrReg(arg)
            		local div_login_obj = document:getElementsByName("div_login");
            		local div_reg_obj = document:getElementsByName("div_reg");
            		local img_back_obj = document:getElementsByName("img_back");
            		local label_top_reg_obj = document:getElementsByName("label_top_reg");
            		local label_top_login_obj = document:getElementsByName("label_top_login");
            		
            		if arg=="div_login" then
            			div_login_obj[1]:setStyleByName("display", "block");
            			div_reg_obj[1]:setStyleByName("display", "none");
            			img_back_obj[1]:setStyleByName("display", "none");
            			label_top_reg_obj[1]:setStyleByName("display", "none");
            			label_top_login_obj[1]:setStyleByName("display", "block");
            		elseif arg=="div_reg" then
            			div_login_obj[1]:setStyleByName("display", "none");
            			div_reg_obj[1]:setStyleByName("display", "block");
            			img_back_obj[1]:setStyleByName("display", "block");
            			label_top_reg_obj[1]:setStyleByName("display", "block");
            			label_top_login_obj[1]:setStyleByName("display", "none");
            		end;
            		ryt:reload();
            	end;
            	
            	function toLogin()
            		local input_login_account = document:getElementsByName("input_login_account");
            		local account_value = input_login_account[1]:getPropertyByName("value");
            		if account_value=="" then
            			ryt:alert("登录帐号不能为空");
            			return;
            		end;
            		
            		local input_login_password = document:getElementsByName("input_login_password");
            		local password_value = input_login_password[1]:getPropertyByName("value");
            		if password_value=="" then
            			ryt:alert("登录密码不能为空");
            			return;
            		end;
            		ryt:show("local:FullSLoading.xml", loadTag, true);
            		
            		local isLogin = xmpp:startService(account_value, password_value);
            	end;
            	
            	function doRegister()
            		if isRegisting==true then
            			return;
            		end;
            		
            		isRegisting = true;
            		
            		local txt_reg_account_obj = document:getElementsByName("txt_reg_account");
            		local txt_reg_account_value = txt_reg_account_obj[1]:getPropertyByName("value");
            		if txt_reg_account_value=="" then
            			ryt:alert("请输入您所注册的帐号！");
            			return;
            		end;
            		
            		local txt_reg_password_obj = document:getElementsByName("txt_reg_password");
            		local txt_reg_password_value = txt_reg_password_obj[1]:getPropertyByName("value");
            		if txt_reg_password_value=="" then
            			ryt:alert("请输入您所注册的密码！");
            			return;
            		end;
            		
            		ryt:show("local:FullSLoading.xml", loadTag, true);
            		
            		register_account = txt_reg_account_value;
            		register_password = txt_reg_password_value;
            		xmpp:registerAccount(txt_reg_account_value, txt_reg_password_value);
            	end;
            	
            	function exit(buttonName)
            		if buttonName==0 then
            			window:close();
            		end;
            	end
            	
            	function doExit()
            		window:alert("确认要退出程序吗？", "退出", "取消", exit);
            	end;
            ]]>
		</script>
	</head>
	<body class="body">
		
		<div class='title_div'>
			<img src="local:backButton.png" class="img_back" name="img_back" onclick="doLoginOrReg('div_login')"/>
			<label class="label_login" name="label_top_login">登录</label>
			<label class="label_top_reg" name="label_top_reg">注册</label>
			<img class="img_exit" src="local:exit.png" onclick="doExit()"/>
		</div>
		
		<div border="0">
			<div name="div_login" class="div_login" border="0">
				<img src="local:DefaultHead.png" class="img_head"/>
				<br/><br/>
				<input type="text" name="input_login_account" class="input_account" hold="请填写帐号" inset="50" inset-icon="input_inset_icon_account.png" value="test1"/>
				<br/>
				<input type="password" name="input_login_password" class="input_account"  hold="请填写密码" inset-icon="input_inset_icon_account.png" inset="50" value="12341234"/>
				<br/>
				<input type="button" value="登录" class="btn_login" cap="15,15" onclick="toLogin()"/>
				<br/>
				<label class="label_question">登录遇到的问题?</label>
				<div class="div_reg_btn" onclick="doLoginOrReg('div_reg')">
					<label class="label_reg">注册</label>
				</div>
			</div>
			
			<div name="div_reg" class="div_reg" border="0">
				<label class="label_proc" align="center">请填写以下注册信息</label>
				<br/>
				<div class="div_20" border="0"></div>
				<input type="text" name="txt_reg_account" class="input_account" hold="请填写帐号" inset="50" inset-icon="input_inset_icon_account.png" value=""/>
				<br/>
				<input type="password" name="txt_reg_password" class="input_account"  hold="请填写密码" inset-icon="input_inset_icon_account.png" inset="50" value=""/>
				<br/>
				<input type="button" value="注册" class="btn_login" cap="15,15" onclick="doRegister()"/>
				<br/>
				<label class="label_proc">轻触上面的“注册”按钮，即表示你同意《该软件许可及服务协议》</label>
			</div>
			
		</div>
	</body>
</content>
