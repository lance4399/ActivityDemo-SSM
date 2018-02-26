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

  <link rel="stylesheet" href="${pageContext.request.contextPath}/bt/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bt/css/bootstrap-theme.min.css">

  </head>
  <body>
                 <c:if test="${ not empty loginPerson}">
	          	    <%  
	          	    	String site = "./getMyPageDetails.do" ;
						response.setStatus(response.SC_MOVED_TEMPORARILY);
						response.setHeader("Location", site); 
					%>     			
    			 </c:if>
		   <c:if test="${ empty loginPerson}">
     			<%  
     				String site = "./toLogin.do" ;
					response.setStatus(response.SC_MOVED_TEMPORARILY);
					response.setHeader("Location", site); 
				%>
            </c:if>

    			
    			
  </body>
</html>   