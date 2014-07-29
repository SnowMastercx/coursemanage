﻿<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!--禁止缩放，适合设备尺寸-->
		<meta name="viewport" content="width=device-width, 
									   initial-scle=1.0,
									   maximum-scale=1.0,
									   user-scalable=no">
		<link href="css/bootstrap.min.css" rel="stylesheet">
        
		<style>
			#bg{background-color:#8FB0D1;position:relative;}
	      	#win{filter:alpha(opacity=80);opacity:0.80;position:absolute;left:20%;top:50%;z-index:1002;margin:-100px -100px 0;border:4px #000 solid;background:#FFF;display:none;}
	      	#fade{-moz-opacity:0.50;filter:alpha(opacity=50);opacity:0.50;width:100%;height:100%;position:fixed;left:0%;top:0%;background-color:#f5f5f5;z-index:1001;display:none;}
	      	#bg thead{background-color:green;}
	      	#win thead{background-color:yellow;}
		</style>
		
	</head>
	
	<body>
		<div id="bg">
			<ul style="background-color:black" class="nav nav-tabs">
				<li><a href="#"><strong>课程类型</strong></a></li>
				<li><a href="javascript:void(0);" onclick="Winopen('ADD')">新增</a></li>
				<li><a href="javascript:void(0);" onclick="Winopen('MODIFY')">修改</a></li>
				<li><a href="javascript:void(0);" onclick="OutputToExcel()">导出</a></li>
				<li><a href="javascript:void(0);" onclick="Winopen('DELETE')">删除</a></li>
		       	<li class="pull-right"><a href="home">返回</a></li> 
			</ul>
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th class="text-center">序号</th>
						<th class="text-center">课程类别码</th>
						<th class="text-center">课程类别</th>
						<th class="text-center">课程性质</th>
						<th class="text-center">是否需要重考</th>
						<th class="text-center">是否需要重修</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<s:iterator value="coursetypes" var="coursetype">
		                <tr>
		                    <td><s:property value="#coursetype.id"/></td>
		                    <td><s:property value="#coursetype.typecore"/></td>
		                    <td><s:property value="#coursetype.type"/></td>
		                    <td><s:property value="#coursetype.quality"/></td>
		                    <td><s:property value="#coursetype.reexamine"/></td>
		                    <td><s:property value="#coursetype.retake"/></td>
		                </tr>
		        	</s:iterator>
				</tbody>
			</table>
	    </div>
		<div id="win">
			<form id="coursetypeform" >
				<table class="table table-bordered">
					<thead>
			            <tr>
			            	<th class="text-center">序号</th>
							<th class="text-center">课程类别码</th>
							<th class="text-center">课程类别</th>
						</tr>
					</thead>
	            	<tbody class="text-center">
						<tr>
							<td><input type="text" name="coursetype.id"></td>
							<td><input type="text" name="coursetype.typecore"></td>
							<td><input type="text" name="coursetype.type"></td>
						</tr>
					</tbody>
					<thead>
			            <tr>
							<th class="text-center">课程性质</th>
							<th class="text-center">是否需要重考</th>
							<th class="text-center">是否需要重修</th>
						</tr>
					</thead>
	            	<tbody class="text-center">
						<tr>
							<td><input type="text" name="coursetype.quality"/></td>
							<td><input type="text" name="coursetype.reexamine"></td>
							<td><input type="text" name="coursetype.retake"></td>
						</tr>
					</tbody>
				</table>
				<p align="center">
					<input type="submit" id="wincommit" name="wincommit" value="确认" />
					<input type="submit" name="wincancle" value="取消"/>
				</p>
			</form>
		</div>
		<div id="fade"></div>
	</body>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var $=function(id)
		{
			return document.getElementById(id);
		}
	
		function Winopen(str)
		{
			var win=new WinSize();
			var Tip=$("fade");
			Tip.style.width=win.W+"px";
			Tip.style.height=win.H+"px";
			$("fade").style.display="block";
			$("win").style.display="block";
			if(str=='ADD'){
				$("wincommit").onclick=addCoursetype;
			}
			if(str=='MODIFY'){
				$("wincommit").onclick=modifyCoursetype;
			}
			if(str=='QUERY'){
				$("wincommit").onclick=queryCoursetype;
			}

			if(str=='DELETE'){
				$("wincommit").onclick=deleteCoursetype;
			}
		}
	
		function WinSize() //函数：获取尺寸
		{
			var winWidth = 0;
			var winHeight = 0;
			if (window.innerWidth)
				winWidth = window.innerWidth;
			else if ((document.body) && (document.body.clientWidth))
				winWidth = document.body.clientWidth;
			if (window.innerHeight)
				winHeight = window.innerHeight;
			else if ((document.body) && (document.body.clientHeight))
				winHeight = document.body.clientHeight;
			if (document.documentElement  && document.documentElement.clientHeight
				&& document.documentElement.clientWidth)
			{
				winHeight = document.documentElement.clientHeight;
				winWidth = document.documentElement.clientWidth;
			}
			return{"W":winWidth,"H":winHeight}
		}
		
		function addCoursetype()
		{
			var myform=document.forms[0];
			myform.action="coursetype_addCoursetype";
			myform.method="post";
			myform.submit();
		}
		
		function modifyCoursetype()
		{
			var myform=document.forms[0];
			myform.action="coursetype_modifyCoursetype";
			myform.method="post";
			myform.submit();
		}
		
		function deleteCoursetype()
		{
			var myform=document.forms[0];
			myform.action="coursetype_deleteCoursetype";
			myform.method="post";
			myform.submit();
		}

		function queryCoursetype()
		{
			var myform=document.forms[0];
			myform.action="coursetype_queryCoursetype";
			myform.method="post";
			myform.submit();
		}
		function OutputToExcel()
		{
			var myform=document.forms[0];
			myform.action="coursetype_QueryCoursetypeOutputToExcel";
			myform.method="post";
			myform.submit();
		}
	</script>
</html>
