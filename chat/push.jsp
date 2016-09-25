<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.demo.server.common.Config"%>

<?xml version="1.0" encoding="gbk" ?>
<content>
<head>
	<style>
	</style>
</head>
<body>
	<form method="get" action="/<%=Config.PROJ_NAME%>/push.action">
		<input type="hidden" name="model.submitFlag" value="EBL000001" />
		<input type="hidden" name="os" value="i" />
		
		<input type="text" name="pm.message"/>
		<input type="text" name="pm.count"/>
		<input type="text" name="pm.tokens" value="d378264d2a8f5acd26c1ac124c323c16c304a2cf4d291d58039fb039a2b56070"/>
		
		<input type="submit" value="提交"/>
	</form>
	
</body>
</content>
