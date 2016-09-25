<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*"%>
<%@ page import="com.demo.server.common.Config"%>

<?xml version="1.0" encoding="utf-8" ?>
<content>
<head>
	<title>新增数据</title>
	<link href="/<%=Config.PROJ_NAME%>/server/web/install/table_blue.css" rel="stylesheet" type="text/css" />
	<style>
	</style>
	<script>
		function back() {
			history.go(-1);
		}
	</script>
</head>

<%
	String tableName = (String)request.getAttribute("tableName");
	
	String key = (String)request.getAttribute("update_key");
	List<String> columnList = (List<String>)request.getAttribute("columnNames");
	Map<String, String> dataMap = (Map<String, String>)request.getAttribute("dataMap");
%>

<body>
	<form method="post" id="installDeatilForm" action="/<%=Config.PROJ_NAME%>/install.action">
		<input type="hidden" name="model.submitFlag" value="EBL000006"/>
	</form>
	
	<form method="post" id="installDeatilForm" action="/<%=Config.PROJ_NAME%>/dbmanager.action">
	<input type="hidden" name="model.submitFlag" value="EBL000006"/>
	<input type="hidden" name="dbmm.tableName" value="<%=tableName%>"/>
	<input type="hidden" name="update_key" value="<%=key%>"/>
	<table border="1" align="center" width="800" class="t1">
		<tr class="a1">
			<td colspan="<%=columnList.size()%>">
				<input type="button" value="返回" onclick="back()"/>
			</td>
		</tr>
		<tr align="center">
			<td colspan="<%=columnList.size()%>"><label><%=tableName%></label></td>
		</tr>
		<tr class="a1" align="center">
<%
	for(int i=0; i<columnList.size(); i++){
%>	
			<td><%=columnList.get(i)%></td>
<%
	}
%>
		</tr>

		<tr align="center">
<%
	for(int i=0; i<columnList.size(); i++){
		String name = columnList.get(i);
%>	
			<td><input type="text" name="<%=name%>" value="<%=dataMap.get(name)%>" <%if(key.equals(name)){%>readOnly=true<%}%>/></td>
<%
	}
%>
		</tr>

		<tr align="center">
			<td colspan="<%=columnList.size()%>">
				<input type="submit" value="保存"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</content>
