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
	<script type="text/javascript">
		$(function() {
			$("#addBanVisitBtn").click(addBanVisit);
		});
		
		function addBanVisit() {
			var  banId = '<%=session.getAttribute("banId")%>';
			var bvName = $("#bvName").val();
			var bvSex = $("#bvSex").val();
			var bvCredType = $("#bvCredType").val();
			var bvCredCode = $("#bvCredCode").val();
			var bvDesc = $("#bvDesc").val();
			if(bvName==""||bvCredCode=="") {
				alert("信息未填完");
				return;
			}
			var data = {"banId":banId,"bvName":bvName,"bvSex":bvSex,"bvCredType":bvCredType,"bvCredCode":bvCredCode,"bvDesc":bvDesc};
			$.ajax({
			 	 type:"post",
				 url:"${pageContext.request.contextPath}/insert",
      			 dataType:"json",
      			 data:data,
       			 success:function(data) {
       			 	if(data==1) {
       			 		alert("记录成功");
       			 	}
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
               	<b>来访管理</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><b>来访登记</b></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid">
             	<div class="col-md-12">
             	<form>
             		<table style="width:380px;height:300px" align="center">
             			<tr>
             				<td>来访者姓名</td>
             				<td><input type="text" class="form-control input-xs" id="bvName" required></td>
             				
             			</tr>
             			<tr>
             				<td>来访者性别</td>
             				<td>
             					<select class="form-control" id="bvSex"> 
             						<option value="男">男</option>
             						<option vallue="女">女</option>
             					</select>
							</td>
             			</tr>
             			<tr>
             				<td>出示证件类型</td>
             				<td>
             					<select class="form-control" id="bvCredType">
             						<option value="身份证">身份证</option>
             						<option vallue="学生证">学生证</option>
             						<option vallue="其他">其他</option>
             					</select>
							</td>
             			</tr>
             			<tr>
             				<td>证件号码</td>
							<td><input type="text" class="form-control input-xs" id="bvCredCode" required></td>
             			</tr>
             			<tr>
             				<td>备注</td>
							<td><input type="text" class="form-control input-xs" id="bvDesc"></td>
             			</tr>
             		</table>
             		<div align="center" style="margin-top:50px">
							 <input type="submit" class="btn btn-success" style="width:100px" id="addBanVisitBtn" value=" 添加 ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
