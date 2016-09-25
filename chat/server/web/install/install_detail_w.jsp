<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.demo.server.common.xml.ParseXml"%>
<%@ page import="org.dom4j.Element"%>
<%@ page import="java.util.List"%>
<%@ page import="com.demo.server.common.Config"%>
<%@ taglib prefix="ww" uri="/struts-tags"%>

<?xml version="1.0" encoding="utf-8" ?>
<content>
<head>
	<title>安装详细</title>
	<link href="/<%=Config.PROJ_NAME%>/server/web/install/table_blue.css" rel="stylesheet" type="text/css" />
	<style>
		
	</style>
	
	<script>
		function toInstallPage() {
			document.getElementById("install_page_form").submit(); 
		}
		
		function toSyncTable() {
			document.getElementById("sync_table_form").submit(); 
		}
		
		function toCreateTable() {
			document.getElementById("create_table_form").submit(); 
		}
		
		function toDeleteTable(tableName) {
			if(confirm("确定要删除'"+tableName+"'表格吗?")) {
				document.getElementById("delete_form_"+tableName).submit(); 
			}
		}
	</script>
</head>

<body>
	<form method="post" id="install_page_form" action="/<%=Config.PROJ_NAME%>/server/web/install/install.jsp">
	</form>
	<table border="1" align="center" width="500" class="t1">
		<tr>
			<td colspan="4">
				<input type="button" value="返回" onclick="toInstallPage()"/>
			</td>
		</tr>
		<tr align="center">
			<td colspan="4"><label>数据库管理员</label></td>
		</tr>
		<tr align="center" class="a1">
			<td><label>名称</label></td>
			<td><label>状态</label></td>
			<td><label>描述</label></td>
			<td><label>操作</label></td>
		</tr>
<%
	List<Element> userElementList = ParseXml.getInstance().getElements(Config.getPathDB(), "user", null);
		for(int i=0; i<userElementList.size(); i++) {
			Element userElement =userElementList.get(i);
			String status = "安装失败";
			if("1".equals(userElement.attributeValue("install"))) {
				status = "安装成功";
			}
%>
		<tr align="center">
			<td><label><%=userElement.attributeValue("name")%></label></td>
			<td><label><%=status%></label></td>
			<td><label><%=userElement.attributeValue("describe")%></label></td>
			<td><label>无</label></td>
		</tr>
<%
		}
%>	
		<tr align="center">
			<td colspan="4"><label>数据库</label></td>
		</tr>
		<tr align="center" class="a1">
			<td><label>名称</label></td>
			<td><label>状态</label></td>
			<td><label>描述</label></td>
			<td><label>操作</label></td>
		</tr>
<%
	List<Element> databaseElementList = ParseXml.getInstance().getElements(Config.getPathDB(), "database", null);
		for(int i=0; i<databaseElementList.size(); i++) {
			Element databaseElement = databaseElementList.get(i);
			String status = "安装失败";
			if("1".equals(databaseElement.attributeValue("install"))) {
				status = "安装成功";
			}
%>
		<tr align="center">
			<td><label><%=databaseElement.attributeValue("name")%></label></td>
			<td><label><%=status%></label></td>
			<td><label><%=databaseElement.attributeValue("describe")%></label></td>
			<td><label>无</label></td>
		</tr>
<%
		}
%>		
		<tr align="center">
			<td colspan="4"><label>表格</label></td>
		</tr>
		<tr align="center" class="a1">
			<td><label>名称</label></td>
			<td><label>状态</label></td>
			<td><label>描述</label></td>
			<td><label>操作</label></td>
		</tr>
<%
	List<Element> tableElementList = ParseXml.getInstance().getElements(Config.getPathDB(), "table", null);
		for(int i=0; i<tableElementList.size(); i++) {
			Element tableElement = tableElementList.get(i);
			String status = "安装失败";
			if("1".equals(tableElement.attributeValue("install"))) {
				status = "安装成功";
			}
			String tableName = tableElement.attributeValue("name");
%>
		<tr align="center">
			<td><label><%=tableElement.attributeValue("name")%></label></td>
			<td><label><%=status%></label></td>
			<td><label><%=tableElement.attributeValue("describe")%></label></td>
			<td>
				<br/>
				<form id="delete_form_<%=tableName%>" method="post" action="/<%=Config.PROJ_NAME%>/table.action">
					<input type="hidden" name="model.submitFlag" value="EBL000009"/>
					<input type="hidden" name="tm.tableName" value="<%=tableElement.attributeValue("name")%>"/>
					<input type="button" value="删除" onclick="toDeleteTable('<%=tableName%>')"/>
				</form>
				<form method="post" action="/<%=Config.PROJ_NAME%>/table.action">
					<input type="hidden" name="model.submitFlag" value="EBL000001"/>
					<input type="hidden" name="tm.tableName" value="<%=tableElement.attributeValue("name")%>"/>
					<input type="submit" value="查看表结构"/>
				</form>
				<form method="post" action="/<%=Config.PROJ_NAME%>/dbmanager.action">
					<input type="hidden" name="model.submitFlag" value="EBL000001"/>
					<input type="hidden" name="dbmm.tableName" value="<%=tableElement.attributeValue("name")%>"/>
					<input type="submit" value="查看表内容"/>
				</form>
			</td>
		</tr>
<%
		}
%>
		<tr align="center">
			<td colspan="4">
				<input type="button" value="添加表格" onclick="toCreateTable();"/>
				<input type="button" value="同步所有未安装列到数据库" onclick="toSyncTable()"/>
			</td>
		</tr>
	</table>
	<form id="create_table_form" method="post" action="/<%=Config.PROJ_NAME%>/table.action">
		<input type="hidden" name="model.submitFlag" value="EBL000007"/>
	</form>
				
	<form id="sync_table_form" method="post" action="/<%=Config.PROJ_NAME%>/install.action">
		<input type="hidden" name="model.submitFlag" value="EBL000008"/>
	</form>
</body>
</content>
