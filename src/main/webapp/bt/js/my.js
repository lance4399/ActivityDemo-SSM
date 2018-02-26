$(document).ready(function() {
	
	$("#registButton").click(function() {
		$("#registButton").attr('disabled',"true");
		registAjax();
	});
	
	
	
	$("#loginButton").click(function() {
		$("#loginButton").attr('disabled',"true");
		loginAjax();
		weburl="/index_choose";
        window.location.replace(weburl);
	});
	
});


function registAjax(){
	
	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath }/ajaxQueryName.action',
		contentType:'application/json;charset=utf-8',
		//数据格式是json串，商品信息
		dataType:'json',
		success: loginOut_fun,
		success:function(data){//返回json结果
			alert(data);
		}
	
	
	});

}

function Login(){
	var str="/ajax_LoginOut.action";
	var data_str=encodeToUTF8(str);
	$.ajax({
		type: "GET",
		url: data_str,
		success: loginOut_fun,
		error: null,
		timeout: 5000,
		dataType: "json",
		cache: false,
		complete : function(XMLHttpRequest,status){ //请求完成后最终执行参数
			if(status=='timeout'){//超时,status还有success,error等值的情况
				weburl="/out.jsp";
				window.location.replace(weburl);
			}
			}
	});
	}
	function login_fun(msg){
	$("#LoginOut").removeAttr("disabled"); 
	if(msg.ret==0){
		weburl="/out.jsp";
		window.location.replace(weburl);
	}else{
		alert(msg.msg);
	}
	}
	
	
	function passwordLogin(){
		var str="/ajax_gzh.action";
		var data_str=encodeToUTF8(str);
		$.ajax({
			type: "GET",
			url: data_str,
			success: password_fun,
			error: null,
			timeout: 5000,
			dataType: "json",
			cache: false,
			complete : function(XMLHttpRequest,status){ //请求完成后最终执行参数
				if(status=='timeout'){//超时,status还有success,error等值的情况
						alert("认证超时！！");
						$("#btngdpass").removeAttr("disabled"); 
				}
				}
		});
		}

		function password_fun(msg){
		$("#btngdpass").removeAttr("disabled"); 
		if(msg.ret==0){ 
			appId=msg.appId;    
			extend=msg.extend;    
			timestamp=msg.timestamp; 
			sign=msg.sign;    
			shop_id=msg.shop_id;  
			authUrl=msg.authUrl;  
			mac=msg.mac;     
			ssid=msg.ssid;      
			bssid=msg.bssid;
			var	weburl="/wx.html?appId="+appId+"&extend="+extend+"&timestamp="+timestamp+"&sign="+sign+"&shop_id="+shop_id+"&authUrl="+authUrl+"&mac="+mac+"&ssid="+ssid+"&bssid="+bssid;
			window.location.replace(weburl);  
		}
		else if(msg.ret==10){
			alert("参数获取失败，请重试！！");
			var	weburl="http://www.openportal.com.cn";
			window.location.replace(weburl);
		}
		else{
		alert(msg.msg);   	
		}
		}
