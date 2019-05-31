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
		$(function(){
			$("#changeBtn").click(changeInfo)
		});
		
		function changeInfo() {
			var staffId = $("#staffId").text();
			var staffName = $("#staffName").val();
			var staffSex = $("#staffSex").val();
			var staffAge = $("#staffAge").val();
			var staffOrg = $("#staffOrg").val();
			var staffTel = $("#staffTel").val();
			
			if(staffName=="" || staffAge=="" || staffOrg=="" || staffTel=="" ) {
				alert("请将信息填写完整");
				return;
			}
			
			var staff = {"staffId":staffId,"staffName":staffName,
						"staffSex":staffSex,"staffAge":staffAge,
						"staffOrg":staffOrg,"staffTel":staffTel};
						
			$.ajax({
					url:'${pageContext.request.contextPath}/updateStaff',
                    type:'post',
                    data: JSON.stringify(staff),
                    contentType:"application/json;charset=UTF-8",
                    dataType: "json",
                    success:function(data){
                    	if(data=="1") {
                    	    alert("修改成功");
                    	}
                    	window.location.reload();
                    }
	            }); 
		}
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
               	<b>信息管理</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><b>修改个人信息</b></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid">
             	<div class="col-md-12" align="center" style="margin-top:30px">
             			<form>
						<table class="table table-bordered" style="width:350px;height:300px;text-align:center">
							<tr>
								<td class="active">工号</td>
						    	<td id="staffId">${staffInfo.staffId}</td>
							</tr>
							<tr>
								<td class="active">姓名</td>
								<td><input type="text" id="staffName" class="form-control input-xs" value="${staffInfo.staffName}"></td>
							</tr>
							<tr>
								<td class="active">性别</td>
								<td>
									<select id="staffSex" class="form-control">
										<c:choose> 
										     <c:when test="${staffInfo.staffSex=='男'}">
										      	<option value="男" selected>男</option>
												<option value="女">女</option>
											 </c:when>      
										     <c:otherwise>
										     	<option value="男">男</option>
											    <option value="女" selected>女</option>
										 	 </c:otherwise> 
										</c:choose>
									</select>
								</td>
							</tr>
							<tr>
								<td class="active">年龄</td>
								<td><input type="text" id="staffAge" class="form-control input-xs" value="${staffInfo.staffAge}"></td>
							</tr>
							<tr>
								<td class="active">籍贯</td>
								<td><input type="text" id="staffOrg" class="form-control input-xs" value="${staffInfo.staffOrg}"></td>
							</tr>
							<tr>
								<td class="active">联系电话</td>
								<td><input type="text" id="staffTel" class="form-control input-xs" value="${staffInfo.staffTel}"></td>
							</tr>
						</table>
						<div style="margin-top:50px">
						 <input type="submit" class="btn btn-success" style="width:100px" id="changeBtn" value=" 修改 ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 <input type="reset" value=" 重置 " style="width:100px" class="btn btn-danger">
					    </div>
					    </form>
             	</div>
			 </div>
        </div>
    </div><!-- end right -->
</div><!-- end middle -->
<jsp:include page="/frame/footer.jsp"/>
</body>
</html>
