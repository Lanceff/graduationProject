<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>系统登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/login.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/login/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
		/* $(function(){
			    $("#form").submit(login);
		});
		function login(){
			var usercode = $("#usercode").val();
			var password = $("#password").val();
			var identity = $("#identity").val();
			var form_data = {"usercode":usercode,"password":password,"identity":identity};
			var loginUser = JSON.stringify(form_data);
			$.ajax({
				 type:"post",
				 url:"${pageContext.request.contextPath}/login_user",
        		 data:loginUser,
        		 contentType:"application/json;charset=UTF-8",
      			 dataType:"json",
       			 success:function(data) {
       			 	if(data=="OK") {
       			 		if(identity=="1") window.location.href="sys_index?usercode="+usercode;
       			 		else if(identity=="2") window.location.href="dormSys_index?usercode="+usercode;
       			 		else if(identity=="3") window.location.href="stuSys_index?usercode="+usercode;
       			 	}
       			 	else if(data=="NO") alert("用户名或者密码错误！");
				 },
				 error:function(){
				 	alert("数据传输错误！");
				 }
			});
		} */
	</script>
  </head>
  <body>
    <div class="loginmain"></div>
    <div class="row-fluid">
        <h1 style="font-family:楷体;padding-left:35px">校园宿舍管理平台</h1>
        <form method="post" id="form" action="login_user">
        <p><label>帐&nbsp;&nbsp;&nbsp;号：<input type="text" id="usercode" name="usercode" required></label></p>
        <p><label>密&nbsp;&nbsp;&nbsp;码：<input type="password" id="password" name="password" required></label></p>
        <p>
            <label>身&nbsp;&nbsp;&nbsp;份：<select name="identity" id="identity">
                    <option value="1">===== 系统管理员 =====</option>
                    <option value="2">===== 楼栋管理员 =====</option>
                    <option value="3">==== &nbsp;&nbsp;&nbsp;学&nbsp;&nbsp;&nbsp;生&nbsp;&nbsp;&nbsp;  ====</option>
                </select>
            </label>
        </p>
        <p class="tip">&nbsp;</p>
        <hr />
        <input type="submit" value=" 登 录 " class="btn btn-primary btn-large">
        	&nbsp;&nbsp;&nbsp;<input type="reset" value=" 重 置 " class="btn btn-large">
        </form>
    </div>
  </body>
</html>
