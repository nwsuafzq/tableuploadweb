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
<title>添加新用户 - 作物生境模拟数据库系统</title>
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
			<h3>添加新用户</h3>
			<div class="alert" role="alert" style="margin:5px 20px;display:none;" id="tip-info">
				<button type="button" class="close" onclick="$('#tip-info').css('display','none')">
					<span aria-hidden="true">&times;</span>
				</button>
				<span></span>
			</div>
			<form class="self-form" method="post" action="/PLVDS/user/addUser" id="add-user-form">
			  <div class="form-group">
			    	<label for="itmem-1" class="form-label">用户名</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="item-1" name="username">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="item-2" class="form-label">密码</label>
			    <div class="col-sm-10">123456<span style="color:#999;margin-left:5px;">默认</span></div>
			  </div>
			  <div class="form-group">
			    <label for="item-3" class="form-label">身份</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">
				  <input type="radio" name="usertype" value="I"> 超级用户
				</label>
				<label class="radio-inline">
				  <input type="radio" name="usertype" value="T"> 教师
				</label>
				<label class="radio-inline">
				  <input type="radio" name="usertype" value="S"> 学生
				</label>
			    </div>
			  </div>
			  <div class="form-group" style="display:none;" id="show-tlist">
			    <label for="item-4" class="form-label">所属教师</label>
			    <div class="col-sm-10">
			      <select class="form-control" name="belteacher">
					  <option value="">-请选择-</option>
					</select>
			    </div>
			  </div>
			  <div class="form-group">
			  	<label for="item-4" class="form-label" style="height:auto;"></label>
			      <button id="add-btn" type="submit" class="btn btn-primary">添加</button>
			  </div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$("[item=adduser]").addClass("active");
	
	$("[name=usertype]").change(function(){
		var usertype = this.value;
		if(usertype === "S"){
			$("#show-tlist").css("display","block");
			$.ajax({
				url : '/PLVDS/user/teacherList',
				type : "post",
				dataType : "json",
				success : function(tobj){
					var slt = $("[name=belteacher]");
					for(var i=0;i<tobj.tlist.length;i++){
						var t = tobj.tlist[i];
						var opt = "<option value='"+t+"'>"+t+"</option>";
						slt.append(opt);
					}
				}
			});
		} else {
			$("#show-tlist").css("display","none");
		}
	});
	
	var form = $("#add-user-form");
	form.ajaxForm({
		beforeSubmit : function(){
			var username = $("[name=username]",form.get(0)).val();
			var usertype = $("[name=usertype]:checked",form.get(0)).val();
			var belteacher = $("[name=belteacher]",form.get(0)).val();
			
			if(username == ''){
				$("#tip-info").addClass("alert-danger").css("display","block");
				$("#tip-info > span").text("用户名不能为空");
				return false;
			} else if(typeof usertype === "undefined"){
				$("#tip-info").addClass("alert-danger").css("display","block");
				$("#tip-info > span").text("请选择用户类型");
				return false;
			}
			if(usertype == "S"){
				if(belteacher == ""){
					$("#tip-info").addClass("alert-danger").css("display","block");
					$("#tip-info > span").text("请选择一名教师");
					return false;
				}
			}
		},
		success : function(){
			$("#tip-info").removeClass("alert-danger").addClass("alert-success").css("display","block");
			$("#tip-info > span").text("新用户添加成功");
		}
	});
});
</script>
</body>
</html>