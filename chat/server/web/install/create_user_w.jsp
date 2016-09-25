<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.demo.server.install.vo.InstallModel"%>
<%@ page import="com.demo.server.common.Config"%>
<%@ taglib prefix="ww" uri="/struts-tags"%>

<?xml version="1.0" encoding="utf-8" ?>
<content>
<head>
	<title>创建用户</title>
	<link href="/<%=Config.PROJ_NAME%>/server/web/install/table_blue.css" rel="stylesheet" type="text/css" />
	<style>
		input {border:1px solid #cad9ea;}
	</style>
	
	<script>
		function toInstallPage() {
			document.getElementById("install_page_form").submit(); 
		}
	</script>
</head>

<%
	InstallModel im = (InstallModel)request.getAttribute("im");
%>
<body>
	<form method="post" id="install_page_form" action="/<%=Config.PROJ_NAME%>/server/web/install/install.jsp">
	</form>
	
	<form method="post" action="/<%=Config.PROJ_NAME%>/install.action">
		<input type="hidden" name="model.submitFlag" value="EBL000005" />
		<input type="hidden" name="os" value="w" />
		
		<table width="350" border="1" align="center" class="t1">
			<tr>
				<td colspan="2">
					<input type="button" value="返回" onclick="toInstallPage()"/>
				</td>
			</tr>
			<tr class="a1">
				<td colspan=2 align="center"><label>数据库管理员</label></td>
			</tr>
			<tr>
				<td><label>用户帐号：</label></td>
				<td><input type="text" name="im.userName" value="<%=im.getUserName()%>" /></td>
			</tr>
			<tr>
				<td>用户密码：</td>
				<td><input type="text" name="im.userPassword" value="<%=im.getUserPassword()%>" /></td>
			</tr>
			<tr>
				<td>主机：</td>
				<td><input type="text" name="im.host" value="<%=im.getHost()%>" /></td>
			</tr>
			<tr class="a1">
				<td colspan=2 align="center"><label>数据库</label></td>
			</tr>
			<tr>
				<td>数据库名称：</td>
				<td><input type="text" name="im.databaseName" value="<%=im.getDatabaseName()%>" /></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="下一步"/></td>
			</tr>
		</table>
	</form>
</body>
</content>
