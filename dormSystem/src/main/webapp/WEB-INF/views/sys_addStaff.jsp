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
	<style>
		.btn{
			width:90px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			createStaffId();
			$("#addbtn").click(addStaff);
		});
		
		function createStaffId() {
			$.ajax({
				 url:'${pageContext.request.contextPath}/createStaffId',
                 type:'post',
                 dataType: "json",
                 success:function(data){
                 	$("#staffId").val(data);
                 }
			});
		}
		
		function addStaff() {
			var staffId = $("#staffId").val();
			var staffName = $("#staffName").val();
			var staffSex = $("#staffSex").val();
			var staffAge = $("#staffAge").val();
			var staffOrg = $("#staffOrg").val();
			var staffTel = $("#staffTel").val();
			var staff = {"staffId":staffId,"staffName":staffName,"staffSex":staffSex,"staffAge":staffAge,"staffOrg":staffOrg,"staffTel":staffTel};
			$.ajax({
					url:'${pageContext.request.contextPath}/addStaff',
                    type:'post',
                    data: JSON.stringify(staff),
                    contentType:"application/json;charset=UTF-8",
                    dataType: "json",
                    success:function(data){
                    	if(data=="1") alert("添加成功");
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
              <ul class="breadcrumb">当前位置：
                <span>系统管理员</span> <span class="divider">/</span>
               	<b>员工管理</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><b>员工添加</b></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="row-fluid">
             	<div class="col-md-2"></div>
             	<div class="col-md-8">
           			<table align="center" style="width:400px;height:300px">
           				<tr>
           					<td>员工号:</td>
           					<td><input type="text" class="form-control input-md" id="staffId" disabled></td>
           				</tr>
           				<form>
           				<tr>
           					<td>员工姓名:</td>
           					<td><input type="text" class="form-control input-md" id="staffName" required></td>
           				</tr>
           				<tr>
           					<td>员工性别:</td>
           					<td>
           						<select id="staffSex" class="form-control">
           							<option vlaue="男">男</option>
           							<option value="女">女</option>
           						</select>
           					</td>
           				</tr>
           				<tr>
           					<td>员工年龄:</td>
           					<td><input id="staffAge" type="text" class="form-control input-md" required></td>
           				</tr>
           				<tr>
           					<td>员工籍贯:</td>
           					<td><input type="text" class="form-control input-md" id="staffOrg" required></td>
           				</tr>
           				<tr>
           					<td>联系方式:</td>
           					<td><input type="text" class="form-control input-md" id="staffTel" required></td>
           				</tr>
           			</table><hr />
           			<div align="center" style="margin-top:30px">
           				<input id="addbtn" type="submit" class="btn btn-success" style="width:100px" value=" 添 加 ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           				<input class="btn btn-danger" type="reset" style="width:100px" value=" 重 置  ">
           			</div>
           			</form>
             	</div>
             	<div class="col-md-2"></div>
			 </div>
        </div>
    </div><!-- end right -->
</div><!-- end middle -->
<jsp:include page="/frame/footer.jsp"/>
</body>
</html>
