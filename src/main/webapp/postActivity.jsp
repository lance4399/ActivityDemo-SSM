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

<script type="text/javascript">


function ajaxPostActivity(){
	
	$("#postButton").attr('disabled',"true");
 	$.ajax({
  		type:'POST',  	
  		url:"${pageContext.request.contextPath}/postActivity.do",
  		timeout: 5000,
  		data: $('#postActivityForm').serialize(),
  		//dataType: "json",
  		success:function(data){		
  			alert(data.msg);
  			window.location.replace("${pageContext.request.contextPath}/getActivities.do");
  		 }
  	});	 	
}

function postActivity(){
	//提交form
	document.postActivityForm.action="${pageContext.request.contextPath }/postActivity.do";
	document.postActivityForm.submit();
	alert('${msg}')
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
         <li ><a href="${pageContext.request.contextPath}/getActivities.do">查看活动</a></li>  
            <li class="active"><a href="${pageContext.request.contextPath}/ifLoginForPostActivity.do">发布活动</a></li>       
            <li ><a href="${pageContext.request.contextPath}/ifLoginForMyPage.do">会员中心</a></li>   
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

 <h1><center>发布活动</center></h1>

<div class="col-md-12" width="40%">
 	<form  class="form-signin" id="postActivityForm" method="post" >
		  <div class="form-group">
		    <label for="name">活动名    </label>
		    <input type="text" class="form-control" id="name" name="name" > 
		  </div>
		   <div class="form-group">
		    <label for="needPeople">活动人数 </label>
		    <input type="text" class="form-control" id="needPeople" name="needPeople" placeholder="10"> 
		  </div>
	 <div class="form-group">
		    <label for="startTime">活动开始时间 </label>
		    <input type="text" class="form-control" id="startTime" name="startTime"> 
		  </div>
		  
		   <div class="form-group">
		    <label for="duringTime">持续时间 </label>
		    <input type="text" class="form-control" id="duringTime" name="duringTime"> 
		  </div>		  
		   <div class="form-group">
		    <label for="location">活动地点 </label>
		    <input type="text" class="form-control" id="location" name="location" > 
		  </div>
			<!-- <input type="text" id="pid" value="" style="display:none" /> -->
		  <div class="form-group">
		    <label for="description">活动介绍</label>
		    <input type="text" class="form-control" name="description" id="description"  >
		  </div>
		<div class="form-group">
		    <label for="image">活动图片</label>
		    <input type="text" class="form-control" name="image" id="image"  >
		  </div>
		  <button type= "submit" id="postButton" onclick="ajaxPostActivity();" class="btn btn-lg btn-info" >提交</button>
		  <button type="button"  onclick="history.go(-1);" class="btn btn-lg btn-default">返回</button>
		</form>
		</div>
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
