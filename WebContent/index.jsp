<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);
	
	String usertype = "";
	String user = (String)request.getSession().getAttribute("username");
	if(user == null){
		response.sendRedirect("/PLVDS/login.html");
	} else {
		usertype = (String)request.getSession().getAttribute("usertype");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页 - 作物生境模拟数据库系统</title>
<link href="/PLVDS/css/bootstrap-combined.min.css" type="text/css" rel="stylesheet">
<link href="/PLVDS/css/index-style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/PLVDS/js/jquery.min.js"></script>
<script type="text/javascript" src="/PLVDS/js/bootstrap.min.js"></script>
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
		<%@ include file="../pub/menu_pub.jsp" %>
		<div class="span10">
		<% if(usertype.equals("I")){ %>
			<table class="table table-hover" id="user-list">
				<thead>
					<tr style="background:#DDD;">
						<th>用户名</th>
						<th>身份</th>
						<th>所属教师</th>
						<th>权限</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<div class="pagination"><ul></ul></div>
		<% } else { %>
			<h3 style="background:#09E;height:240px;line-height:240px;font-size:2em;text-align:center;">欢迎登陆作物生境模拟数据库系统</h3>
		<% } %>
		</div>
	</div>
</div>
<% if(usertype.equals("I")){ %>
<script type="text/javascript">
$(function(){
	$("[item=userlist]").addClass("active");
	
	$.ajax({
		url : "/PLVDS/user/userList",
		type : "post",
		data : {page : 1},
		dataType : "json",
		success : function(obj){
			if(parseInt(obj.total) > 0)
				handlerList(obj,1);
		}
	});
});
function handlerList(obj,pageno){
	var table = $("#user-list tbody");
	var htmltt = '';
	for(var i=0;i<obj.list.length;i++){
		var tmp = obj.list[i];
		var utype,usertype = tmp.sf;
		if(usertype == "I") utype = "超级用户";
		else if(usertype == "T") utype = "教师";
		else if(usertype == "S") utype = "学生";
		var html = "<tr>" +
			"<td>"+tmp.yhm+"</td>" +
			"<td>"+utype+"</td>" +
			"<td>"+tmp.ssjs+"</td>" +
			"<td>"+tmp.qx+"</td>" +
			"<td><a href='javascript:void(0);' onclick=\"initPwd('"+tmp.yhm+"')\">初始化密码</a></td>" +
			"</tr>";
		htmltt += html;
	}
	table.html(htmltt);
	
	var page = $(".pagination ul");
	commonPageList(page,pageno,obj);
}
function jumpPage(pageno){
	var pagenn = pageno;
	if(pageno == "prev"){
		pagenn = $(".pagination .active a").text().trim();
		pagenn = parseInt(pagenn)-1;
	} else if(pageno == "next"){
		pagenn = $(".pagination .active a").text().trim();
		pagenn = parseInt(pagenn)+1;
	}
	$.ajax({
		url : "/PLVDS/user/userList",
		type : "post",
		data : {page : pagenn},
		dataType : "json",
		success : function(obj){
			handlerList(obj,pagenn);
		}
	});
}
function initPwd(username){
	$.ajax({
		url : "/PLVDS/user/initPwd",
		type : "post",
		data : {username : username},
		success : function(){
			alert("密码初始化成功");
		}
	});
}
</script>
<% } %>
</body>
</html>