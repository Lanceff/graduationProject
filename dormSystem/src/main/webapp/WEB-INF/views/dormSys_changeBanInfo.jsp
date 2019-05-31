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
			var banId = $("#banId").text();
			var banRoomNum = $("#banRoomNum").val();
			var banType = $("#banType").val();
			var banStaffId = '<%=session.getAttribute("usercode")%>';
			var banDesc = $("#banDesc").val();
			
			if(banRoomNum =="" ) {
				alert("请将信息填写完整");
				return;
			}
		
			var ban =  {"banId":banId,
					    "banType":banType,
						"banStaffId":banStaffId,
						"banRoomNum":banRoomNum,
						"banDesc":banDesc};
			$.ajax({
					url:'${pageContext.request.contextPath}/updateBan',
                    type:'post',
                    data:JSON.stringify(ban),
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
               	<b>楼栋信息</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><b>修改楼栋信息</b></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid">
             	<div class="col-md-12" align="center" style="margin-top:30px">
             			<form>
						<table class="table table-bordered" style="width:400px;height:300px;text-align:center">
							<tr>
					 	 	<td><lable for="banId">楼&nbsp;&nbsp;&nbsp;栋&nbsp;&nbsp;&nbsp;号:</lable></td>
					 	 	<td id="banId">${baninfo.banId}</td>
					 	 </tr>
						  <tr>
					 	 	<td><lable for="banType">楼栋类型&nbsp;&nbsp;:</lable></td>
					 	 	<td>
					 	 		<select id="banType" class="form-control">
					 	 			<c:choose> 
									   <c:when test="${baninfo.banType=='1'}">
									     <option selected value="1">男生宿舍 </option>
									  	 <option value="2">女生宿舍 </option>
									   </c:when> 
									   <c:otherwise>
									   	 <option value="1">男生宿舍 </option>
									  	 <option selected value="2">女生宿舍 </option>
									   </c:otherwise> 
									</c:choose> 
					 	 		</select>
					 	 	</td>
					 	 </tr>	
						 <tr>
					 	 	<td><lable for="banRoomNum">楼栋房间数:</lable></td>
					 	 	<td><input type="text" id="banRoomNum" class="form-control input-sm" value="${baninfo.banRoomNum}" required></td>
					 	 </tr>
					 	 <tr>
					 	 	<td><lable for="banDesc">&nbsp;&nbsp;描&nbsp;&nbsp;述&nbsp;:</lable></td>
					 	 	<td><textarea rows="8" cols="30" id="banDesc">${baninfo.banDesc}</textarea></td>
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
