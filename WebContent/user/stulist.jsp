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
<title>学生列表 - 作物生境模拟数据库系统</title>
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
		<jsp:include page="../pub/menu_pub.jsp" />
		<div class="span10">
			<table class="table table-hover" id="stu-list">
				<thead>
					<tr style="background:#DDD;">
						<th>用户名</th>
						<th>身份</th>
						<th>所属教师</th>
						<th>权限</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<div class="pagination"><ul></ul></div>	
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$("[item=stulist]").addClass("active");
	
	$.ajax({
		url : "/PLVDS/user/stuList",
		type : "post",
		data : {page : 1},
		dataType : "json",
		success : function(obj){
			handlerList(obj,1);
		}
	});
});
function handlerList(obj,pageno){
	var table = $("#stu-list tbody");
	var htmltt = '';
	for(var i=0;i<obj.list.length;i++){
		var tmp = obj.list[i];
		var html = "<tr>" +
			"<td>"+tmp.yhm+"</td>" +
			"<td>学生</td>" +
			"<td>"+tmp.ssjs+"</td>" +
			"<td>"+tmp.qx+"</td>" +
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
		url : "/PLVDS/user/stuList",
		type : "post",
		data : {page : pagenn},
		dataType : "json",
		success : function(obj){
			handlerList(obj,pagenn);
		}
	});
}
</script>
</body>
</html>