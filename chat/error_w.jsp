<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="ww" uri="/struts-tags"%>

<?xml version="1.0" encoding="utf-8" ?>
<content>
<head>
	<title>出错了!</title>
	<link href="/demo/server/web/install/table_blue.css" rel="stylesheet" type="text/css" />
	<style>
	</style>
	<script>
		function back() {
			history.go(-1);
		}
	</script>
</head>

<%
	String contextError = (String)request.getAttribute("contextError");
	if(null==contextError || "".equals(contextError)) {
		contextError = (String)request.getAttribute("errorMessage");
	}
%>

<body>
<table width="250" align="center" border="1" class="t1">
	<tr align="center" class="a1">
		<td><label>错误信息提示</label></td>
	</tr>
	<tr align="center">
		<td><label><%=contextError%></label></td>
	</tr>
	<tr align="center">
		<td><input type="button" value="返回" onclick="back()"/></td>
	</tr>
</table>

</body>
</content>
