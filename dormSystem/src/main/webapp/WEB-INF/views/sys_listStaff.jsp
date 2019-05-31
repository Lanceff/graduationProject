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
		#staffInfo th,td{
			text-align:center;
		}
	</style>
	<script type="text/javascript">
		$(function() {
			$("#search").click(selectOneById);
			$("#changeBtn").click(changeInfo);
		});
		
		function selectOneById() {
			var staffId = $("#selectId").val();
			if(staffId == ""){ 
				alert("请输入员工号！");
				return;
			}
			$.ajax({
				    url:'${pageContext.request.contextPath}/selectOneById',
                    type:'post',
                    data:{"staffId":staffId},
                    dataType:"json",
                    success:function(data){
                    	$("#ttitle").nextAll().remove();
                    	$("#page").remove();
                    	var operation = "<span class='glyphicon glyphicon-pencil'></span><a onclick=listToDialog("+ data.staffId +") data-toggle='modal' data-target='#myModal'> 修改</a>&nbsp;&nbsp;&nbsp;&nbsp;" 
                    				   +"<span class='glyphicon glyphicon-trash'></span><a onclick=delStaff("+data.staffId+")> 删除</a>";
                    				   
                    	 var tr = "<tr><td>"+data.staffId+"</td><td>"+data.staffName+"</td><td>" +data.staffSex+"</td><td>"
                    	 			+data.staffAge+"</td><td>"+data.staffOrg+"</td><td>"+data.staffTel+"</td><td>"+ operation
                    	 			+ "</td></tr>";
                    	 $("#tabInfo").append(tr);
                    },error:function(){
                    	alert("不存在"+staffId+"号员工");
                    }
			});
		}
		
		function delStaff(staffId) {
			var flag = confirm("确认删除"+staffId+"员工吗?");
			if(flag) {
				$.ajax({
					url:'${pageContext.request.contextPath}/deleteStaffById',
                    type:'post',
                    data: {"staffId":staffId},
                    dataType: "json",
                    success:function(data){
                    	if(data=="1") {
	                    		alert("删除"+staffId+"员工成功");
	                    		window.location.reload();
	                    }
                    }
	            });
			}
		}
		
		function listToDialog(staffId) {
			$.ajax({
				 url:'${pageContext.request.contextPath}/selectOneById',
                 type:'post',
                 data:{"staffId":staffId},
                 dataType: "json",
                 success:function(data){
                 	$("#staffId").val(data.staffId);
                 	$("#staffSex").val(data.staffSex);
                 	$("#staffName").val(data.staffName);
                 	$("#staffAge").val(data.staffAge);
                 	$("#staffOrg").val(data.staffOrg);
                 	$("#staffTel").val(data.staffTel);
                 }
	         });
		}
		
		function changeInfo() {
			var staffId = $("#staffId").val();
			var staffSex = $("#staffSex").val();
			var staffName = $("#staffName").val();
			var staffAge = $("#staffAge").val();
			var staffOrg = $("#staffOrg").val();
			var staffTel = $("#staffTel").val();
			var staff = {"staffId":staffId,"staffSex":staffSex,"staffName":staffName,"staffAge":staffAge,"staffOrg":staffOrg,"staffTel":staffTel};
			$.ajax({
					url:'${pageContext.request.contextPath}/updateStaff',
                    type:'post',
                    data: JSON.stringify(staff),
                    contentType:"application/json;charset=UTF-8",
                    dataType: "json",
                    success:function(data){
                    	if(data=="1") alert("更新成功");
                    	window.location.reload();
                    }
	            }); 
		}
		
	</script>
  </head>
<body>
<jsp:include page="/frame/head.jsp"/>
<div id="middle">
	<jsp:include page="/frame/sys_menu.jsp"/>
    <div class="right"  id="mainFrame">
         <div class="right_cont">
              <ul class="breadcrumb">
              	当前位置：
                <span>系统管理员</span> <span class="divider">/</span>
               	<b>员工操作</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><strong>员工信息</strong></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid" style="height:350px;">
             	<div class="row">
             		 <div class="col-md-12">
					 	<div>
					 		<table align="center">
					 			<tr>
					 				<td><label for="selectId">输入员工号：</label></td>
					 				<td><input type="text" class="form-control input-sm" id="selectId"></td>
					 				<td> &nbsp;&nbsp;&nbsp;<button class="btn btn-success btn-sm" id="search">查找</button></td>
					 			</tr>
					 		</table>
					 	</div>
					 	<div id="staffInfo" style="margin-top:30px;" >
					 		<table class="table table-bordered table-hover" id="tabInfo">
					 			<tr id="ttitle" class="success">
					 				<th>工号</th>
					 				<th>员工名</th>
					 				<th>性别</th>
					 				<th>年龄</th>
					 				<th>籍贯</th>
					 				<th>联系方式</th>
					 				<th>操作</th>
					 			</tr>
					 			<c:forEach items="${lists}" var="c">
					 				<tr>
					 					<td>${c.staffId}</td>
					 					<td>${c.staffName}</td>
					 					<td>${c.staffSex}</td>
					 					<td>${c.staffAge}</td>
					 					<td>${c.staffOrg}</td>
					 					<td>${c.staffTel}</td>
					 					<td>
					 						<span class='glyphicon glyphicon-pencil'></span><a onclick="listToDialog(${c.staffId})" data-toggle='modal' data-target='#myModal'> 修改</a>&nbsp;&nbsp;&nbsp;&nbsp; 
                    						<span class='glyphicon glyphicon-trash'></span><a onclick="delStaff(${c.staffId})"> 删除</a>
					 					</td>
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
			                <li><a href="${pageContext.request.contextPath}/sys_operationStaff?pn=1">首页</a></li>
			                <!--上一页-->
			                <li>
			                    <c:if test="${pageinfo.hasPreviousPage}">
			                        <a href="${pageContext.request.contextPath}/sys_operationStaff?pn=${pageinfo.pageNum-1}" aria-label="Previous">
			                           <span aria-hidden="true">«</span>
			                        </a>
			                    </c:if>
			                 </li>
			                <!--循环遍历连续显示的页面，若是当前页就显示，并且没有链接-->
			                <c:forEach items="${pageinfo.navigatepageNums}" var="page_num">
			                    <c:if test="${page_num == pageinfo.pageNum}">
			                         <li class="active"><a href="${pageContext.request.contextPath}/sys_operationStaff?pn=${page_num}">${page_num}</a></li>
			                    </c:if>
			                    <c:if test="${page_num != pageinfo.pageNum}">
			                        <li><a href="${pageContext.request.contextPath}/sys_operationStaff?pn=${page_num}">${page_num}</a></li>
			                    </c:if>
			                </c:forEach>
			
			                <!--下一页-->
			                <li>
			                    <c:if test="${pageinfo.hasNextPage}">
			                        <a href="${pageContext.request.contextPath}/sys_operationStaff?pn=${pageinfo.pageNum+1}" aria-label="Next">
			                          <span aria-hidden="true">»</span>
			                        </a>
			                    </c:if>
			                </li>
			                <!-- 尾页 -->
			                <li><a href="${pageContext.request.contextPath}/sys_operationStaff?pn=${pageinfo.pages}">尾页</a></li>
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
<!-- Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
    	<div class="modal-header" align="center">
    		员工信息修改
    	</div>
      <div class="modal-body">
      	<form>
      	<table align="center" class="table table-bordered" width="100px">
      		<tr>
      			<td class="active">员工号:</td>
      			<td><input type="text" disabled class="form-control input-xs" id="staffId"></td>
      		</tr>
      		<tr>
      			<td class="active">员工姓名:</td>
      			<td><input type="text" class="form-control input-xs" id="staffName" required></td>
      		</tr>
      		<tr>
      			<td class="active">员工性别:</td>
      			<td>
      				<select class="form-control" id="staffSex">
      					<option value="男">男</option>
      					<option value="女">女</option>
      				</select>
      			</td>
      		</tr>
      		<tr>
      			<td class="active">员工年龄:</td>
      			<td><input type="text" class="form-control input-xs" id="staffAge" required></td>
      		</tr>
      		<tr>
      			<td class="active">员工籍贯:</td>
      			<td><input type="text" class="form-control input-xs" id="staffOrg" required></td>
      		</tr>
      		<tr>
      			<td class="active">联系方式:</td>
      			<td><input type="text" class="form-control input-xs" id="staffTel" required></td>
      		</tr>
      	</table>
      </div>
      <div class="modal-footer" style="text-align:center">
        <input type="submit" class="btn btn-primary" style="width:100px" value=" 修改 " id="changeBtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button type="button" class="btn btn-danger" style="width:100px" data-dismiss="modal">取消</button>
      </div>
      </form>
    </div>
  </div>
</div><!-- end Modal -->
<jsp:include page="/frame/footer.jsp"/>
</body>
</html>
