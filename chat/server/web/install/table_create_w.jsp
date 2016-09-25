<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%@ page import="com.demo.server.common.Config"%>

<?xml version="1.0" encoding="utf-8" ?>
<content>
<head>
	<title>安装详细</title>
	<link href="/<%=Config.PROJ_NAME%>/server/web/install/table_blue.css" rel="stylesheet" type="text/css" />
	<style>
		input {border:1px solid #cad9ea;}
	</style>
	
	<script>
		function back() {
			history.go(-1);
		}
		
		function onSubmit() {
			var tableName = document.getElementsByName("tm.tableName")[0].value;
			if(tableName=="") {
				alert("表名不能为空");
				return;
			}
			if(!isNaN(tableName)){
				alert("表名不能为纯数字");
				return;
			}
			
			document.getElementById("column_form").submit(); 
		}
	</script>
</head>
<body>
<form name="column_form" id="column_form" method="post" action="/<%=Config.PROJ_NAME%>/table.action">
	<input type="hidden" name="model.submitFlag" value="EBL000008"/>
	<table border="1" align="center" width="250" class="t1">
		<tr>
			<td colspan="2">
				<input type="button" value="返回" onclick="back()"/>
			</td>
		</tr>
		<tr align="center" class="a1">
			<td colspan="2"><label>添加表</label></td>
		</tr>
		
		<tr align="center">
			<td>表名:</td>
			<td><input type="text" name="tm.tableName"/></td>
		</tr>
		
		<tr align="center">
			<td>描述:</td>
			<td><input type="text" name="tm.tableDescribe" value=""/></td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="button" value="保存" onclick="onSubmit()"/>
			</td>
		</tr>
		
	</table>
</form>
</body>
</content>
