<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
    <html lang="zh-cn">
  <head>
  <meta name="renderer" content="webkit" /> 
      <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!--告诉浏览器，使用的是非兼容模式 -->
    <meta name="viewport" content="width=device-width, initial-scale=1"><!--告诉浏览器我们以怎么样的方式在其他设备显示的时候，自适应设备的宽度，比例是1:1 -->
    <title>活动详情</title>

 <link href="${pageContext.request.contextPath}/bt/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/bt/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/hammer.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/jquery.hammer.js"></script>
  </head>

<script type="text/javascript">

function ajaxCommentActivity(){
	
	$("#commentButton").attr('disabled',"true");
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
            <li><a href="${pageContext.request.contextPath}/toPostActivity.do">发布活动</a></li>       
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
 <h1>活动详情</h1>
<hr/>
				<p>活动名字：${activity.name}</p>
				<p>发布人：${activity.person.nickname}</p>
				<p>开始时间：${activity.startTime}</p>
				<p>持续时间：${activity.duringTime}</p>
				<p>活动地点：${activity.location}</p>
				<p>活动描述：${activity.description}</p>
				<p>活动图片：${activity.image}</p>								

	<h3> 参与人员：</h3>
	<c:if test="${empty peopleList}">
		<h5> 暂无参加人员，期待您的加入!</h5>
	</c:if>
	<c:if test="${not empty peopleList}">
		 <c:forEach items="${peopleList}" var="person">		
			<table>
			  <tr>	
				<td>姓名：${person.nickname} ，</td>
				<td>头像：${person.pimage}，</td>
				<td>留言：${person.message}，</td>
				<td>是否被接受：${person.accept}</td>
			</tr>
			</table>

		</c:forEach>
	</c:if>	
 <hr/>
  		<h3> 评分</h3>
	<form name="ActivityForm"  method="post">
	  <div class="form-group">
	  <label class= "radio-inline"></label>
		<input id="grades" type="radio" name="grades" value="50">差评
		<label class= "radio-inline"></label>
		<input id="grades" type="radio" name="grades" value="80">中评
		<label class= "radio-inline"></label>
		<input id="grades" type="radio" name="grades" value="100">好评
	  </div>
	</form> 
	<hr/>
	 <button type="button" id="commentButton" onclick="ajaxCommentActivity();" class="btn btn-lg btn-info">提交评价</button>
	 <button type="button"  onclick="history.go(-1);" class="btn btn-lg btn-default">返回</button>
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
