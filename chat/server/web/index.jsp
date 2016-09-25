<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ taglib prefix="ww" uri="/struts-tags"%>

<html>
	<frameset rows="100,*" frameborder="no" border="0" framespacing="0">
		<frame src="server/web/top.jsp"></frame>
		<frameset cols="*,1024,*" frameborder="no" border="0" framespacing="0">
			<frame src="about:blank"></frame>
			<frameset cols="25%,75%" frameborder="no" border="0" framespacing="0">
			   <frame src="server/web/navigation.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
			   <frame src="server/web/content.jsp" name="mainFrame" id="mainFrame" />
			</frameset>
			
			<frame src="about:blank"></frame>
		</frameset>
	</frameset>
	
	<noframes>
		<body></body>
	</noframes>
</html>
