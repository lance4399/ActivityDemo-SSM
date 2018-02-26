<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>   
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
 <!DOCTYPE html>
    <html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!--告诉浏览器，使用的是非兼容模式 -->
    <meta name="viewport" content="width=device-width, initial-scale=1"><!--告诉浏览器我们以怎么样的方式在其他设备显示的时候，自适应设备的宽度，比例是1:1 -->
    <title>注册界面</title>

    <!-- Bootstrap-->
 <link href="${pageContext.request.contextPath}/bt/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/bt/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/hammer.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/jquery.hammer.js"></script>
    
    <script type="text/javascript">
    
    function ajaxQuery(){
      	
      	$.ajax({
      		type:'GET',
      		url:'${pageContext.request.contextPath}/ajax_regist.do',     	
      		data:'username='+$("#username").val(),  
      		success:function(data){//返回json结果	
      			   if(data.ret=="1"){              
      				   $("#usernameSpan").html("&nbsp;&nbsp;<font color='red'>（用户名已被注册）</font>");
      			   }else if(data.ret=="2") {           
      				   $("#usernameSpan").html("&nbsp;&nbsp;<font color='green'>（用户名可用）</font>");      				     
      			   }
      		}	
      	});	
      	 	
      }
        
    
   	// 验证注册表单
   	function checkForm(){
   		// 将需要验证表单组件 提供id属性
   		var username = $("#username").val();
   		if(username==null||username==""){
   			alert("用户名不能为空！");
   			return false;
   		}	
   		
   		var password =$("#password").val();
   		if(password==null||password==""){
   			alert("密码不能为空！");
   			return false;
   		}	
   		
   		var repassword = $("#repassword").val();
   		if(repassword==null||repassword==""){
   			alert("确认密码不能为空！");
   			return false;
   		}			
   		
   		var verifycode = $("#verifycode").val();
   		if(verifycode==null||verifycode==""){
   			alert("验证码不能为空！");
   			return false;
   		}	
   		// 为其它字段添加非空校验

   		if(password != repassword){
   			alert("两次密码必须一致！");
   			return false;
   		}	
   	}
    
   	// 切换验证码
   	function change(){
   	document.getElementById("verifycodefig").src  ="./verifycode.do?a="+new Date().getTime();
   	}

</script>
	<c:if test="${not empty errorMsg}">
	        	<%	String msg1=(String)request.getAttribute("errorMsg");%>
				errorAlert(msg1);
    	</c:if>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
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
        </div><!--/.nav-collapse -->
      </div>
    </nav>
			
<!--表单-->
<h1> <font color="yellow">  &nbsp;</font></h1>
<div class="container">


<h2><center> <font style="font-weight:bold;">用户注册</font></center> </h2><hr/>

 <div class="col-md-12" width="40%">
 
 	<form  class="form-signin" id="registForm" action="${pageContext.request.contextPath }/regist.do" method="post" onsubmit="return checkForm();">
		  <div class="form-group">
		    <label for="username">用户名<span id="usernameSpan"></span> </label>
		    <input type="text" class="form-control" id="username" name="username" onblur="ajaxQuery()"> 
		  </div>
		  <div class="form-group">
		    <label for="password">密码</label>
		    <input type="password" class="form-control"  id="password" name="password">
		  </div>
		   <div class="form-group">
		    <label for="password">确认密码</label>
		    <input type="password" class="form-control"  id="repassword" name="repassword">
		  </div>
		   <div class="form-group">
		    <label for="nickname">昵称 </label>
		    <input type="text" class="form-control" id="nickname" name="nickname"> 
		  </div>
	 <div class="form-group">
		    <label for="tel">联系电话 </label>
		    <input type="text" class="form-control" id="tel" name="tel"> 
		  </div>
		   <div class="form-group">
		    <label for="pimage">头像 </label>
		    <input type="text" class="form-control" id="pimage" name="pimage" > 
		  </div>
			<!-- <input type="text" id="pid" value="" style="display:none" /> -->
		  <div class="form-group">
		    <label for="verifycode">验证码</label>
		    <input type="text" class="form-control" name="verifycode" id="verifycode"  >
			<img id="verifycodefig" src="./verifycode.do" style="cursor: pointer;" onclick="change();"/>
		  	<a href="javascript:change();">换一张</a>
		  </div>
		
		  <button type="submit" id="submit" class="btn btn-lg btn-info" >提交</button>
		  <button type="button"  onclick="history.go(-1);" class="btn btn-lg btn-default">返回</button>
		</form>
		</div>
	</div>
<hr/>
       <div class="row footer-bottom">
          <ul class="list-inline text-center">
            <li>Copyright © 2017 Lance 保留所有权利</li>
          </ul>
        </div>
      <script src="${pageContext.request.contextPath}/bt/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/bootstrap.min.js"></script>
  </body>
</html>   