<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<script type="text/javascript">
	</script>
  </head>
<body>
<jsp:include page="/frame/head.jsp"/>
<div id="middle">
	<jsp:include page="/frame/dorm_menu.jsp"/>
    <div class="right"  id="mainFrame">
         <div class="right_cont">
              <ul class="breadcrumb">当前位置：
                <span>楼栋管理员</span> <span class="divider">/</span>
               	<b>楼栋信息</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><b>楼栋信息查看</b></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid">
             	<div class="col-md-12" align="center" style="margin-top:50px">
	             		<div class="panel panel-success" style="width:550px">
						  <div class="panel-heading">楼栋信息</div>
						  <div class="panel-body">
						    <table class="table table-bordered" style="text-align:center">
						    	<tr>
						    		<td class="active">楼栋号</td>
						    		<td>${baninfo.banId}</td>
						    	</tr>
						    	<tr>
						    		<td class="active">楼栋类型</td>
						    		<td>
							    		 <c:choose> 
										   <c:when test="${baninfo.banType=='1'}">男生宿舍</c:when> 
										   <c:otherwise>女生宿舍 </c:otherwise> 
										 </c:choose> 
									</td>
						    	</tr>
						    	<tr>
						    		<td class="active">楼栋管理员</td>
						    		<td>${sessionScope.usercode}(${sessionScope.dormSysName})</td>
						    	</tr>
						    	<tr>
						    		<td class="active">楼栋房间数(间)</td>
						    		<td>${baninfo.banRoomNum}</td>
						    	</tr>
						    	<tr>
						    		<td class="active">描述</td>
						    		<td>${baninfo.banDesc}</td>
						    	</tr>
						    </table>
						  </div>
						</div><!-- end panel -->
             	</div>
			 </div>
        </div>
    </div><!-- end right -->
</div><!-- end middle -->
<jsp:include page="/frame/footer.jsp"/>
</body>
</html>
