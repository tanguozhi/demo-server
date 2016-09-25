<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="ww" uri="/struts-tags"%>

<?xml version="1.0" encoding="gbk" ?>
<content>
<head>
	<style>
	</style>
</head>
<body>
	<%
		System.out.println("successsssssssss=====");
	%>
<div class="div1">
	<form method="get" action="/dcy/mainAction.action?user=tanguozhi">
	<input type="hidden" value="indexsssss" name="model.submitFlag"/>
	<input type="text" value="" name="aaaa"/>
	<input type="submit" value="submit"/>
	</form>
	
	<table>
		<tr>
			<td clospan="4">年代</td>
		</tr>
		<tr>
			<td>2013</td>
			<td>2012</td>
			<td>2011</td>
			<td>2010</td>
		</tr>
		<tr>
			<td>2009</td>
			<td>2008</td>
			<td>2007</td>
			<td>更多</td>
		</tr>
	</table>
	
</div>
</body>
</content>
