<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.demo.server.common.Config"%>

<?xml version="1.0" encoding="utf-8" ?>
<content>
<head>
	<title>安装成功</title>
	<link href="/<%=Config.PROJ_NAME%>/server/web/install/table_blue.css" rel="stylesheet" type="text/css" />
	<style>
	</style>
	
	<script>
		function uninstall() {
			document.getElementById("uninstall_form").submit(); 
		}
		
		function install_detail() {
			document.getElementById("install_detail_form").submit(); 
		} 
	</script>
</head>
<body>
	<form id="uninstall_form" method="post" action="/<%=Config.PROJ_NAME%>/install.action">
		<input type="hidden" name="model.submitFlag" value="EBL0000011"/>
	</form>
	
	<form id="install_detail_form" method="post" action="/<%=Config.PROJ_NAME%>/install.action">
		<input type="hidden" name="model.submitFlag" value="EBL000006"/>
	</form>
				
				
	<table width="250" border="1" align="center" class="t1">
		<tr align="center"  class="a1">
			<td colspan="2"><label>安装成功<label></td>
		</tr>
		<tr align="center">
			<td>
				<input type="button" value="卸载" onclick="uninstall()"/>
			</td>
			<td>
				<input type="button" value="查看安装详情" onclick="install_detail()"/>
			</td>
		</tr>
	</tabld>
	
</body>
</content>
