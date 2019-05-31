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
	<style type="text/css">
		table{text-align: center;}
		th{text-align:center;}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#search").click(list);
			$("#changeBtn").click(changeInfo);
		});
		
		function pbType(ban_Type) {
			if(banType=="1") var banType = "男生宿舍";
			else var banType = "女生宿舍";
			return banType;
		}
		
		function list() {
			var banId = $("#selectId").val();
			if(banId!="") {
				$("#ttitle").nextAll().remove();
				$("#page").remove();
				$.ajax({
					url:'${pageContext.request.contextPath}/isExitBan',
                    type:'post',
                    data:{"banId":banId},
                    dataType: "json",
                    success:function(data){
                    	if(!data>0) {
                    		alert("不存在"+banId+"号楼栋");
                    		return;
                    	}
                    }
				
				});
				
				$.ajax({
					url:'${pageContext.request.contextPath}/getBySelect',
                    type:'post',
                    data:{"banId":banId},
                    dataType: "json",
                    success:function(data){
                    	var operation = "<span class='glyphicon glyphicon-pencil'></span><a onclick=listToDialog("+banId+") data-toggle='modal' data-target='#myModal'> 修改</a>&nbsp;&nbsp;&nbsp;&nbsp;" 
                    				   +"<span class='glyphicon glyphicon-trash'></span><a onclick=delBan("+banId+")> 删除</a>";
                    					
                       if(data.banStaffId=="") var banStaffId = "未分配";
                       else var banStaffId = data.banStaffId;
                       
                    	var tr = "<tr id='tr'><td>"+ data.banId + "</td><td>"+ pbType(data.banType) +"</td><td>" + banStaffId + "</td>"+
                    			"<td>" + data.banRoomNum +"</td><td>"+ data.banDesc +"</td><td>"+operation+"</td></tr>";
                    	$("#infoTable").append(tr);
                    }
				});
				
			}
			else {
				alert("请输入要查询的楼栋号");
				return;
			}
		}
		
		function delBan(banId) {
			var flag = confirm("确认删除"+banId+"号楼栋吗?");
			if(flag) {
				$.ajax({
					url:'${pageContext.request.contextPath}/delBanById',
                    type:'post',
                    data: {"banId":banId},
                    dataType: "json",
                    success:function(data){
                    	if(data=="1") {
	                    		alert("删除"+banId+"号楼栋成功");
	                    		location.reload();
	                    }
                    }
	            });
			}
			
		}
		
		function getStaffName(staffId){
			$.ajax({
					url:'${pageContext.request.contextPath}/selectNameById',
                    type:'post',
                    data:{"staffId":staffId},
                    dataType:"json",
                    success:function(data){
                    	var name = data; 
                    	$("#banStaffId").val(staffId+"("+name+")");
                    }
	         });
		}
		
		function listToDialog(banId) {
			$.ajax({
				 url:'${pageContext.request.contextPath}/getBySelect',
                 type:'post',
                 data:{"banId":banId},
                 dataType: "json",
                 success:function(data){
                 	$("#banId").val(data.banId);
                 	$("#banType").val(data.banType);
                 	if(data.banStaffId!="") {
                 		getStaffName(data.banStaffId);
                 	}
                 	else $("#banStaffId").val("未分配");
                 	$("#banRoomNum").val(data.banRoomNum);
                 	$("#banDesc").val(data.banDesc);
                 }
	         });
		}
		
		function changeInfo() {
			var banId = $("#banId").val();
			var banType = $("#banType").val();
			var banStaffId = $("#banStaffId").val();
			if(banStaffId=="未分配") var staffId = "";
			else{
				var staffId = banStaffId.slice(0,5);
			}
			var banRoomNum = $("#banRoomNum").val();
			var banDesc = $("#banDesc").val();
			var ban={"banId":banId,"banType":banType,"banStaffId":staffId,"banRoomNum":banRoomNum,"banDesc":banDesc};
			$.ajax({
					url:'${pageContext.request.contextPath}/updateBan',
                    type:'post',
                    data: JSON.stringify(ban),
                    async:false,
                    contentType:"application/json;charset=UTF-8",
                    dataType: "json",
                    success:function(data){
                    	if(data=="1") alert("更新成功");
                    	location.reload();
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
               	<b>楼栋操作</b> <span class="divider"></span>	 
              </ul>
             <div class="title_right"><strong>楼栋信息</strong></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid" style="height:350px;">
             	<div class="row">
             		<div class="col-md-12">
					 	<div>
					 		<table align="center">
					 			<tr>
					 				<td><label for="selectId">输入楼栋号：</label></td>
					 				<td><input type="text" class="form-control input-sm" id="selectId"></td>
					 				<td> &nbsp;&nbsp;&nbsp;<button class="btn btn-success btn-sm" id="search">查找</button></td>
					 			</tr>
					 		</table>
					 	</div>
					 	<div style="margin-top:50px;">
					 		<table class="table table-bordered table-hover" id="infoTable">
					 			<tr id="ttitle" class="success">
					 				<th>楼栋号</th>
					 				<th>楼栋类型</th>
					 				<th>楼栋管理员</th>
					 				<th>楼栋房间数(间)</th>
					 				<th>描述</th>
					 				<th>操作</th>
					 			</tr>
					 		     <c:forEach items="${lists}" var="c">
					                <tr>
					                    <td>${c.banId}</td>
					                    <td>
						                    <c:choose> 
											   <c:when test="${c.banType=='1'}">男生宿舍</c:when> 
											   <c:otherwise>女生宿舍 </c:otherwise> 
											</c:choose> 
					                    </td>
					                    <td>
					                    	<c:choose> 
					                     		<c:when test="${c.banStaffId==''}">未分配</c:when>
					                     		<c:otherwise>${c.banStaffId}</c:otherwise> 
					                     	</c:choose> 
					                     </td>
					                    <td>${c.banRoomNum}</td>
					                    <td>${c.banDesc}</td>
					                    <td>
					                    	<span class='glyphicon glyphicon-pencil'></span><a onclick="listToDialog(${c.banId})" data-toggle='modal' data-target='#myModal'> 修改</a>&nbsp;&nbsp;&nbsp;&nbsp; 
                    						<span class='glyphicon glyphicon-trash'></span><a onclick="delBan(${c.banId})"> 删除</a>
                    					</td>
					                </tr>
            					</c:forEach>
            				</table>
					 	  </div>
					 	 
             	</div>	<!-- end col-md-12 -->
                </div> <!-- end row -->
       	     </div><!-- end content -->
       	     <div id="page" align="center">
			 		<nav aria-label="Page navigation" align="center">
						<ul class="pagination">
						     <!-- 首页 -->
			                <li><a href="${pageContext.request.contextPath}/sys_operationBan?pn=1">首页</a></li>
			                <!--上一页-->
			                <li>
			                    <c:if test="${pageinfo.hasPreviousPage}">
			                        <a href="${pageContext.request.contextPath}/sys_operationBan?pn=${pageinfo.pageNum-1}" aria-label="Previous">
			                           <span aria-hidden="true">«</span>
			                        </a>
			                    </c:if>
			                 </li>
			                <!--循环遍历连续显示的页面，若是当前页就显示，并且没有链接-->
			                <c:forEach items="${pageinfo.navigatepageNums}" var="page_num">
			                    <c:if test="${page_num == pageinfo.pageNum}">
			                         <li class="active"><a href="${pageContext.request.contextPath}/sys_operationBan?pn=${page_num}">${page_num}</a></li>
			                    </c:if>
			                    <c:if test="${page_num != pageinfo.pageNum}">
			                        <li><a href="${pageContext.request.contextPath}/sys_operationBan?pn=${page_num}">${page_num}</a></li>
			                    </c:if>
			                </c:forEach>
			
			                <!--下一页-->
			                <li>
			                    <c:if test="${pageinfo.hasNextPage}">
			                        <a href="${pageContext.request.contextPath}/sys_operationBan?pn=${pageinfo.pageNum+1}" aria-label="Next">
			                          <span aria-hidden="true">»</span>
			                        </a>
			                    </c:if>
			                </li>
			                <!-- 尾页 -->
			                <li><a href="${pageContext.request.contextPath}/sys_operationBan?pn=${pageinfo.pages}">尾页</a></li>
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
    		楼栋信息修改
    	</div>
      <div class="modal-body">
      	<form>
      	<table align="center" class="table table-bordered" width="100px">
      		<tr>
      			<td class="active">楼栋号:</td>
      			<td><input type="text" disabled class="form-control input-xs" id="banId"></td>
      		</tr>
      		<tr>
      			<td class="active">楼栋类型:</td>
      			<td>
      				<select class="form-control" id="banType">
      					<option value="1">男生宿舍</option>
      					<option value="2">女生宿舍</option>
      				</select>
      			</td>
      		</tr>
      		<tr>
      			<td class="active">楼栋管理员:</td>
      			<td><input type="text" class="form-control input-xs" disabled="disabled" id="banStaffId"></td>
      		</tr>
      		<tr>
      			<td class="active">楼栋房间数:</td>
      			<td><input type="text" class="form-control input-xs" id="banRoomNum" required></td>
      		</tr>
      		<tr>
      			<td class="active">楼栋描述:</td>
      			<td><textarea rows="5" cols="40" id="banDesc"></textarea></td>
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
