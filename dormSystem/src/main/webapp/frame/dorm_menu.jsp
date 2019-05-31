<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="left">
<script type="text/javascript">
    var myMenu;
    window.onload = function() {
    	myMenu = new SDMenu("my_menu");
    	myMenu.init();
     };
</script>
      <div id="my_menu" class="sdmenu">
      	<div>
      		<span>个人信息管理</span>
      		<a href="${pageContext.request.contextPath}/dormSys_oneselfInfo">个人资料</a>
      		<a href="${pageContext.request.contextPath}/dormSys_changeInfo">修改资料</a>
      	</div>
      	<div class="collapsed">
      		<span>楼栋信息</span>
      		 <a href="${pageContext.request.contextPath}/dormSys_banInfo">楼栋信息查看</a>
      		 <a href="${pageContext.request.contextPath}/dormSys_changeBanInfo">楼栋信息修改</a>
      	</div>
      	<div class="collapsed">
      		<span>学生管理</span>
      		 <a href="${pageContext.request.contextPath}/dormSys_addStu">学生添加</a>
      		 <a href="${pageContext.request.contextPath}/dormSys_stuInfo">学生信息</a>
      	</div>
      	<div class="collapsed">
      		<span>来访管理</span>
      		 <a href="${pageContext.request.contextPath}/dormSys_addVisit">来访人员登记</a>
      		 <a href="${pageContext.request.contextPath}/dormSys_leaveVisit">来访离开登记</a>
      		 <a href="${pageContext.request.contextPath}/dormSys_visitInfo">来访记录查询</a>
      	</div>
      	<div class="collapsed">
      		<span>学生晚归管理</span>
      		 <a href="${pageContext.request.contextPath}/dormSys_addStuLate">学生晚归登记</a>
      		 <a href="${pageContext.request.contextPath}/dormSys_stuLateInfo">晚归记录查询</a>
      	</div>
      </div><!-- end my_menu -->
</div><!-- end left -->
<div class="Switch"></div>
 <script type="text/javascript">
	$(document).ready(function(e) {
            $(".Switch").click(function(){$(".left").toggle();});
    });
</script>
