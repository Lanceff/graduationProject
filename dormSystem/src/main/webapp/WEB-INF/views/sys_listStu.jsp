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
			$("#changeBtn").click(updateStuInfo);
		});
		
		function getBanIdList() {
			$.ajax({
				 type:"post",
				 url:"${pageContext.request.contextPath}/selectBanIdList",
      			 dataType:"json",
       			 success:function(data) {
       			   var td = "<select id='stuBanId' class='form-control'>";
       			 	for(var i=0;i<data.length;i++) {
       			 		td += "<option value='"+data[i]+"'>"+data[i]+"</option>";
       			 	}
       			 	td += "</select>";
       			 	$("#addTd").html(td);
       			 }
			});
		}
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
                    	var operation = "<span class='glyphicon glyphicon-pencil'></span><a onclick=listToDialog("+ data.stuId +") data-toggle='modal' data-target='#myModal'> 修改</a>&nbsp;&nbsp;&nbsp;&nbsp;" 
                    				   +"<span class='glyphicon glyphicon-trash'></span><a onclick=delStu("+data.stuId+")> 删除</a>";
                    				   
                    	var tr = "<tr><td>"+data.stuId+"</td><td>"+data.stuName+"</td><td>" +data.stuSex+"</td><td>"
                    	 			+data.stuOrg +"</td><td>"+data.stuNz+"年制</td><td>"+data.stuGride+"级</td><td>"
                    	 			+ data.stuXy + "</td><td>" + data.stuMajor + "</td><td>"+ data.stuTel+"</td><td>"
                    	 			+ data.stuBanId + "</td><td>" +data.stuDormId +"</td><td>" + data.stuInState + "</td><td>"
                    	 			+ operation+ "</td></tr>";
                    	 $("#tabInfo").append(tr);
				    },
				    error:function() {
				    	alert("未找到对应的学生信息");
				    }
			});
		}
		
		function delStu(stuId) {
			var flag = confirm("确认删除"+stuId+"号学生吗?");
			if(flag) {
				$.ajax({
					url:'${pageContext.request.contextPath}/delStuById',
                    type:'post',
                    data: {"stuId":stuId},
                    dataType: "json",
                    success:function(data){
                    	if(data=="1") {
	                    		alert("删除"+stuId+"学生成功");
	                    		window.location.reload();
	                    }
                    }
	            });
			}
		}
		
		function listToDialog(stuId) {
			$.ajax({
				 url:'${pageContext.request.contextPath}/selectOneStu',
                 type:'post',
                 data:{"stuId":stuId},
                 dataType: "json",
                 success:function(data){
                 	$("#stuId").val(data.stuId);
                 	$("#stuName").val(data.stuName);
                 	$("#stuSex").val(data.stuSex);
                 	$("#stuOrg").val(data.stuOrg);
                 	$("#stuXy").val(data.stuXy);
                 	$("#stuMajor").val(data.stuMajor);
                 	$("#stuNz").val(data.stuNz);
			 		$("#stuGride").val(data.stuGride);
					$("#stuTel").val(data.stuTel);
					$("#stuBanId").val(data.stuBanId);
					$("#stuDormId").val(data.stuDormId);
					$("#stuInState").val(data.stuInState);
                 }
	         });
		}
		
		function updateStuInfo() {
			var stuId = $("#stuId").val();
			var stuName = $("#stuName").val();
			var stuSex = $("#stuSex").val();
			var stuOrg = $("#stuOrg").val();
			var stuXy = $("#stuXy").val();
			var stuMajor = $("#stuMajor").val();
			var stuNz = $("#stuNz").val();
			var stuGride = $("#stuGride").val();
			var stuTel = $("#stuTel").val();
			var stuBanId = $("#stuBanId").val();
			var stuDormId = $("#stuDormId").val();
			var stuInState = $("#stuInState").val();
			
			var stu = {"stuId":stuId,"stuName":stuName,"stuSex":stuSex,
						"stuOrg":stuOrg,"stuXy":stuXy,"stuMajor":stuMajor,
						"stuNz":stuNz,"stuGride":stuGride,"stuTel":stuTel,
						"stuBanId":stuBanId,"stuDormId":stuDormId,"stuInState":stuInState};
			  $.ajax({
				 type:"post",
				 url:"${pageContext.request.contextPath}/updateStuInfo",
        		 data:JSON.stringify(stu),
      			 dataType:"json",
      			 contentType:"application/json",
       			 success:function(data) {
       			 	if(data==1) {
       			 		alert("修改学生信息成功");
       			 		window.location.reload();
       			 	}
       			 },
       			 error:function(){
       			 	alert("error");
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
               	<b>学生操作</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><strong>学生信息</strong></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid" style="height:350px;">
             	<div class="row">
             		 <div class="col-md-12">
					 	<div>
					 		<table align="center">
					 			<tr>
					 				<td><label for="selectId">输入学号或姓名：</label></td>
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
					 				<th>操作</th>
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
					 					<td>
					 						<span class='glyphicon glyphicon-pencil'></span><a onclick="listToDialog(${c.stuId})" data-toggle='modal' data-target='#myModal'> 修改</a>&nbsp;&nbsp;&nbsp;&nbsp; 
                    						<span class='glyphicon glyphicon-trash'></span><a onclick="delStu(${c.stuId})"> 删除</a>
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
			                <li><a href="${pageContext.request.contextPath}/sys_operationStu?pn=1">首页</a></li>
			                <!--上一页-->
			                <li>
			                    <c:if test="${pageinfo.hasPreviousPage}">
			                        <a href="${pageContext.request.contextPath}/sys_operationStu?pn=${pageinfo.pageNum-1}" aria-label="Previous">
			                           <span aria-hidden="true">«</span>
			                        </a>
			                    </c:if>
			                 </li>
			                <!--循环遍历连续显示的页面，若是当前页就显示，并且没有链接-->
			                <c:forEach items="${pageinfo.navigatepageNums}" var="page_num">
			                    <c:if test="${page_num == pageinfo.pageNum}">
			                         <li class="active"><a href="${pageContext.request.contextPath}/sys_operationStu?pn=${page_num}">${page_num}</a></li>
			                    </c:if>
			                    <c:if test="${page_num != pageinfo.pageNum}">
			                        <li><a href="${pageContext.request.contextPath}/sys_operationStu?pn=${page_num}">${page_num}</a></li>
			                    </c:if>
			                </c:forEach>
			
			                <!--下一页-->
			                <li>
			                    <c:if test="${pageinfo.hasNextPage}">
			                        <a href="${pageContext.request.contextPath}/sys_operationStu?pn=${pageinfo.pageNum+1}" aria-label="Next">
			                          <span aria-hidden="true">»</span>
			                        </a>
			                    </c:if>
			                </li>
			                <!-- 尾页 -->
			                <li><a href="${pageContext.request.contextPath}/sys_operationStu?pn=${pageinfo.pages}">尾页</a></li>
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
  <div class="modal-dialog ">
    <div class="modal-content modal-lg" align="center">
    	<div class="modal-header" align="center">
    		学生信息修改
    	</div>
      <div class="modal-body">
      	<form>
      	<table align="center" class="table table-bordered">
      		<tr>
      			<td class="active">学号</td>
      			<td><input type="text" disabled class="form-control input-xs" id="stuId"></td>
      			<td class="active">姓名</td>
      			<td><input type="text" class="form-control input-xs" id="stuName" required></td>
      		</tr>
      		<tr>
      			<td class="active">性别</td>
      			<td>
      				<select class="form-control" id="stuSex">
      					<option value="男">男</option>
      					<option value="女">女</option>
      				</select>
      			</td>
      			<td class="active">籍贯</td>
      			<td><input type="text" class="form-control input-xs" id="stuOrg" required></td>
      		</tr>
      		<tr>
      			<td class="active">年制</td>
      			<td>
      				<select id="stuNz" class="form-control">
  			 	 		<option value="2">2年制</option>
  			 	 		<option value="3">3年制</option>
  			 	 		<option value="4">4年制</option>
  			 	 		<option value="5">5年制</option>
             	   </select>
      			</td>
      			<td class="active">年级</td>
    			<td>
    				<select id="stuGride" class="form-control">
    						<option value="2013">2013级</option>
 			 	 			<option value="2014">2014级</option>
 			 	 			<option value="2015">2015级</option>
 			 	 			<option value="2016">2016级</option>
 			 	 			<option value="2017">2017级</option>
 			 	 			<option value="2018">2018级</option>
 			 	 			<option value="2019">2019级</option>
 			 	 			<option value="2020">2020级</option>
   			 	 	</select>
    			</td>
      		</tr>
      		<tr>
      			<td class="active">学院</td>
        		<td><input type="text" id="stuXy" class="form-control input-xs" required></td>
        		<td class="active">专业</td>
        		<td><input type="text" id="stuMajor" class="form-control input-xs" required></td>
      		</tr>
      		<tr>
      			<td class="active" >联系方式:</td>
      			<td><input type="text" class="form-control input-xs" id="stuTel" required></td>
      			<td class="active">住宿楼栋</td>
         		<td id="addTd">
    			 <select id="stuBanId" class="form-control">
     			 	<c:forEach items="${bans}" var="c">
     			 		<option value="<c:out value='${c}'/>"><c:out value="${c}"/>栋</option>
     			 	</c:forEach>
    			 </select>
         		</td>
      		</tr>
      		<tr>	
      			<td class="active">宿舍</td>
           		<td><input type="text" id="stuDormId" class="form-control input-xs" required></td>
		 		<td class="active">入住状态</td>
		 		<td>	
		 			<select id="stuInState" class="form-control">
		 				 <option vlaue="已入住">已入住</option>
		 				 <option vlaue="未入住">未入住</option>
		 			</select>
		 		</td>
      		</tr>
      	</table>
      </div>
      <div class="modal-footer" style="text-align:center">
        <input type="submit" class="btn btn-primary" value=" 修改 " style="width:100px" id="changeBtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button type="button" class="btn btn-danger" style="width:100px" data-dismiss="modal">取消</button>
      </div>
      </form>
    </div>
  </div>
</div><!-- end Modal -->
<jsp:include page="/frame/footer.jsp"/>
</body>
</html>
