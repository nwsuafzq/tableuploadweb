<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 

	String user = (String)request.getSession().getAttribute("username");
	if(user == null){
		response.sendRedirect("/PLVDS/login.html");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码 - 作物生境模拟数据库系统</title>
<link href="/PLVDS/css/bootstrap-combined.min.css" type="text/css" rel="stylesheet">
<link href="/PLVDS/css/index-style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/PLVDS/js/jquery.min.js"></script>
<script type="text/javascript" src="/PLVDS/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/PLVDS/js/jquery.form.js"></script>
<script type="text/javascript" src="/PLVDS/js/menu.js"></script>
</head>
<body>
<ul class="nav nav-pills topnav">
	<li class="nettips">作物生境模拟数据库系统</li>
	<li class="pull-right"><a href="/PLVDS/logout" style="color:#5C6;">退出</a></li>
	<li class="pull-right disabled"><a href="#" style="color:#DE9;">${sessionScope.zntype}您好，<b>${sessionScope.username}</b></a></li>
</ul>
<div class="container-fluid" style="padding:0 5px;">
	<div class="row-fluid">
		<jsp:include page="../pub/menu_pub.jsp" />
		<div class="span10" style="background:#EEE;border-bottom:1px solid #08C">
			<h3>修改密码</h3>
			<div class="alert" role="alert" style="margin:5px 20px;display:none;" id="tip-info">
				<button type="button" class="close" onclick="$('#tip-info').css('display','none')">
					<span aria-hidden="true">&times;</span>
				</button>
				<span></span>
			</div>
			<form class="self-form" method="post" action="/PLVDS/user/chPwd" id="ch-pwd-form">
			  <div class="form-group">
			    	<label for="itmem-1" class="form-label">原始密码</label>
			    <div class="col-sm-10">
			      <input type="password" class="form-control" id="item-1" name="originpwd">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="item-2" class="form-label">新密码</label>
			    <div class="col-sm-10">
			      <input type="password" class="form-control" id="item-2" name="password">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="item-3" class="form-label">确认新密码</label>
			    <div class="col-sm-10">
			      <input type="password" class="form-control" id="item-3">
			    </div>
			  </div>
			  <div class="form-group">
			  	<label for="item-4" class="form-label" style="height:auto;"></label>
			      <button type="submit" class="btn btn-primary">确认修改</button>
			  </div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$("[item=chpwd]").addClass("active");
	
	var form = $("#ch-pwd-form");
	form.ajaxForm({
		beforeSubmit : function(){
			var originpwd = $("[name=originpwd]",form.get(0)).val();
			var password = $("[name=password]",form.get(0)).val();
			var cpwd = $("#item-3").val();
			
			if(originpwd == ''){
				$("#tip-info").addClass("alert-danger").css("display","block");
				$("#tip-info > span").text("请输入原始密码");
				return false;
			} else if(password == ''){
				$("#tip-info").addClass("alert-danger").css("display","block");
				$("#tip-info > span").text("请输入新密码");
				return false;
			} else if(password != cpwd){
				$("#tip-info").addClass("alert-danger").css("display","block");
				$("#tip-info > span").text("前后两次输入密码不一致");
				return false;
			}
		},
		success : function(status){
			if(status == "false"){
				$("#tip-info").addClass("alert-danger").css("display","block");
				$("#tip-info > span").text("原始密码输入错误");
			} else {
				$("#tip-info").removeClass("alert-danger").addClass("alert-success").css("display","block");
				$("#tip-info > span").text("密码添加成功");
			}
		}
	});
});
</script>
</body>
</html>