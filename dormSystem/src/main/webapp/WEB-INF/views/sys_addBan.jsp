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
		table{
			height:300px;
		}
		.btn{
			width:100px;
		}
		#smBtn{
			padding-left:150px;
			padding-top:5px
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#addBtn").click(addBan);
		});
		
		function addBan() {
			var banId = $("#banId").val();
			var banType = $("#banType").val();
			var banDesc = $("#banDesc").val();
			var banRoomNum = $("#banRoomNum").val();
			var data = {"banId":banId,"banType":banType,"banRoomNum":banRoomNum,"banDesc":banDesc};
			$.ajax({
				 type:"post",
				 url:"${pageContext.request.contextPath}/addBan",
        		 data:data,
      			 dataType:"json",
       			 success:function(data) {
       			 	if(data=='error') alert(banId + "号楼栋已存在");
       			 	else alert("添加成功");
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
               	<b>楼栋操作</b><span class="divider"></span>	 
              </ul>
             <div class="title_right"><strong>楼栋添加</strong></div>
             <div style="width:900px;margin:auto;"></div>
             <div id="content" class="container-fluid">
             	<div class="row">
             		<div class="col-md-3">
             		</div>
             		<div class="col-md-6">
					  <form>
					  <table align="center">
					 	 <tr>
					 	 	<td><lable for="banId">楼&nbsp;&nbsp;&nbsp;栋&nbsp;&nbsp;&nbsp;号:</lable></td>
					 	 	<td><input type="text" id="banId" class="form-control input-md" required></td>
					 	 </tr>
						  <tr>
					 	 	<td><lable for="banType">楼栋类型&nbsp;&nbsp;:</lable></td>
					 	 	<td>
					 	 		<select id="banType" class="form-control">
					 	 			<option value="1">男生宿舍</option>
					 	 			<option value="2">女生宿舍</option>
					 	 		</select>
					 	 	</td>
					 	 </tr>	
						 <tr>
					 	 	<td><lable for="banRoomNum">楼栋房间数:</lable></td>
					 	 	<td><input type="text" id="banRoomNum" class="form-control input-sm" required></td>
					 	 </tr>
					 	 <tr>
					 	 	<td><lable for="banDesc">&nbsp;&nbsp;描&nbsp;&nbsp;述&nbsp;:</lable></td>
					 	 	<td><textarea rows="8" cols="50" id="banDesc"></textarea></td>
					 	 </tr>
					 </table>
					 <hr/>
					 <div align="center">
						 <input type="submit" class="btn btn-success" id="addBtn" style="width:100px" value="添加">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 <input type="reset" value="重置" style="width:100px" class="btn btn-danger">
					 </div>
				     </form>
             		</div>
             		<div class="col-md-3">
             		</div>
             	</div>	
             </div> 
       	</div>
    </div><!-- end right -->
</div><!-- end middle -->
<jsp:include page="/frame/footer.jsp"/>
</body>
</html>
