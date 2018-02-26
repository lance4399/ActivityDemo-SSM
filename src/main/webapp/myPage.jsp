<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
    <html lang="zh-cn">
  <head>
  <meta name="renderer" content="webkit" /> 
      <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!--告诉浏览器，使用的是非兼容模式 -->
    <meta name="viewport" content="width=device-width, initial-scale=1"><!--告诉浏览器我们以怎么样的方式在其他设备显示的时候，自适应设备的宽度，比例是1:1 -->
    <title>发布活动</title>
 <link href="${pageContext.request.contextPath}/bt/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/bt/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/hammer.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/jquery.hammer.js"></script>
  </head>

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
        <li><a href="${pageContext.request.contextPath}/getActivities.do">查看活动</a></li>  
            <li><a href="${pageContext.request.contextPath}/ifLoginForPostActivity.do">发布活动</a></li>       
            <li class="active"><a href="${pageContext.request.contextPath}/ifLoginForMyPage.do">会员中心</a></li>   
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
<h2><font style="font-weight:bold;">我的信息</font> </h2><hr/>
 <h3> 大头贴：${loginPerson.pimage}  </h3><hr/>
 <h3> 昵称：${loginPerson.nickname}</h3><hr/>
	<h5> 我发起的活动 ：&nbsp;  &nbsp; &nbsp; &nbsp;  
	<c:if test="${not empty myPostedActivityNumber}">
	<a href="${pageContext.request.contextPath}/getMyPostedActivities.do">${myPostedActivityNumber}></a>
	</c:if>
		<c:if test="${ empty myPostedActivityNumber}">
		0>
	</c:if>
	</h5>
	
	<hr/>
	
	<h5> 我参与的活动： &nbsp;  &nbsp; &nbsp; &nbsp;  
	<c:if test="${not empty myJoinedActivityNumber}">
	<a href="${pageContext.request.contextPath}/getMyJoinedActivities.do">${myJoinedActivityNumber}></a>
	</c:if>
	<c:if test="${ empty myJoinedActivityNumber}">
		0>
	</c:if>
	</h5><hr/>
	
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
