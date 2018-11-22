<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>RESTful测试</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" 
    src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js">
</script>
<script type="text/javascript">
function login(){
	var user = {};
	user.userid = $("#userid").val();
	$.ajax({
		url : "${pageContext.request.contextPath }/user/"+user.userid,
		type : "GET", 
		dataType : "json",
		success : function(data){
			console.log(data);
			if(data.userId != null){	
			    alert("您查询的用户是："+data.userId);
			}else{
			    alert("没有找到id为:" + user.userid + "的用户！");
			}
		}
	});
}
</script>
</head>
<body>
    <form>
         编号：<input type="text" name="userid" id="userid">
         <input type="text" name="password" id="password">
	    <input type="button" value="登录" onclick="login()" />
    </form> 
</body>
</html>
