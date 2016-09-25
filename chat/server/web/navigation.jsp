<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="com.demo.server.common.Config"%>

<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="ztree/css/demo.css" type="text/css">
	<link rel="stylesheet" href="ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="ztree/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="ztree/js/jquery.ztree.core-3.5.js"></script>
	<SCRIPT type="text/javascript">
		<!--
		var setting = {
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeClick: function(treeId, treeNode) {
					var zTree = $.fn.zTree.getZTreeObj("tree");
					if (treeNode.isParent) {
						zTree.expandNode(treeNode);
						return false;
					} else {
						parent.frames["mainFrame"].location = treeNode.file;
						return true;
					}
				}
			}
		};

		var zNodes =[
			{ id:1, pId:0, name:"模块管理", open:true, iconSkin:"pIcon01"},
			{ id:11, pId:1, name:"菜单类别", iconSkin:"icon01", file:"/<%=Config.PROJ_NAME%>/hotel.action?model.submitFlag=EBL000002"},
			{ id:12, pId:1, name:"产品", iconSkin:"icon02", file:"/<%=Config.PROJ_NAME%>/landscape.action?model.submitFlag=EBL000002"},
			{ id:2, pId:0, name:"系统管理", open:true, iconSkin:"pIcon02"},
			{ id:21, pId:2, name:"用户管理", iconSkin:"icon04", file:"/<%=Config.PROJ_NAME%>/user.action?model.submitFlag=EBL000002"},
			{ id:22, pId:2, name:"机器管理", iconSkin:"icon04", file:"/<%=Config.PROJ_NAME%>/user.action?model.submitFlag=EBL000002"},
			{ id:3, pId:0, name:"其它管理", open:true, iconSkin:"pIcon02"},
			{ id:31, pId:3, name:"地区", iconSkin:"icon04", file:"/<%=Config.PROJ_NAME%>/province.action?model.submitFlag=EBL000003"},

		];

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		//-->
	</SCRIPT>
	<style type="text/css">
		.ztree li span.button.pIcon01_ico_open{margin-right:2px; background: url(ztree/css/zTreeStyle/img/diy/1_open.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.pIcon01_ico_close{margin-right:2px; background: url(ztree/css/zTreeStyle/img/diy/1_close.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.pIcon02_ico_open, .ztree li span.button.pIcon02_ico_close{margin-right:2px; background: url(ztree/css/zTreeStyle/img/diy/2.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon01_ico_docu{margin-right:2px; background: url(ztree/css/zTreeStyle/img/diy/3.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon02_ico_docu{margin-right:2px; background: url(ztree/css/zTreeStyle/img/diy/4.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon03_ico_docu{margin-right:2px; background: url(ztree/css/zTreeStyle/img/diy/5.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon04_ico_docu{margin-right:2px; background: url(ztree/css/zTreeStyle/img/diy/6.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon05_ico_docu{margin-right:2px; background: url(ztree/css/zTreeStyle/img/diy/7.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon06_ico_docu{margin-right:2px; background: url(ztree/css/zTreeStyle/img/diy/8.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
	</style>
</HEAD>

<BODY>
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	
</div>
</BODY>
</html>
