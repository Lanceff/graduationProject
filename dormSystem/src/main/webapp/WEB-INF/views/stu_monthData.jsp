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
		#tabInfo th,td{
			text-align:center;
		}
	</style>
	<script type="text/javascript">
		$(function() {
			$("#search").click(selectMonthByDorm);
		});

		function selectMonthByDorm() {
			var month = $("#month").val();
			if(month == 0) {
				alert("请选择月份");
				return;
			}
			$.ajax({
				url:'${pageContext.request.contextPath}/selectMonthByDorm',
                    type:'post',
                    data:{"month":month},
                    dataType:"json",
				    success:function(data) {
				    	$(".tr").remove();
				    	var tr = "<tr class='success tr'><th>楼栋号</th><th>宿舍号</th><th>月份</th>"+
					 			  "<th>用电量</th><th>电费单价</th><th>用水量</th><th>水费单价</th><th>总电费(元)</th><th>总水费(元)</th>"+
					 			"</tr>";
                    	tr += "<tr class='tr'><td>"+data.banId+"栋</td><td>"+data.dormId+"</td><td>" + data.month +"月</td><td>"
                    	 			+ data.elecNum +"度</td><td>"+data.elecPrice+"元/度</td><td>"+data.waterNum +"吨</td><td>"
                    	 			+ data.waterPrice + "元/吨</td><td>" + data.elecCost + "</td><td>"+ data.waterCost +"</td>"
                    	 			+"</tr>";
                    	 $("#tabInfo").append(tr);
				    },
				    error:function() {
				    	alert("未找到对应信息");
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
              <ul class="breadcrumb">
              	当前位置：
                <span>学生</span> <span class="divider">/</span>
               	<b>水电查询</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><strong>月份水电查询</strong></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid" style="height:350px;">
             	<div class="row">
             		 <div class="col-md-12">
					 	<div>
					 		<table align="center">
					 			<tr>
					 				<td><label for="selectId">请选择月份：</label></td>
					 				<td>
						 				<select id="month" class="form-control">
						 					<option value="0">== 请 选 择 ==</option>
						 					<option value="1"> &nbsp;1 月&nbsp; </option>
						 					<option value="2"> &nbsp;2 月&nbsp; </option>
						 					<option value="3"> &nbsp;3 月&nbsp; </option>
						 					<option value="4"> &nbsp;4 月&nbsp; </option>
						 					<option value="5"> &nbsp;5 月&nbsp; </option>
						 					<option value="6"> &nbsp;6 月&nbsp; </option>
						 					<option value="7"> &nbsp;7 月&nbsp; </option>
						 					<option value="8"> &nbsp;8 月&nbsp; </option>
						 					<option value="9"> &nbsp;9 月&nbsp; </option>
						 					<option value="10"> &nbsp;10 月&nbsp; </option>
						 					<option value="11"> &nbsp;11 月&nbsp; </option>
						 					<option value="12"> &nbsp;12 月&nbsp; </option>
						 				</select>
					 				</td>
					 				<td> &nbsp;&nbsp;&nbsp;<button class="btn btn-success btn-sm" id="search">查找</button></td>
					 			</tr>
					 		</table>
					 	</div>
					 	<div id="stuInfo" style="margin-top:30px;" >
					 		<table class="table table-bordered table-hover" id="tabInfo" style="width:1000px" align="center">
					 		</table>
					 	</div>
                	</div><!-- end col-md-12 -->
                </div> <!-- end row -->
       	     </div><!-- end content -->
       </div><!-- end right_cont -->
    </div><!-- end right -->
</div><!-- end middle -->
<jsp:include page="/frame/footer.jsp"/>
</body>
</html>
