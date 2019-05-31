<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/util/bootstrap/css/bootstrap.css" /> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/util/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sdmenu.js"></script>
  </head>
<body>
<jsp:include page="/frame/head.jsp"/>
<div id="middle">
	<jsp:include page="/frame/stu_menu.jsp"/>
    <div class="right"  id="mainFrame">
         <div class="right_cont">
              <ul class="breadcrumb">当前位置：
                <span>学生</span> <span class="divider">/</span>
               	<b>首页</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><b>首页</b></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid">
             	<div class="col-md-12">
             		<div id="index">
	             		<h1 align="center" style="font-family:'宋体'">欢迎您,<span style="color:red"><%=session.getAttribute("stuName") %></span>&nbsp;同学</h1>
	             		<h3 align="center">所在楼栋: <span style="color:red">${sessionScope.stuBanId} </span>栋 , 
	             				宿舍: <span style="color:red"> ${sessionScope.stuDormId}</span></h3>
             		</div>
             	</div>
			 </div>
        </div>
    </div><!-- end right -->
</div><!-- end middle -->
<jsp:include page="/frame/footer.jsp"/>
</body>
</html>
