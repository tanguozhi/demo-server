<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.List"%>
<%@ page import="com.demo.server.install.vo.TableModel"%>
<%@ page import="com.demo.server.common.Config"%>

<?xml version="1.0" encoding="utf-8" ?>
<content>
<head>
	<title>表结构详情</title>
	<link href="/<%=Config.PROJ_NAME%>/server/web/install/table_blue.css" rel="stylesheet" type="text/css" />
	<style>
	</style>
	<script>
		function toInstallDetail() {
			document.getElementById("installDeatilForm").submit(); 
		}
		
		function toColumnCreate() {
			document.getElementById("column_create_form").submit();
		}
		
		function toSyncTable() {
			document.getElementById("sync_table_form").submit(); 
		}
		
		function toDeleteColumn(columnName) {
			if(confirm("确定要删除'"+columnName+"'表格吗?")) {
				document.getElementById("delete_form_"+columnName).submit(); 
			}
		}
	</script>
</head>

<%

	String tableName = (String)request.getAttribute("tableName");
	if(null!=tableName && !"".equals(tableName)){
		List<TableModel> tableModelList = (List<TableModel>)request.getAttribute("tableModelList");
%>

<body>
	<form method="post" id="installDeatilForm" action="/<%=Config.PROJ_NAME%>/install.action">
		<input type="hidden" name="model.submitFlag" value="EBL000006"/>
	</form>
	<table border="1" align="center" width="800" class="t1">
		<tr>
			<td colspan="11">
				<input type="button" value="返回" onclick="toInstallDetail()"/>
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
			<td>状态</td>
			<td>操作</td>
		</tr>
		
<%
	for(int i=0; i<tableModelList.size(); i++) {
		TableModel tm = tableModelList.get(i);
		
		tableName  = tm.getTableName();
		
		boolean disabled = false;
		String install = "未安装";
		if("1".equals(tm.getColumnInstall())){
			install = "已安装";
			disabled = true;
		}
%>
		<tr align="center">
			<td><%=tm.getTableName()%><label> <label></td>
			<td><%=tm.getColumnName()%><label> <label></td>
			<td><%=tm.getColumnType()%><label> <label></td>
			<td><%=tm.getColumnLength()%><label> <label></td>
			<td><%=tm.getColumnIsNull()%><label> <label></td>
			<td><%=tm.getColumnDefault()%><label> <label></td>
			<td><%=tm.getColumnPrimaryKey()%><label> <label></td>
			<td><%=tm.getColumnAutoIncrement()%><label> <label></td>
			<td><%=tm.getColumnDescribe()%><label> <label></td>
			<td><%=install%><label> <label></td>
			<td>
				<br/>
				<form method="post" action="/<%=Config.PROJ_NAME%>/table.action">
					<input type="hidden" name="model.submitFlag" value="EBL000006"/>
					<input type="hidden" name="tm.tableName" value="<%=tm.getTableName()%>"/>
					<input type="hidden" name="tm.columnName" value="<%=tm.getColumnName()%>"/>
					<input type="hidden" name="tm.columnParent" value="<%=tm.getColumnParent()%>"/>
					<input type="submit" value="编辑" <%if(disabled){%> disabled="disabled"<%}%>/>
				</form>
				<form id="delete_form_<%=tm.getColumnName()%>" method="post" action="/<%=Config.PROJ_NAME%>/table.action">
					<input type="hidden" name="model.submitFlag" value="EBL000004"/>
					<input type="hidden" name="tm.tableName" value="<%=tm.getTableName()%>"/>
					<input type="hidden" name="tm.columnName" value="<%=tm.getColumnName()%>"/>
					<input type="button" value="删除" onclick="toDeleteColumn('<%=tm.getColumnName()%>')"/>
				</form>
			</td>
		</tr>
<%
	}
%>
		<tr>
			<td colspan="11" align="center">
				<input type="button" value="添加列" onclick="toColumnCreate()"/>
				<input type="button" value="同步所有未安装列到数据库" onclick="toSyncTable()"/>
			</td>
		</tr>
	</table>
	
	<form id="column_create_form" method="post" action="/<%=Config.PROJ_NAME%>/table.action">
		<input type="hidden" name="model.submitFlag" value="EBL000002"/>
		<input type="hidden" name="tm.tableName" value="<%=tableName%>"/>
	</form>
	
	<form id="sync_table_form" method="post" action="/<%=Config.PROJ_NAME%>/install.action">
		<input type="hidden" name="model.submitFlag" value="EBL000007"/>
		<input type="hidden" name="tm.tableName" value="<%=tableName%>"/>
	</form>
</body>
<%
	}
%>
</content>
