<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,nwsuaf.plvds.service.*" %>
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
	String table = request.getParameter("table");
	
	List<String> columns = new ArrayList<String>();
	
	Connection con = DataSource.getConnection();
	String sql = "select * from "+table+" where 1=2";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	ResultSetMetaData rsmd = rs.getMetaData();
	int count = rsmd.getColumnCount();
	for(int i=1;i<=count;i++){
		columns.add(rsmd.getColumnName(i));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%= table %> - 作物生境模拟数据库系统</title>
<link href="/PLVDS/css/bootstrap-combined.min.css" type="text/css" rel="stylesheet">
<link href="/PLVDS/css/index-style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/PLVDS/js/jquery.min.js"></script>
<script type="text/javascript" src="/PLVDS/js/jquery.form.js"></script>
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
			<div id="search-area">
				<form action="/PLVDS/argcomm" method="post" id="filter-form" class="form-search form-inline">
					<input name="table" type="hidden" value="<%= table %>">
					<input name="page" type="hidden" value="1">
					<select name="filter" id="slt-item">
						<option value="sybm">试验编码</option>
						<option value="synd">试验年度</option>
					</select><input class="input-medium search-query" name="filterval" id="stext" type="text" /><button class="btn" id="sresult" type="submit">查找</button>
				</form>
				<a id="export-data" href="/PLVDS/export?table=<%= table %>" target="_self" class="btn btn-primary">导出</a>
			</div>
			<table class="table table-hover" id="table-list">
				<thead>
					<tr style="background:#DDD;">
						<%@ include file="../pub/column.jsp" %>
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
	$("#folder-menu").css("display","block");
	$("[item=<%= table %>]").addClass("active");
	
	$.ajax({
		url : "/PLVDS/argcomm",
		type : "post",
		data : {table : "<%= table %>",page : 1},
		dataType : "json",
		success : function(obj){
			if(parseInt(obj.total) > 0)
				handlerList(obj,1);
		}
	});
	
	$("#filter-form").ajaxForm({
		dataType : "json",
		success : function(obj){
			if(obj.error){
				alert("该表中没有[试验年度]字段...");
				return false;
			}
			handlerList(obj,1);
			
			var href = $("#export-data").attr("href");
			var filter = $("select[name=filter]").val();
			var filterval = $("input[name=filterval]").val();
			$("#export-data").attr("href",href+"&filter="+filter+"&filterval="+filterval);
		}
	});
});
function handlerList(obj,pageno){
	var table = $("#table-list tbody");
	var htmltt = '';
	for(var i=0;i<obj.list.length;i++){
		var tmp = obj.list[i];
		var html = "<tr>";
		<% for(int i=0;i<columns.size();i++){ %>
			html+= "<td>"+tmp.<%= columns.get(i) %>+"</td>";
		<% } %>
		html += "</tr>";
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
		url : "/PLVDS/argcomm",
		type : "post",
		data : {table : "<%= table %>",page : pagenn},
		dataType : "json",
		success : function(obj){
			handlerList(obj,pagenn);
		}
	});
}
</script>
</body>
</html>