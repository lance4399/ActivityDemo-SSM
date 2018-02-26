<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
    <html lang="zh-cn">
  <head>
  <meta name="renderer" content="webkit" /> 
      <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!--告诉浏览器，使用的是非兼容模式 -->
    <meta name="viewport" content="width=device-width, initial-scale=1"><!--告诉浏览器我们以怎么样的方式在其他设备显示的时候，自适应设备的宽度，比例是1:1 -->
    <title>活动列表</title>

 <link href="${pageContext.request.contextPath}/bt/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/bt/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/hammer.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/jquery.hammer.js"></script>
  </head>

<script type="text/javascript">


function getActivitiesByKeyword(){
	document.ActivityForm.action="${pageContext.request.contextPath }/searchActivities.do";
	document.ActivityForm.submit();
}	


</script>


  <body >
    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" >
      <div class="container">
      <!-- 网站图标处 -->
        <div class="navbar-header">
       <!--  <a href="#"><img src="images/logo.jpg"></a> -->
      <a class="navbar-brand"><span class="glyphicon glyphicon-leaf"></span></a> 
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" >
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
        <li><a href="${pageContext.request.contextPath}/toIndex.do">网站主页</a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/getActivities.do">查看活动</a></li>  
            <li><a href="${pageContext.request.contextPath}/ifLoginForPostActivity.do">发布活动</a></li>       
            <li><a href="${pageContext.request.contextPath}/ifLoginForMyPage.do">会员中心</a></li>
            </ul>     
          <ul class="nav navbar-nav navbar-right">
            <c:if test="${ empty loginPerson}">
            <li ><a href="${pageContext.request.contextPath}/toLogin.do">登录</a></li>
            <li class="divider-vertical"></li>
            <li><a href="${pageContext.request.contextPath}/toRegist.do">注册</a></li>
            </c:if>
          	    <c:if test="${not empty loginPerson}">
        	 <li class="active"><a>欢迎您:${loginPerson.nickname}</a></li>
        	 <li><a href="${pageContext.request.contextPath}/toLogout.do">注销</a></li>
    			</c:if>
          </ul>
        </div>
      </div>
    </nav>
    <h1> <font color="yellow">  &nbsp;</font></h1>
<center>
 <h1>活动列表</h1>

<form name="ActivityForm"  method="post">
 	  <input type="text"  id="search" name="search" placeholder="键入关键字">
             <button  onclick="getActivitiesByKeyword()" >搜索</button>

	<table width="80%" border=1>
	<tr>
				<td>活动名字</td>
				<td>发布人</td>
				<td>开始时间</td>
				<td>持续时间</td>
				<td>地点</td>
				<td>活动人数</td>
				<td>描述</td>
				<td>图片</td>
				<td>更多操作</td>
				
	</tr>
	
		<c:forEach items="${activitylist}" var="activity">
			<tr>	
				<td>${activity.name}</td>
				<td>${activity.person.nickname}</td>
				<td>${activity.startTime}</td>
				<td>${activity.duringTime}</td>
				<td>${activity.location}</td>
				<td>${activity.needPeople}</td>
				<td>${activity.description}</td>
				<td>${activity.image}</td>
				<td><a href="${pageContext.request.contextPath}/toActivityDetails.do?aid=${activity.id}">即时约</a></td>
			</tr>
	</c:forEach>
	</table>
</form> 
    </center>   
<hr/>
        <div class="row footer-bottom">
          <ul class="list-inline text-center">
            <li>Copyright © 2017 Lance 保留所有权利</li>
          </ul>
        </div>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </body>
</html>
