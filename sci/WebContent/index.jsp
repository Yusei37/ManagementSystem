<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>  
    <title>Login</title>  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Login.css"/>  
    <script type="text/javascript"  src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
</head>  
<body>  
    <div id="login">  
        <h1>Login</h1>  
            <input type="text" required="required" placeholder="用户名" id="userid"></input>  
            <input type="password" required="required" placeholder="密码" id="password"></input>  
            <button class="but" onclick="login()">登录</button>  
    </div>  
</body>  
<script type="text/javascript">
	function login(){
		var user = {};
		user.userid = $("#userid").val();
		console.log(user);
		$.ajax({
			url : "${pageContext.request.contextPath }/user/"+user.userid,
			type : "GET", 
			dataType : "json",         
			success : function(data){
				console.log(data);
				if(data.userId != null){	
				    alert("您查询的用户是："+data.userId);
				    window.location = "teacher.jsp"
				}else{
				    alert("没有找到id为:" + user.userid + "的用户！");
				}
			}
		});
	}
</script>
</html>  