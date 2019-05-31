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
			$("#addStuBtn").click(addStu);
		});
		function addStu() {
			var stuId = $("#stuId").val();
			var stuName = $("#stuName").val();
			var stuSex = $("#stuSex").val();
			var stuOrg = $("#stuOrg").val();
			var stuXy = $("#stuXy").val();
			var stuMajor = $("#stuMajor").val();
			var stuNz = $("#stuNz").val();
			var stuGride = $("#stuGride").val();
			var stuTel = $("#stuTel").val();
			var stuBanId = $("#stuBanId").text();
			var stuDormId = $("#stuDormId").val();
			var stuInState = $("#stuInState").val();
			
		    if(stuId==""|| stuName=="" || stuOrg=="" || stuXy=="" || stuMajor=="" ||stuTel=="" || stuDormId=="") {
				alert("信息未输入完整");
				return;
			}
			
			$.ajax({
				 type:"post",
				 url:"${pageContext.request.contextPath}/selectIsExitStuById",
      			 dataType:"json",
      			 async:false,
      			 data:{"stuId":stuId},
       			 success:function(data) {
       			 	if(data>0) {
	       			 	alert(stuId + "号学生已存在");
	       			 	window.location.reload();
       			 	}
       			 }
       	    });
			
			var stu = {"stuId":stuId,"stuName":stuName,"stuSex":stuSex,
						"stuOrg":stuOrg,"stuXy":stuXy,"stuMajor":stuMajor,
						"stuNz":stuNz,"stuGride":stuGride,"stuTel":stuTel,
						"stuBanId":stuBanId,"stuDormId":stuDormId,"stuInState":stuInState};
						
			  $.ajax({
				 type:"post",
				 url:"${pageContext.request.contextPath}/insertOneStu",
        		 data:JSON.stringify(stu),
      			 dataType:"json",
      			 contentType:"application/json",
       			 success:function(data) {
       			 	if(data==1) alert("添加成功");
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
               	<b>学生管理</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><b>添加学生</b></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid">
             	<div class="col-md-12">
             		 <form>
             			 <table class="table table-bordered"  align="center" style="width:950px;height:190px;margin-top:50px">
             			 	<tr>
             			 	 	<td class="active">学号</td>
             			 	 	<td><input type="text" id="stuId" class="form-control input-xs" required></td>
             			 	 	<td class="active">姓名</td>
             			 	 	<td><input type="text" id="stuName" class="form-control input-xs" required></td>
             			 	 	<td class="active">性别</td>
             			 	 	<td>
             			 	 		<select id="stuSex" class="form-control">
             			 	 			<option value="男">男</option>
             			 	 			<option value="女">女</option>
             			 	 		</select>
             			 	 	</td>
             			 	</tr>
             			 	<tr>
             			 	 	<td class="active">籍贯</td>
             			 	 	<td><input type="text" id="stuOrg" class="form-control input-xs" required></td>
             			 	 	<td class="active">学院</td>
             			 	 	<td><input type="text" id="stuXy" class="form-control input-xs" required></td>
             			 	 	<td class="active">专业</td>
             			 	 	<td><input type="text" id="stuMajor" class="form-control input-xs" required></td>
             			 	</tr>
             			 	<tr>
             			 	 	<td class="active">学年制</td>
             			 	 	<td>	
             			 	 		<select id="stuNz" class="form-control">
             			 	 			<option value="2">2年制</option>
             			 	 			<option value="3">3年制</option>
             			 	 			<option value="4" selected>4年制</option>
             			 	 			<option value="5">5年制</option>
             			 	 		</select>
             			 	 	</td>
             			 	 	<td class="active">年级</td>
             			 	 	<td><select id="stuGride" class="form-control">
             			 	 			<option value="2014" selected>2014级</option>
             			 	 			<option value="2015">2015级</option>
             			 	 			<option value="2016">2016级</option>
             			 	 			<option value="2017">2017级</option>
             			 	 			<option value="2018">2018级</option>
             			 	 			<option value="2019">2019级</option>
             			 	 			<option value="2020">2020级</option>
             			 	 		</select>
             			 	 	</td>
             			 	 	<td class="active">联系方式</td>
             			 	 	<td><input type="text" id="stuTel" class="form-control input-xs" required></td>
             			 	</tr>
             			 	<tr>
             			 		<td class="active">住宿楼栋</td>
             			 		<td style="text-align:center">
             			 			<span id="stuBanId">${banId}</span>栋
             			 		</td>
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
             			 <div align="center" style="margin-top:50px">
							 <input type="submit" class="btn btn-success" style="width:100px" id="addStuBtn" value="添加">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <input type="reset" value="重置"  style="width:100px"class="btn btn-danger">
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
