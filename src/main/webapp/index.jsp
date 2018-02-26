<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
    <html lang="zh-cn">
  <head>
  <meta name="renderer" content="webkit" /> 
      <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!--告诉浏览器，使用的是非兼容模式 -->
    <meta name="viewport" content="width=device-width, initial-scale=1"><!--告诉浏览器我们以怎么样的方式在其他设备显示的时候，自适应设备的宽度，比例是1:1 -->
    <title>首页</title>
  <link href="${pageContext.request.contextPath}/bt/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/bt/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/hammer.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/jquery.hammer.js"></script>
  </head>

<script type="text/javascript">

$(function () {
    $('.carousel').hammer().on('swipeleft', function () {
        $(this).carousel('next');
    });
    $('.carousel').hammer().on('swiperight', function () {
        $(this).carousel('prev');
    });
});




function findAllActivities(){
	//提交form
	document.ActivityForm.action="${pageContext.request.contextPath }/getActivities.do";
	document.ActivityForm.submit();
}

function getActivitiesByKeyword(){
	document.getActivitiesByKeywordForm.action="${pageContext.request.contextPath }/getActivitiesByKeyword.do";
	document.getActivitiesByKeywordForm.submit();
}	

</script>


  <body >
    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" >
      <div class="container">
      <!-- 网站图标处 -->
        <div class="navbar-header">
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
    <h1> <font color="yellow">  &nbsp;</font></h1>
<div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div id="my-carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#my-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#my-carousel" data-slide-to="1"></li>

                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img alt="First slide" src="${pageContext.request.contextPath}/bt/imgs/1.jpg" width="1000" height="400">
                            <div class="carousel-caption">
                                <font color="black">
                                <h3>更好</h3>
                                <p>想要发布和查看活动信息，请注册登录！</p>
                                </font>
                            </div>
                        </div>
                        <div class="item">
                            <img alt="Second slide" src="${pageContext.request.contextPath}/bt/imgs/2.jpg"  width="1000" height="400">
                            <div class="carousel-caption">
                                <h3>更快</h3>
                                <p><font color="black">不用出门也能约到想约的人，做想做的事情，您还在等什么？</font></p>
                            </div>
                        </div>

                    </div>
                    <a class="left carousel-control" href="#my-carousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#my-carousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>

   <div class="container theme-showcase" >

        <p>欢迎来到Lance定制的“搞事情”Demo，欢迎大家一起搞事情！&nbsp;&nbsp;</p>
        <p id="m"></p>
        <p><a href="${pageContext.request.contextPath}/getActivities.do" class="btn btn-primary btn-lg" >查看活动 &raquo;</a></p>
    </div>
 

<hr/>
        <div class="row footer-bottom">
          <ul class="list-inline text-center">
            <li>Copyright © 2017 Lance 保留所有权利</li>
          </ul>
        </div>
  </body>
   <script src="${pageContext.request.contextPath}/bt/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/bootstrap.min.js"></script>
       <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  
</html>
