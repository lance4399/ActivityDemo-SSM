<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    
 <!DOCTYPE html>
    <html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!--告诉浏览器，使用的是非兼容模式 -->
    <meta name="viewport" content="width=device-width, initial-scale=1"><!--告诉浏览器我们以怎么样的方式在其他设备显示的时候，自适应设备的宽度，比例是1:1 -->
	<title>注册成功</title>

 <link href="${pageContext.request.contextPath}/bt/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/bt/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/hammer.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/jquery.hammer.js"></script>
    <script type="text/javascript">
   
    
	</script>
  </head>

  <body role="document">

    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand"><!--图标--><span class="glyphicon glyphicon-leaf"></span></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
             <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/toIndex.do">网站主页</a></li>
        	<li><a href="${pageContext.request.contextPath}/getActivities.do">查看活动</a></li>  
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

<!--表单-->
	<h1> <font color="yellow">  &nbsp;</font></h1>
<h1><center> <font style="font-weight:bold;">用户注册</font></center> </h1><hr/>
<h3> <font style='font-weight:bold;'><a href="index.jsp">注册成功！点击跳转回界面</a></font> </h3>



<hr/>
        <div class="row footer-bottom">
          <ul class="list-inline text-center">
            <li>Copyright © 2016 Lance 保留所有权利</li>
          </ul>
        </div>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  </body>
</html>   