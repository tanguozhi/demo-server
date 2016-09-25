<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.List"%>
<%@ page import="com.demo.server.install.vo.TableModel"%>
<%@ page import="com.demo.server.common.Config"%>

<?xml version="1.0" encoding="utf-8" ?>
<content>
<head>
	<title>编辑列</title>
	<link href="/<%=Config.PROJ_NAME%>/server/web/install/table_blue.css" rel="stylesheet" type="text/css" />
	<style>
	</style>
	
	<script>
		function back() {
			history.go(-1);
		}
		
		function onSubmit() {
			var columnName = document.getElementsByName("tm.columnName")[0].value;
			if(columnName=="") {
				alert("列名不能为空");
				return;
			}
			
			var columnLength = document.getElementsByName("tm.columnLength")[0].value;
			if(columnLength=="") {
				alert("长度不能为空");
				return;
			}
			document.getElementById("column_form").submit(); 
		}
	</script>
</head>

<%
	List<TableModel> tableModelList = (List<TableModel>)request.getAttribute("tableModelList");
	if(null!=tableModelList && tableModelList.size()>0) {
%>

<body>
<form name="column_form" id="column_form" method="post" action="/<%=Config.PROJ_NAME%>/table.action">
	<input type="hidden" name="model.submitFlag" value="EBL000005"/>
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
<%
	for(int i=0; i<tableModelList.size(); i++) {
		TableModel tm = tableModelList.get(i);
%>
		<input type="hidden" name="tm.parent" value="<%=tm.getColumnParent()%>"/>
		<input type="hidden" name="tm.tableName" value="<%=tm.getTableName()%>"/>
		<tr align="center">
			<td><%=tm.getTableName()%><label> <label></td>
			<td><input type="text" name="tm.columnName" value="<%=tm.getColumnName()%>" disabled="disabled"/></td>
			<td>
				<select name="tm.columnType" value="<%=tm.getColumnType()%>">
					<option value="varchar" <%if("varchar".equals(tm.getColumnType())){%>selected<%}%>>varchar</option>
					<option value="char" <%if("char".equals(tm.getColumnType())){%>selected<%}%>>char</option>
					<option value="int" <%if("int".equals(tm.getColumnType())){%>selected<%}%>>int</option>
				</select>
			</td>
			<td><input type="text" name="tm.columnLength" value="<%=tm.getColumnLength()%>"/></td>
			<td>
				<select name="tm.columnIsNull" value="<%=tm.getColumnIsNull()%>">
					<option value=""></option>
					<option value="NOT NULL" <%if("NOT NULL".equals(tm.getColumnIsNull())){%>selected<%}%>>NOT NULL</option>
				</select>
			</td>
			<td><input type="text" name="tm.columnDefault" value="<%=tm.getColumnDefault()%>"/></td>
			<td>
				<select name="tm.columnPrimaryKey">
					<option value=""></option>
					<option value="PRIMARY KEY" <%if("PRIMARY KEY".equals(tm.getColumnPrimaryKey())){%>selected<%}%>>PRIMARY KEY</option>
				</select>
			</td>
			<td>
				<select name="tm.columnAutoIncrement" value="<%=tm.getColumnAutoIncrement()%>">
					<option value=""></option>
					<option value="AUTO INCREMENT" <%if("AUTO INCREMENT".equals(tm.getColumnAutoIncrement())){%>selected<%}%>>AUTO INCREMENT</option>
				</select>
			</td>
			<td><input type="text" name="tm.columnDescribe" value="<%=tm.getColumnDescribe()%>"/></td>
		</tr>
<%
	}
%>
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
