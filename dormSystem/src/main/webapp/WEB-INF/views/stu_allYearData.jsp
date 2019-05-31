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
		#tabInfo th,td{
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
               	<b>水电查询</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><strong>一年数据</strong></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid" style="height:350px;">
             	<div class="row">
             		 <div class="col-md-12">
					 	<div id="#useDataInfo" style="margin-top:50px;" >
					 		<table class="table table-bordered table-hover" style="width:1000px" id="tabInfo" align="center">
					 			<tr id="ttitle" class="success">
					 				<th>楼栋号</th>
					 				<th>宿舍号</th>
					 				<th>月份</th>
					 				<th>用电量</th>
					 				<th>电费单价</th>
					 				<th>用水量</th>
					 				<th>水费单价</th>
					 				<th>总电费(元)</th>
					 				<th>总水费(元)</th>
					 			</tr>
					 			<c:forEach items="${lists}" var="c">
					 				<tr>
					 					<td>${c.banId}栋</td>
					 					<td>${c.dormId}</td>
					 					<td>${c.month}月</td>
					 					<td>${c.elecNum}度</td>
					 					<td>${c.elecPrice}元/度</td>
					 					<td>${c.waterNum}吨</td>
					 					<td>${c.waterPrice}元/吨</td>
					 					<td>${c.elecCost}</td>
					 					<td>${c.waterCost}</td>
					 				</tr>
					 			</c:forEach>
					 		</table>
					 	</div>
                	</div><!-- end col-md-12 -->
                </div> <!-- end row -->
       	     </div><!-- end content -->
       	     <div id="page" align="center">
			 		<nav aria-label="Page navigation">
					  <ul class="pagination">
						     <!-- 首页 -->
			                <li><a href="${pageContext.request.contextPath}/stu_allYearData?pn=1">首页</a></li>
			                <!--上一页-->
			                <li>
			                    <c:if test="${pageinfo.hasPreviousPage}">
			                        <a href="${pageContext.request.contextPath}/stu_allYearData?pn=${pageinfo.pageNum-1}" aria-label="Previous">
			                           <span aria-hidden="true">«</span>
			                        </a>
			                    </c:if>
			                 </li>
			                <!--循环遍历连续显示的页面，若是当前页就显示，并且没有链接-->
			                <c:forEach items="${pageinfo.navigatepageNums}" var="page_num">
			                    <c:if test="${page_num == pageinfo.pageNum}">
			                         <li class="active"><a href="${pageContext.request.contextPath}/stu_allYearData?pn=${page_num}">${page_num}</a></li>
			                    </c:if>
			                    <c:if test="${page_num != pageinfo.pageNum}">
			                        <li><a href="${pageContext.request.contextPath}/stu_allYearData?pn=${page_num}">${page_num}</a></li>
			                    </c:if>
			                </c:forEach>
			                <!--下一页-->
			                <li>
			                    <c:if test="${pageinfo.hasNextPage}">
			                        <a href="${pageContext.request.contextPath}/stu_allYearData?pn=${pageinfo.pageNum+1}" aria-label="Next">
			                          <span aria-hidden="true">»</span>
			                        </a>
			                    </c:if>
			                </li>
			                <!-- 尾页 -->
			                <li><a href="${pageContext.request.contextPath}/stu_allYearData?pn=${pageinfo.pages}">尾页</a></li>
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
