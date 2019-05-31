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
			$("#changeBtn").click(changeInfo);
		});
		
		
		function changeInfo() {
			var stuId = ${stuInfo.stuId};
			var stuName = $("#stuName").val();
			var stuSex = $("#stuSex").val();
			var stuOrg = $("#stuOrg").val();
			var stuXy = $("#stuXy").val();
			var stuMajor = $("#stuMajor").val();
			var stuNz = $("#stuNz").val();
			var stuGride = ${stuInfo.stuGride};
			var stuTel = $("#stuTel").val();
			var stuBanId = '${stuInfo.stuBanId}';
			var stuDormId = '${stuInfo.stuDormId}';
			var stuInState = $("#stuInState").val();
			
			if(stuName=="" || stuOrg=="" || stuXy==""|| stuMajor=="" ||stuTel=="") {
				alert("请将信息填写完整");
				return;
			}
			
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
	<jsp:include page="/frame/stu_menu.jsp"/>
    <div class="right"  id="mainFrame">
         <div class="right_cont">
              <ul class="breadcrumb">当前位置：
                <span>学生</span> <span class="divider">/</span>
               	<b>信息管理</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><b>修改个人信息</b></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid">
             	<div class="col-md-12" align="center" style="margin-top:30px">
             			<form>
						<table align="center" class="table table-bordered" style="text-align:center;width:800px">
				      		<tr>
				      			<td class="active">学号</td>
				      			<td id="stuId">${stuInfo.stuId}</td>
				      			<td class="active">姓名</td>
				      			<td><input type="text" class="form-control input-xs" id="stuName"  value="${stuInfo.stuName}" required></td>
				      		</tr>
				      		<tr>
				      			<td class="active">性别</td>
				      			<td>
				      				<select class="form-control" id="stuSex"> 
				      					<c:choose> 
										     <c:when test="${stuInfo.stuSex =='男'}">
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
				      			<td class="active">籍贯</td>
				      			<td><input type="text" class="form-control input-xs" id="stuOrg" value="${stuInfo.stuOrg}" required></td>
				      		</tr>
				      		<tr>
				      			<td class="active">年制</td>
				      			<td>
				      				<select id="stuNz" class="form-control">
				      					<c:choose> 
										     <c:when test="${stuInfo.stuNz =='2'}">
										      	<option value="2" selected>2年制</option>
						  			 	 		<option value="3">3年制</option>
						  			 	 		<option value="4">4年制</option>
						  			 	 		<option value="5">5年制</option>
											 </c:when>
											 <c:when test="${stuInfo.stuNz =='3'}">
										      	<option value="2">2年制</option>
						  			 	 		<option value="3" selected>3年制</option>
						  			 	 		<option value="4">4年制</option>
						  			 	 		<option value="5">5年制</option>
											 </c:when>   
											  <c:when test="${stuInfo.stuNz =='4'}">
										      	<option value="2">2年制</option>
						  			 	 		<option value="3">3年制</option>
						  			 	 		<option value="4" selected>4年制</option>
						  			 	 		<option value="5">5年制</option>
											 </c:when>           
										     <c:otherwise>
										     	<option value="2">2年制</option>
						  			 	 		<option value="3">3年制</option>
						  			 	 		<option value="4">4年制</option>
						  			 	 		<option value="5" selected>5年制</option>
										 	 </c:otherwise> 
										</c:choose>
				  			 	 		<option value="2">2年制</option>
				  			 	 		<option value="3">3年制</option>
				  			 	 		<option value="4">4年制</option>
				  			 	 		<option value="5">5年制</option>
				             	   </select>
				      			</td>
				      			<td class="active">年级</td>
				    			<td>${stuInfo.stuGride}级</td>
				      		</tr>
				      		<tr>
				      			<td class="active">学院</td>
				        		<td><input type="text" id="stuXy" class="form-control input-xs" value="${stuInfo.stuXy}" required></td>
				        		<td class="active">专业</td>
				        		<td><input type="text" id="stuMajor" class="form-control input-xs" value="${stuInfo.stuMajor}" required></td>
				      		</tr>
				      		<tr>
				      			<td class="active" >联系方式:</td>
				      			<td><input type="text" class="form-control input-xs" id="stuTel" value="${stuInfo.stuTel}" required></td>
				      			<td class="active">住宿楼栋</td>
				         		<td>${stuInfo.stuBanId}栋</td>
				      		</tr>
				      		<tr>	
				      			<td class="active">宿舍</td>
				           		<td>${stuInfo.stuDormId}</td>
						 		<td class="active">入住状态</td>
						 		<td>	
						 			<select id="stuInState" class="form-control">
						 				<c:choose> 
										     <c:when test="${stuInfo.stuInState =='已入住'}">
										      	<option vlaue="已入住" selected>已入住</option>
						 				 		<option vlaue="未入住">未入住</option>
											 </c:when>      
										     <c:otherwise>
										     	 <option vlaue="已入住">已入住</option>
						 						 <option vlaue="未入住" selected>未入住</option>
										 	 </c:otherwise> 
										 </c:choose>
						 			</select>
						 		</td>
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
