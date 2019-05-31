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
	<style type="text/css">
		.btn{
			width:100px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#search").click(searchBan);
			$("#yesBtn").click(fpDormSys);
		});
		
		function getStaffName(staffId) {
			$.ajax({
					url:'${pageContext.request.contextPath}/selectNameById',
                    type:'post',
                    data:{"staffId":staffId},
                    dataType:"json",
                    success:function(data){
                    	$("#staffName").text(data);
                    },
                    error:function() {
                    	alert("该工号不存在");
                    }
		         });
		}
		
		function getName() {
			var staffId = $("#staffId").val();
			getStaffName(staffId);
		}
		
		function searchBan() {
			clearTab();
			var banId = $("#selectId").val();
			if(banId=="") {
				alert("请输入楼栋Id号");
				return;
			}
			$.ajax({
				 url:'${pageContext.request.contextPath}/getBySelect',
                 type:'post',
                 data:{"banId":banId},
                 dataType: "json",
                 success:function(data) {
						$("#banId").text(banId); 
						if(data.banType=="1") $("#banType").text("男生宿舍"); 
						else $("#banType").text("女生宿舍"); 
						if(data.banStaffId!="") {
							$("#staffId").val(data.banStaffId);
							//$("#staffId").addClass("disabled");
							$("#staffId").attr("disabled","disabled");
							$("#staffId").attr("flag","0");
							//alert("te:flag="+$("#staffId").attr("flag"));
							getStaffName(data.banStaffId);
						}
						$("#form").show();               
                 },
                 error:function() {
                 	alert("未找到该楼栋信息");
                 	window.location.reload();
                 }
			});
			
		}
		
		function clearTab() {
		  $("#banId").text("");
		  $("#banType").text(""); 
		  $("#staffId").val("");
		  $("#staffName").text("");
		  $("#staffId").removeAttr("disabled");
		  $("#staffId").attr("flag","1");
		  //alert("clear:flag="+$("#staffId").attr("flag"));
		}
		
		function fpDormSys() {
			var flag = $("#staffId").attr("flag");
			var banId = $("#banId").text();
			if(flag=="0") {
				alert(banId+"号楼栋已经有管理员了");
				return;
			}
		   else {
				var staffId = $("#staffId").val();
			     $.ajax({
					 url:'${pageContext.request.contextPath}/selectOneById',
	                 type:'post',
	                 data:{"staffId":staffId},
	                 dataType: "json",
	                 async:false,
	                 success:function(data){
	                 	updateBanStaff(banId,data.staffId);
	                 }
				 }); 
			}
		}
		
		function updateBanStaff(banId,banStaffId) {
		 		$.ajax({
		 			 url:'${pageContext.request.contextPath}/updateBanStaffInfo',
	                 type:'post',
	                 data:{"banId":banId,"banStaffId":banStaffId},
	                 dataType: "json",
	                 success:function(data){
	                 	if(data==2) alert("该员工已经分配职务");
	                 	else if(data==1) alert("分配成功");
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
               	<b>员工操作</b> <span class="divider"></span>	 
              </ul>
             <div class="title_right"><strong>分配楼管</strong></div>
             <div style="width:900px;margin:auto;"></div>   
             <div style="height:410px">
             	<div>
			 		<table align="center">
			 			<tr>
			 				<td><label for="selectId">输入楼栋号：</label></td>
			 				<td><input type="text" class="form-control input-sm" id="selectId"></td>
			 				<td> &nbsp;&nbsp;&nbsp;<button class="btn btn-success btn-sm" id="search">查找</button></td>
			 			</tr>
			 		</table>
				</div>
				<div id="form" style="display:none">
				<form>
					<h4 align="center" style="margin-top:40px">分配楼栋管理员</h4>
					<table class="table table-bordered" align="center" style="text-align:center;width:380px;height:200px;margin-top:30px">
						<tr>
							<td>楼栋号:</td>
							<td><span id="banId"></span></td>
						</tr>
						<tr>
							<td>楼栋类型:</td>
							<td><span id="banType"></span></td>
						</tr>
						<tr>
							<td>楼管工号:</td>
							<td><input type="text" class="form-control input-xs" id="staffId" flag="1" required onblur="getName()"></td>
						</tr>
						<tr>
							<td>楼管姓名:</td>
							<td><span id="staffName"></span></td>
						</tr>
					</table><hr />
					<div align="center">
						<input type="submit" class="btn btn-primary" value=" 确认分配 " id="yesBtn">&nbsp;&nbsp;&nbsp;&nbsp;
       				    <input type="reset" class="btn btn-danger" value=" 取 消 ">
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
