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
    
    <title>楼栋管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/util/bootstrap/css/bootstrap.css" /> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/util/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/sdmenu.js"></script>
	<style type="text/css">
		#stuInfo th,td{
			text-align:center;
		}
	</style>
	<script type="text/javascript">
	</script>
  </head>
<body>
<jsp:include page="/frame/head.jsp"/>
<div id="middle">
	<jsp:include page="/frame/stu_menu.jsp"/>
    <div class="right"  id="mainFrame">
         <div class="right_cont">
              <ul class="breadcrumb">
              	当前位置：
                <span>学生</span> <span class="divider">/</span>
               	<b>学生信息</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><strong>宿舍成员信息</strong></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid" style="height:350px;">
             	<div class="row">
             		 <div class="col-md-12">
					 	<div id="stuInfo" style="margin-top:40px;" >
					 		<table class="table table-bordered table-hover">
					 			<tr id="ttitle" class="success">
					 				<th>学号</th>
					 				<th>姓名</th>
					 				<th>性别</th>
					 				<th>籍贯</th>
					 				<th>学年制</th>
					 				<th>年级</th>
					 				<th>学院</th>
					 				<th>专业</th>
					 				<th>联系方式</th>
					 				<th>楼栋号</th>
					 				<th>寝室号</th>
					 				<th>入住情况</th>
					 			</tr>
					 			<c:forEach items="${lists}" var="c">
					 				<tr>
					 					<td>${c.stuId}</td>
					 					<td>${c.stuName}</td>
					 					<td>${c.stuSex}</td>
					 					<td>${c.stuOrg}</td>
					 					<td>${c.stuNz}年制</td>
					 					<td>${c.stuGride}级</td>
					 					<td>${c.stuXy}</td>
					 					<td>${c.stuMajor}</td>
					 					<td>${c.stuTel}</td>
					 					<td>${c.stuBanId}</td>
					 					<td>${c.stuDormId}</td>
					 					<td>${c.stuInState}</td>
					 				</tr>
					 			</c:forEach>
					 		</table>
					 	</div>
                	</div><!-- end col-md-12 -->
                </div> <!-- end row -->
       	     </div><!-- end content -->
       </div><!-- end right_cont -->
    </div><!-- end right -->
</div><!-- end middle -->
<jsp:include page="/frame/footer.jsp"/>
</body>
</html>
