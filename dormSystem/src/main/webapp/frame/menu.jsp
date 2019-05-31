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
      		<span>业务处理</span>
      		<a href="查询页面.html">电脑开票</a>
      		<a href="分理处发货排行榜.html">票据补录</a>
      	</div>
      	<div class="collapsed">
      		<span>统计</span>
      		<a href="#">统计</a>
      		<a href="#">统计</a>
      	</div>
      	<div class="collapsed">
      		<span>资金结算</span>
      		 <a href="#">提货登记</a>
      		 <a href="#">收款核销</a>
      		 <a href="#">现金转账</a>
      		 <a href="#">现付结算</a>
      	</div>
       	<div class="collapsed">
      		<span>票据查询</span>
      		<a href="#">票据查询</a>
      		<a href="#">跟踪查询</a>
      		<a href="#">车次查询</a>
      	</div>
      </div><!-- end my_menu -->
</div><!-- end left -->
<div class="Switch"></div>
 <script type="text/javascript">
	$(document).ready(function(e) {
            $(".Switch").click(function(){$(".left").toggle();});
    });
</script>
