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
      		<span>楼栋管理</span>
      		<a href="${pageContext.request.contextPath}/sys_addBan">楼栋添加</a>
      		<a href="${pageContext.request.contextPath}/sys_operationBan">楼栋信息</a>
      	</div>
      	<div class="collapsed">
      		<span>员工管理</span>
      		 <a href="${pageContext.request.contextPath}/sys_addStaff">员工添加</a>
      		 <a href="${pageContext.request.contextPath}/sys_operationStaff">员工信息</a>
      		 <a href="${pageContext.request.contextPath}/sys_fpBanSys">分配楼管</a>
      	</div>
      	<div class="collapsed">
      		<span>学生管理</span>
      		<a href="${pageContext.request.contextPath}/sys_addStu">学生添加</a>
      		<a href="${pageContext.request.contextPath}/sys_operationStu">学生信息</a>
      	</div>
      	
      </div><!-- end my_menu -->
</div><!-- end left -->
<div class="Switch"></div>
 <script type="text/javascript">
	$(document).ready(function(e) {
            $(".Switch").click(function(){$(".left").toggle();});
    });
</script>
