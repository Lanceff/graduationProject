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
	.tabTr th,td{
		text-align:center;
	}
	</style>
	<script type="text/javascript">
		$(function() {
			$("#search").click(addStuLate);
		});
		
		function addStuLate() {
		   $(".tabTr").remove();
		    var bslStuId = $("#bslStuId").val();
		    if(bslStuId=="") {
		    	alert("请输入学生学号");
		    	return;
		    }
			var  banId ='<%=session.getAttribute("banId")%>';
			$.ajax({
			 	 type:"post",
				 url:"${pageContext.request.contextPath}/selectStuByIdAndBan",
      			 dataType:"json",
      			 data:{"stuBanId":banId,"stuId":bslStuId},
       			 success:function(data) {
       			 	var tr = "<tr class='success tabTr'><th>学号</th><th>姓名</th><th>性别</th><th>学院</th>"+
       			    			"<th>专业</th><th>寝室号</th><th>操作</th></tr>";
       			    tr += "<tr class='tabTr'><td>" + data.stuId+"</td><td>"+data.stuName+"</td><td>" +data.stuSex+"</td><td>"
                    	 			 + data.stuXy + "</td><td>" + data.stuMajor + "</td><td>" 
                    	 			 + data.stuDormId + "</td><td>"
                    	 			 + "<button class='btn btn-info btn-sm' onclick='addLate(" + data.stuId +")'>晚归</button></td></tr>";
                    	 			 
                    $("#tableInfo").append(tr); 		
       			 },
       			 error:function() {
       			 	alert("未找到对应学生");
       			 	return;
       			 }
			});
		}
		
		function addLate(stuId) {
		  var  banId = '<%=session.getAttribute("banId")%>';
			  $.ajax({
			     type:"post",
				 url:"${pageContext.request.contextPath}/selectCountStuLate",
      			 dataType:"json",
      			 data:{"stuId":stuId},
       			 success:function(data) {
       			 	if(data>0) {
       			 		alert("该学生今日已经被记录晚归！请勿重复操作!");
       			 		window.location.reload();
       			 	}
       			 	else{
       			 		$.ajax({
					 	 type:"post",
						 url:"${pageContext.request.contextPath}/insertStuLate",
		      			 dataType:"json",
		      			 data:{"banId":banId,"bslStuId":stuId},
		       			 success:function(data) {
		       			 	if(data==1) alert("记录成功");
		       			 	window.location.reload();
		       			 }
			            });	
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
             <div class="title_right"><b>学生晚归信息登记</b></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid">
             	<div class="col-md-12">
             	 	<div>
				 		<table align="center">
				 			<tr>
				 				<td><label for="bslStuId">输入晚归学生学号：</label></td>
				 				<td><input type="text" class="form-control input-sm" id="bslStuId"></td>
				 				<td> &nbsp;&nbsp;&nbsp;<button class="btn btn-success btn-sm" id="search">查找</button></td>
				 			</tr>
				 		</table>
				 		<div id="tabdiv">
				 			<table class="table table-bordered" id="tableInfo" style="margin-top:60px;text-align:center">
				 			</table>
				 		</div>
				 	</div>
             	</div>
			 </div>
        </div>
    </div><!-- end right -->
</div><!-- end middle -->
<jsp:include page="/frame/footer.jsp"/>
</body>
</html>
