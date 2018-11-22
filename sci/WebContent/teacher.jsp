<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科研项目管理</title>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Brand</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" />
						</div>
						<button type="submit" class="btn btn-default"
							style="margin-right: 20px">搜索</button>
						<button type="submit" class="btn btn-default">添加</button>
					</form>

					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">我的</a></li>
						<li><a href="#">退出</a></li>
					</ul>
				</div>

				</nav>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>序号</th>
							<th>题目</th>
							<th>申请时间</th>
							<th>类型</th>
							<th>审核状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Tanmay</td>
							<td>Bangalore</td>
							<td>Tanmay</td>
							<td>Bangalore</td>
							<td>
								<div class="btn-group">
									<button type="button" class="btn btn-default">修改</button>
									<button type="button" class="btn btn-default">删除</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Sachin</td>
							<td>Mumbai</td>
							<td>Tanmay</td>
							<td>Bangalore</td>
							<td>
								<div class="btn-group">
									<button type="button" class="btn btn-default">修改</button>
									<button type="button" class="btn btn-default">删除</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>