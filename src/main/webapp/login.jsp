<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
 <!DOCTYPE html>
    <html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!--告诉浏览器，使用的是非兼容模式 -->
    <meta name="viewport" content="width=device-width, initial-scale=1"><!--告诉浏览器我们以怎么样的方式在其他设备显示的时候，自适应设备的宽度，比例是1:1 -->
    <title>登陆界面</title>

    <!-- Bootstrap -->
   <link href="${pageContext.request.contextPath}/bt/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/bt/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/hammer.min.js"></script>
    <script src="${pageContext.request.contextPath}/bt/js/jquery.hammer.js"></script>
    <script type="text/javascript">
	// 验证注册表单
	function checkForm(){
		// 将需要验证表单组件 提供id属性
		var username = document.getElementById("username").value;
		if(username==null||username==""){
			alert("用户名不能为空！");
			return false;
		}	
		// 为其它字段添加非空校验

		var password = document.getElementById("password").value;
		if(password==null||password==""){
			alert("密码不能为空！");
			return false;
		}	
	
		
	}
	
	function errorAlert(msg){
		alert(msg); 
	}
	
</script>
 		<c:if test="${not empty errorMsg}">
	        	<%	String msg1=(String)request.getAttribute("errorMsg");%>
				errorAlert(msg1);
    	</c:if>
  </head>

  <body>

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
        <li><a href="${pageContext.request.contextPath}/toIndex.do">网站主页</a></li>
        <li><a href="${pageContext.request.contextPath}/getActivities.do">查看活动</a></li>  
            <li><a href="${pageContext.request.contextPath}/ifLoginForPostActivity.do">发布活动</a></li>       
            <li><a href="${pageContext.request.contextPath}/ifLoginForMyPage.do">会员中心</a></li>     
          </ul>
           <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="${pageContext.request.contextPath}/toLogin.do">登录</a></li>
            <li class="divider-vertical"></li>
            <li ><a href="${pageContext.request.contextPath}/toRegist.do">注册</a></li>
         
          </ul>
        </div>
      </div>
    </nav>
<%	String uname="";
			Cookie[] cs=request.getCookies();
			if(cs!=null){
				for(Cookie c:cs){
					if("username".equals(c.getName())){//查找为uname的cookie
							uname=c.getValue();//把cookie的值赋给uname
						}
				}
			}%>
			

<h1> <font color="yellow">  &nbsp;</font></h1>
<div class="container">

<form class="form-signin" action="${pageContext.request.contextPath }/login.do" method="post" onsubmit="return checkForm();" > 
<h2> <center> <font style="font-weight:bold;">用户登陆</font></center></h2><hr/>
  <div class="form-group">
    <label for="username">用户名</label>
    <input type="text" class="form-control" name="username" id="username">
  </div>
  <div class="form-group">
    <label for="password">密码</label>
    <input type="password" class="form-control" name="password" id="password" >
  </div>

<br/><button type="submit" id="loginButton" class="btn btn-lg btn-success">登陆</button>
  <button type="button"  onclick="history.go(-1);" class="btn btn-lg btn-default">返回</button>
</form>
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