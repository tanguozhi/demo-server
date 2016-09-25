<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*"%>
<%@ page import="com.demo.server.common.Config"%>

<?xml version="1.0" encoding="utf-8" ?>
<content>
<head>
	<title>表数据详情</title>
	<link href="/<%=Config.PROJ_NAME%>/server/web/install/table_blue.css" rel="stylesheet" type="text/css" />
	<style>
	</style>
	<script>
		function toInstallDetail() {
			document.getElementById("installDeatilForm").submit(); 
		}
		
		function toInsertData() {
			document.getElementById("to_insert_data_form").submit(); 
		}
		
		function toRemoveAllData() {
			document.getElementById("to_remove_all_data_form").submit(); 
		}
		
		function toUpdate(updateKey, formId) {
			var select_key = document.getElementsByName("select_key")[0].value;
			document.getElementsByName(updateKey)[0].value = select_key;
			
			if(select_key==""){
				alert("请先返择要编辑的关键字段！");
				return;
			}
			document.getElementById(formId).submit(); 
		}
		
		function toDelete(deleteKey, formId) {
			var select_key = document.getElementsByName("select_key")[0].value;
			document.getElementsByName(deleteKey)[0].value = select_key;
			if(select_key==""){
				alert("请先返择要删除的关键字段！");
				return;
			}
			if(confirm("确定要删除吗?")) {
				document.getElementById(formId).submit();
			}
		}
	</script>
</head>

<%
	List<String> columnList = new ArrayList<String>();
	List<Map<String, String>> contentList = new ArrayList<Map<String, String>>();
	
	String tableName = (String)request.getAttribute("tableName");
	
	Map<String, List> allDataMap = (Map<String, List>)request.getAttribute("allDataMap");
	if(null!=allDataMap && allDataMap.size()>0) {
		columnList = allDataMap.get("column");
		contentList = allDataMap.get("content");
	}
%>

<body>
	<form method="post" id="installDeatilForm" action="/<%=Config.PROJ_NAME%>/install.action">
		<input type="hidden" name="model.submitFlag" value="EBL000006"/>
	</form>
	<table border="1" align="center" width="800" class="t1">
		<tr class="a1">
			<td colspan="<%=columnList.size()%>">
				<input type="button" value="返回" onclick="toInstallDetail()"/>
			</td>
			<td>
				<select name="select_key">
					<option value=""></option>
<%
	for(int i=0; i<columnList.size(); i++){
%>
					<option value="<%=columnList.get(i)%>"><%=columnList.get(i)%></option>
<%
	}
%>
				</select>
			</td>
		</tr>
		<tr align="center">
			<td colspan="<%=columnList.size()+1%>"><label><%=tableName%></label></td>
		</tr>
		<tr class="a1" align="center">
<%
	for(int i=0; i<columnList.size(); i++){
%>	
			<td><%=columnList.get(i)%></td>
<%
	}
%>
			<td>操作</td>
		</tr>
<%
	for(int i=0; i<contentList.size(); i++){
%>
		<tr align="center">
<%
		Map<String, String> mapTemp = contentList.get(i);

		for(int j=0; j<columnList.size(); j++) {
			String key = columnList.get(j);
			String value = mapTemp.get(key);
			if(null==value) {
				value="";
			}
%>	
			<td><label><%=value%></label></td>
<%
		}
		
		String updateFormId = "to_upate_form_"+i;
		String updateKey = "update_key_"+i;
		String deleteFormId = "to_delete_form_"+i;
		String deleteKey = "delete_key_"+i;
%>
			<td>
				<br/>
				<form id="<%=updateFormId%>" method="post" action="/<%=Config.PROJ_NAME%>/dbmanager.action">
					<input type="hidden" name="model.submitFlag" value="EBL000007"/>
					<input type="hidden" name="dbmm.tableName" value="<%=tableName%>"/>
					<input type="hidden" name="update_key_number" value="<%=i%>"/>
					<input type="hidden" name="<%=updateKey%>" value=""/>
				<%
					for(int j=0; j<columnList.size(); j++) {
						String key = columnList.get(j);
						String value = mapTemp.get(key);
						if(null==value) {
							value="";
						}
				%>
					<input type="hidden" name="<%=key%>" value="<%=value%>"/>
				<%
					}
				%>
					<input type="button" value="编辑" onclick="toUpdate('<%=updateKey%>', '<%=updateFormId%>')"/>
				</form>
				
				<form id="<%=deleteFormId%>" method="post" action="/<%=Config.PROJ_NAME%>/dbmanager.action">
					<input type="hidden" name="model.submitFlag" value="EBL000005"/>
					<input type="hidden" name="dbmm.tableName" value="<%=tableName%>"/>
					<input type="hidden" name="<%=deleteKey%>" value=""/>
					<input type="hidden" name="delete_key_number" value="<%=i%>"/>
				<%
					for(int j=0; j<columnList.size(); j++) {
						String key = columnList.get(j);
						String value = mapTemp.get(key);
						if(null==value) {
							value="";
						}
				%>
					<input type="hidden" name="<%=key%>" value="<%=value%>"/>
				<%
					}
				%>
					<input type="button" value="删除" onclick="toDelete('<%=deleteKey%>', '<%=deleteFormId%>')"/>
				</form>
				
			</td>
		</tr>
<%
	}
%>

		<tr align="center">
			<td colspan="<%=columnList.size()+1%>">
				<input type="button" value="添加数据" onclick="toInsertData()"/>
				<input type="button" value="删除所有数据" onclick="toRemoveAllData()"/>
			</td>
		</tr>
	</table>
	
	<form method="post" id="to_insert_data_form" action="/<%=Config.PROJ_NAME%>/dbmanager.action">
		<input type="hidden" name="model.submitFlag" value="EBL000002"/>
		<input type="hidden" name="dbmm.tableName" value="<%=tableName%>"/> 
	</form>
	
	<form method="post" id="to_remove_all_data_form" action="/<%=Config.PROJ_NAME%>/dbmanager.action">
		<input type="hidden" name="model.submitFlag" value="EBL000004"/>
		<input type="hidden" name="dbmm.tableName" value="<%=tableName%>"/> 
	</form>
	
</body>
</content>
