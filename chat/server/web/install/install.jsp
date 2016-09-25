<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="com.demo.server.common.Config"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>程序安装管理首页</title>
	<link href="/<%=Config.PROJ_NAME%>/server/web/install/table_blue.css" rel="stylesheet" type="text/css" />   
	<style type="text/css">
		
	</style>
	<script>
		function install() {
			document.getElementById("install_form").submit(); 
		}
		
		function install_detail() {
			document.getElementById("install_detail_form").submit(); 
		}
	</script>
</head>
<body>
	<form method="post" id="install_form" action="/<%=Config.PROJ_NAME%>/install.action">
		<input type="hidden" name="model.submitFlag" value="EBL000001"/>
		<input type="hidden" name="os" value="w"/>
	</form>
	
	<form method="post" id="install_detail_form" action="/<%=Config.PROJ_NAME%>/install.action">
		<input type="hidden" name="model.submitFlag" value="EBL000006"/>
		<input type="hidden" name="os" value="w"/>
	</form>
	
	<table align="center" class="t1" border="1">
		<tr align="center">
			<td colspan="2"><label>欢迎安装</label></td>
		</tr>
		<tr align="center" class="a1">
			<td><label>按下"开始安装"按钮开始程序的安装!</label></td>
			<td><input type="button" value="开始安装" onclick="install()"/></td>
		</tr>
		<tr align="center" class="a1">
			<td><label>安装前可以先手动进行环境的配置，按下"开始配置"按钮进行环境配置界面！</label></td>
			<td><input type="button" value="开始配置" onclick="install_detail()"/></td>
		</tr>
	</table>
</body>
