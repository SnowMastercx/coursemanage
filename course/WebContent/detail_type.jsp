<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!--禁止缩放，适合设备尺寸-->
		<meta name="viewport" content="width=device-width, 
									   initial-scle=1.0,
									   maximum-scale=1.0,
									   user-scalable=no">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<style>
	      	body {background-color:yellow;}
	      	thead {background-color:green;}
	    </style>
	</head>
	<body>
		<ul style="background-color:black" class="nav nav-tabs">
			<li><a href="#"><strong>课程细类管理</strong></a></li>
			<li><a href="#">新增</a></li>
			<li><a href="#">修改</a></li>
			<li><a href="#">删除</a></li>
			<li><a href="#">查询</a></li>	
			<li class="pull-right"><form action="home.jsp"><input style="background-color:yellow; width:60px; height:40px" type="submit" value="返回"/></form></li>         
		</ul>
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="text-center">课程类别细类码</th>
						<th class="text-center">课程类别细类名称</th>
						<th class="text-center">所属课程类别</th>
						<th class="text-center">序号</th>
						<th class="text-center" >是否公共细类</th>
						<th class="text-center">设立单位</th>
						<th class="text-center">备注</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<tr>
						<td><input type="text" name="code" style="width:140px"/></td>
						<td><input type="text" name="name" style="width:120px"/></td>
						<td>
							<select style="width:80px">
								<option>公必</option>
								<option>专必</option>
								<option>公选</option>
								<option>专选</option>
							</select>
						</td>
						<td><input type="text" name="number" style="width:100px"/></td>
						<td>
							<input type="radio" name="reexam" value="exam" />是<br>
							<input type="radio" name="reexam" value="nexam" />否
						</td>
						<td><input type="text" name="place" style="width:100px"/></td>
						<td><input type="text" name="description" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<p align="center">
			<button type="button" onclick="add()">添加</button>
			<button type="button" onclick="findall()">查询</button>
			<button type="button" onclick="modify()">修改</button>
			<button type="button" onclick="delete()">删除</button>
		</p>
		<div class="table-responsive">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th class="text-center">课程类别细类码</th>
						<th class="text-center">课程类别细类名称</th>
						<th class="text-center">所属课程类别</th>
						<th class="text-center">序号</th>
						<th class="text-center">是否公共细类</th>
						<th class="text-center">设立单位</th>
						<th class="text-center">备注</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<tr>
						<td>课程类别细类码1</td>
						<td>课程类别细类名称1</td>
						<td>所属课程类别1</td>
						<td>序号1</td>
						<td>是</td>
						<td>单位1</td>
						<td>备注1</td>
					</tr>
					<tr>
						<td>课程类别细类码2</td>
						<td>课程类别细类名称2</td>
						<td>所属课程类别2</td>
						<td>序号2</td>
						<td>否</td>
						<td>单位2</td>
						<td>备注2</td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>