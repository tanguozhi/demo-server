<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="com.demo.server.common.Config"%>

<html>
<head>
	<title>欢迎光临来到用户登录界面</title>
	<link href="/<%=Config.PROJ_NAME%>/server/web/install/table_blue.css" rel="stylesheet" type="text/css" /> 
	
	<style>
		.w1 {width:100px;}
	</style>
	
	<script>
		function toCreate() {
			var name = document.getElementsByName("um.name")[0].value;
			if(name=="") {
				alert("用户名称不能为空...");
				return;
			}
			
			var password = document.getElementsByName("um.password")[0].value;
			if(password=="") {
				alert("用户密码不能为空...");
				return;
			}
			document.getElementById("to_login_form").submit(); 
		}
	</script>
</head>

<body>
	<form  id="to_login_form" method="post" action="/<%=Config.PROJ_NAME%>/user.action">
		<input type="hidden" name="model.submitFlag" value="EBL000001"/>
		<input type="hidden" name="os" value="w"/>
		<table width="300" border="1" class="t1">
			<tr align="center" class="a1">
				<td colspan="2">用户登录</td>
			</tr>
			<tr align="center">
				<td>用户名称</td>
				<td>
					<input type="input" name="um.name"/>
				</td>
			</tr>
			<tr align="center">
				<td>用户密码</td>
				<td>
					<input type="password" name="um.password"/>
				</td>
			</tr>
			<tr align="center" class="a1">
				<td colspan="2">
					<input type="button" value="登录" onclick="toCreate()"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
