<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<title>测试界面</title>
	</head>
	<body>
		<button onclick="login()">登录</button>
		<button onclick="addUser()">添加用户</button>
		<button onclick="listUsers()">显示所有用户</button>
		<button onclick="deleteUser()">删除一个用户</button>
		<button onclick="modifyUser()">修改一个用户</button>
	</body>
	<script type="text/javascript">
		function login() {
			let xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", "http://127.0.0.1:8080/sci/user/admin", true);
			xmlhttp.onload = function(e) {
				var data = JSON.parse(this.response);
				console.log(data);
			}
			xmlhttp.send();
		}
		function addUser() {
			let xmlhttp = new XMLHttpRequest();
			xmlhttp.open("POST", "http://127.0.0.1:8080/sci/user", true);
			xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			let formData = new FormData();
			formData.append('userId', 'test');
			formData.append('password', 'test');
			formData.append('username', 'test');
			formData.append('userType', 'teacher');
			xmlhttp.onload = function(e) {
				var data = JSON.parse(this.response);
				console.log(data);
			}
			xmlhttp.send(formData);
		}
		function listUsers() {
			let xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", "http://127.0.0.1:8080/sci/user", true);
			xmlhttp.onload = function(e) {
				var data = JSON.parse(this.response);
				console.log(data);
			}
			xmlhttp.send();
		}
		function deleteUser() {
			let xmlhttp = new XMLHttpRequest();
			xmlhttp.open("DELETE", "http://127.0.0.1:8080/sci/user/t001", true);
			xmlhttp.onload = function(e) {
				var data = JSON.parse(this.response);
				console.log(data);
			}
			xmlhttp.send();
		}
		function modifyUser() {
			let xmlhttp = new XMLHttpRequest();
			xmlhttp.open("PUT", "http://127.0.0.1:8080/sci/user/t002", true);
			let formData = new FormData();
			formData.append('userId', 't002');
			formData.append('password', 't002');
			formData.append('username', 't002');
			formData.append('userType', 'teacher');
			xmlhttp.onload = function(e) {
				var data = JSON.parse(this.response);
				console.log(data);
			}
			xmlhttp.send(formData);
		}
	</script>
</html>

