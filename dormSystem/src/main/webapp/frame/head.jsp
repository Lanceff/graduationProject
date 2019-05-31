<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
String href = "";
if(session.getAttribute("identity").equals("1")) {
	href="sys_index";
}
else if(session.getAttribute("identity").equals("2")) {
	href="dormSys_index";
}
else if(session.getAttribute("identity").equals("3")) {
	href="stu_index";
}
%>
<div class="header">
	<div class="logo"><img  src="img/logo.png"/></div>
	<div class="header-right" style="font-size:10pt;color:#F5FFFA">
	 <i class="glyphicon glyphicon-home "></i>
	 <a href="${pageContext.request.contextPath}/<%=href%>">主页</a>
	 <%if(session.getAttribute("identity").equals("2") || session.getAttribute("identity").equals("3")){ %>
	 	 <i class="glyphicon glyphicon-user"></i>
		 <a data-toggle="modal" data-target="#changePwdModal">修改密码</a>
	 <%} %>
     <i class="glyphicon glyphicon-question-sign"></i>
     <a data-toggle="modal" data-target="#helpModal">帮助</a>
     <i class="glyphicon glyphicon-off"></i>
     <a data-toggle="modal" data-target="#quitModal">注销</a>
	</div><!-- end header-right -->
</div>

<!-- quitModal -->
<div class="modal fade" id="quitModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">注销系统</h4>
      </div>
      <div class="modal-body">
       	 确认退出系统吗?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="quitBtn">确定</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div><!-- end quitModal -->

<!-- changePassword modal -->
<div class="modal fade modal-md" id="changePwdModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">修改密码</h4>
      </div>
      
      <div class="modal-body">
       	<table style="width:400px;height:100px" align="center"> 
       		<tr>
       			<td>新 密 码：</td>
       			<td><input type="password" id="password" class="form-control input-xs" required="required"></td>
       		</tr>
       		<tr>
       			<td>确认密码：</td>
       			<td><input type="password" id="Rpassword" class="form-control input-xs" required="required"></td>
       		</tr>
       	</table>
      </div>
      <div class="modal-footer" align="center">
        <button type="button" class="btn btn-primary" id="changePwdBtn">确定</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div><!-- end changePassword modal -->

<!-- helpModal -->
<div class="modal fade" id="helpModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"><h4 class="modal-title">帮助提示</h4></div>
      <div class="modal-body">
      		<p>本系统是基于JAVA语言、SSM(Spring+SpringMVC+Mybatis)框架、前端jsp/html/CSS/Jquery和Bootstrap框架开发的一个校园宿舍管理系统。</p>
      		<dl>
      			<dt style="color:red">登录角色</dt>
      			<dd>1.超级管理员（系统管理员）</dd>
      			<dd>2.楼栋管理员（宿管）</dd>
      			<dd>3.学生</dd>
      		</dl>
      		<dl>
      			<dt>系统管理员</dt>
      			<dd>1.管理楼栋</dd>
      			<dd>2.管理宿舍管理员</dd>
      			<dd>3.管理学生</dd>
      			<dd>4.管理外来人员访问本宿舍</dd>
      			<dd>5.管理学生的就寝情况</dd>
      			
      			<dt>楼栋管理员</dt>
      			<dd>1.管理自身信息</dd>
      			<dd>3.管理学生</dd>
      			<dd>4.管理外来人员访问本宿舍</dd>
      			<dd>5.管理学生的就寝情况</dd>
      			
      			<dt>学生</dt>
      			<dd>1.管理自身信息</dd>
      			<dd>2.查询楼栋和宿舍相关信息</dd>
      			<dd>3.查询其他学生信息</dd>
      			<dd>4.查询宿舍水电量信息</dd>
      		</dl>
      		
      		<span>ps：本系统<span style="color:red">学生信息数据</span>和<span style="color:red">水电用量数据</span>需要通过数据库操作手动导入</span>,学生资料也可以通过系统单个添加。
      		<span style="color:red">宿舍报修</span>功能将直接跳到学校后勤报修界面。
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
      </div>
    </div>
  </div>
</div>
<!-- end helpModal -->
<script>
	$(function() {
		$("#quitBtn").click(quitSys);
		$("#changePwdBtn").click(changePassword);
	});
	
	function changePassword() {
		var password = $("#password").val();
		var Rpassword = $("#Rpassword").val();
		if(password=="" || Rpassword=="") {
			alert("请将内容填完整");
			return;
		}
		if(password!=Rpassword) {
			alert("两次输入的密码不一致");
			return;
		}
		var usercode = '<%=session.getAttribute("usercode")%>';
		var identity = '<%=session.getAttribute("identity")%>';
		var loginUser = {"usercode":usercode,"password":password,"identity":identity};
		$.ajax({
			type:"post",
			 url:"${pageContext.request.contextPath}/changePassword",
    		 dataType:"json",
    		 data:JSON.stringify(loginUser),
    		 contentType:"application/json;charset=UTF-8",
    		 success:function(data) {
    		 	if(data==1) {
    		 		alert("修改密码成功,请重新登录");
    		 		window.location.href="${pageContext.request.contextPath}/login.jsp";
    		 	}
    		 	
    		 },
    		 error:function() {
    		 	alert("error");
    		 	window.location.reload();
    		 }
    	 });
	}
	
	function quitSys() {
		window.location.href="${pageContext.request.contextPath}/quitSys";
	}
</script>
