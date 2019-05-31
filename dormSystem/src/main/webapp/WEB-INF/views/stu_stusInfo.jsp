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
		$(function() {
			$("#search").click(selectOneByParam);
		});
		
		function selectOneByParam() {
			var param = $("#selectId").val();
			if(param=="") {
				alert("查询条件为空");
				return;
			}
			$.ajax({
				url:'${pageContext.request.contextPath}/selectOneByParam',
                    type:'post',
                    data:{"param":param},
                    dataType:"json",
				    success:function(data) {
				    	$("#ttitle").nextAll().remove();
                    	$("#page").remove();
                    				   
                    	var tr = "<tr><td>"+data.stuId+"</td><td>"+data.stuName+"</td><td>" +data.stuSex+"</td><td>"
                    	 			+data.stuOrg +"</td><td>"+data.stuNz+"年制</td><td>"+data.stuGride+"级</td><td>"
                    	 			+ data.stuXy + "</td><td>" + data.stuMajor + "</td><td>"+ data.stuTel+"</td><td>"
                    	 			+ data.stuBanId + "</td><td>" +data.stuDormId +"</td><td>" + data.stuInState + "</td>"
                    	 			+ "</tr>";
                    	 $("#tabInfo").append(tr);
				    },
				    error:function() {
				    	alert("未找到对应的学生信息");
				    }
			});
		}
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
             <div class="title_right"><strong>学生信息查询</strong></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid" style="height:350px;">
             	<div class="row">
             		 <div class="col-md-12">
					 	<div>
					 		<table align="center">
					 			<tr>
					 				<td><label for="selectId">输入学号：</label></td>
					 				<td><input type="text" class="form-control input-sm" id="selectId"></td>
					 				<td> &nbsp;&nbsp;&nbsp;<button class="btn btn-success btn-sm" id="search">查找</button></td>
					 			</tr>
					 		</table>
					 	</div>
					 	<div id="stuInfo" style="margin-top:30px;" >
					 		<table class="table table-bordered table-hover" id="tabInfo">
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
       	     <div id="page" align="center">
       	       <nav aria-label="Page navigation" align="center">
						<ul class="pagination">
						     <!-- 首页 -->
			                <li><a href="${pageContext.request.contextPath}/stu_stusInfo?pn=1">首页</a></li>
			                <!--上一页-->
			                <li>
			                    <c:if test="${pageinfo.hasPreviousPage}">
			                        <a href="${pageContext.request.contextPath}/stu_stusInfo?pn=${pageinfo.pageNum-1}" aria-label="Previous">
			                           <span aria-hidden="true">«</span>
			                        </a>
			                    </c:if>
			                 </li>
			                <!--循环遍历连续显示的页面，若是当前页就显示，并且没有链接-->
			                <c:forEach items="${pageinfo.navigatepageNums}" var="page_num">
			                    <c:if test="${page_num == pageinfo.pageNum}">
			                         <li class="active"><a href="${pageContext.request.contextPath}/stu_stusInfo?pn=${page_num}">${page_num}</a></li>
			                    </c:if>
			                    <c:if test="${page_num != pageinfo.pageNum}">
			                        <li><a href="${pageContext.request.contextPath}/stu_stusInfo?pn=${page_num}">${page_num}</a></li>
			                    </c:if>
			                </c:forEach>
			
			                <!--下一页-->
			                <li>
			                    <c:if test="${pageinfo.hasNextPage}">
			                        <a href="${pageContext.request.contextPath}/stu_stusInfo?pn=${pageinfo.pageNum+1}" aria-label="Next">
			                          <span aria-hidden="true">»</span>
			                        </a>
			                    </c:if>
			                </li>
			                <!-- 尾页 -->
			                <li><a href="${pageContext.request.contextPath}/stu_stusInfo?pn=${pageinfo.pages}">尾页</a></li>
			            </ul>
					  </nav>
					<div align="center">
						当前第&nbsp;[&nbsp;${pageinfo.pageNum}&nbsp;]&nbsp;页,
						共&nbsp;[&nbsp;${pageinfo.pages}&nbsp;]&nbsp;页,
						共&nbsp;[&nbsp;${pageinfo.total}&nbsp;]&nbsp;条记录
					</div>
				</div><!-- end page -->
       </div><!-- end right_cont -->
    </div><!-- end right -->
</div><!-- end middle -->
<jsp:include page="/frame/footer.jsp"/>
</body>
</html>
