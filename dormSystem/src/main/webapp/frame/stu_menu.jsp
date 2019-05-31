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
      		<a href="${pageContext.request.contextPath}/stu_oneselfInfo">个人资料</a>
      		<a href="${pageContext.request.contextPath}/stu_changeInfo">修改资料</a>
      	</div>
      	<div class="collapsed">
      		<span>楼栋信息</span>
      		<a href="${pageContext.request.contextPath}/stu_banInfo">楼栋信息</a>
      		<a href="${pageContext.request.contextPath}/stu_dormSysInfo">楼管信息</a>
      	</div>
      	<div class="collapsed">	
      		<span>学生信息</span>
      		<a href="${pageContext.request.contextPath}/stu_roomMate">宿舍成员查询</a>
      		<a href="${pageContext.request.contextPath}/stu_stusInfo">学生信息查询</a>
      		<a href="${pageContext.request.contextPath}/stu_stuLateInfo">晚归信息查询</a>
      	</div>
      	<div class="collapsed">
      		<span>水电查询</span>
      		<a href="${pageContext.request.contextPath}/stu_allYearData">整年水电信息</a>
      		<a href="${pageContext.request.contextPath}/stu_monthData">当月水电信息</a>
      	</div>
      	<div class="collapsed">
      		<span>宿舍报修</span>
      		<a href="http://www.jxnu.edu.cn/s/2/t/690/p/1/c/3298/d/3604/list.htm" target="_blank">宿舍报修系统</a>
      	</div>
      </div><!-- end my_menu -->
</div><!-- end left -->
<div class="Switch"></div>
 <script type="text/javascript">
	$(document).ready(function(e) {
            $(".Switch").click(function(){$(".left").toggle();});
    });
</script>
