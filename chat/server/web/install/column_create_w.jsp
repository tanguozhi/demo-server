<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.demo.server.common.Config"%>

<?xml version="1.0" encoding="utf-8" ?>
<content>
<head>
	<title>添加列</title>
	<link href="/<%=Config.PROJ_NAME%>/server/web/install/table_blue.css" rel="stylesheet" type="text/css" />
	<style>
	</style>
	
	<script>
		function back() {
			history.go(-1);
		}
		
		function onSubmit() {
			//列名检测
			var columnName = document.getElementsByName("tm.columnName")[0].value;
			if(columnName=="") {
				alert("列名不能为空");
				return;
			}
			if(!isNaN(columnName)){
				alert("列名不能为纯数字");
				return;
			}
			
			//长度的检测
			var columnLength = document.getElementsByName("tm.columnLength")[0].value;
			if(columnLength=="") {
				alert("长度不能为空");
				return;
			}
			if(isNaN(columnLength)){
				alert("长度只能输入数字");
				return;
			}
			
			document.getElementById("column_form").submit(); 
		}
	</script>
</head>

<%
	String tableName = (String)request.getAttribute("tableName");
	if(null!=tableName && !"".equals(tableName)) {
%>

<body>
<form name="column_form" id="column_form" method="post" action="/<%=Config.PROJ_NAME%>/table.action">
	<input type="hidden" name="model.submitFlag" value="EBL000003"/>
	<table border="1" align="center" width="800" class="t1">
		<tr>
			<td colspan="9">
				<input type="button" value="返回" onclick="back()"/>
			</td>
		</tr>
		
		<tr align="center" class="a1">
			<td>表名</td>
			<td>列名</td>
			<td>类型</td>
			<td>长度</td>
			<td>是否为空</td>
			<td>默认值</td>
			<td>主键</td>
			<td>auto increment</td>
			<td>描述</td>
		</tr>
		
		<tr align="center">
			<td><%=tableName%><label> <label></td>
			<td><input type="text" name="tm.columnName" value=""/></td>
			<td>
				<select name="tm.columnType">
					<option value="varchar">varchar</option>
					<option value="char">char</option>
					<option value="int">int</option>
				</select>
			</td>
			<td><input type="text" name="tm.columnLength" value="" maxlength="5" width="30px"/></td>
			<td>
				<select name="tm.columnIsNull">
					<option value=""></option>
					<option value="NOT NULL">NOT NULL</option>
				</select>
			</td>
			<td><input type="text" name="tm.columnDefault" value=""/></td>
			<td>
				<select name="tm.columnPrimaryKey">
					<option value=""></option>
					<option value="PRIMARY KEY">PRIMARY KEY</option>
				</select>
			</td>
			<td>
				<select name="tm.columnAutoIncrement">
					<option value=""></option>
					<option value="AUTO INCREMENT">AUTO INCREMENT</option>
				</select>
			</td>
			<td><input type="text" name="tm.columnDescribe" value=""/></td>
		</tr>
		<tr>
			<td colspan="9" align="center">
				<input type="button" value="保存" onclick="onSubmit()"/>
			</td>
		</tr>
		
	</table>
</form>
</body>
<%
	}
%>
</content>
