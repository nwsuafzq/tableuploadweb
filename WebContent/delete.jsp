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
<title>删除表数据 - 作物生境模拟数据库系统</title>
<link href="/PLVDS/css/bootstrap-combined.min.css" type="text/css" rel="stylesheet">
<link href="/PLVDS/css/index-style.css" type="text/css" rel="stylesheet">
<link href="/PLVDS/css/ladda-themeless.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/PLVDS/js/jquery.min.js"></script>
<script type="text/javascript" src="/PLVDS/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/PLVDS/js/jquery.form.js"></script>
<script type="text/javascript" src="/PLVDS/js/menu.js"></script>
<script type="text/javascript" src="/PLVDS/js/spin.min.js"></script>
<script type="text/javascript" src="/PLVDS/js/ladda.min.js"></script>
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
			<h3>删除表数据</h3>
			<div class="row-fluid">
				<form class="self-form" style="width:500px;overflow:hidden;" method="post" action="/PLVDS/deleteByYear" id="del-form">
				  <div class="form-group">
				    <label class="form-label">选择表</label>
				    <div class="col-sm-10">
				    	<select class="form-control" name="table">
							<option value="">-请选择-</option>
							<option value="jbqkb">基本情况表</option>
							<option value="clmsb">处理描述表</option>
							<option value="cstrwlsj">初始土壤物理数据</option>
							<option value="cstrhxsjbc">初始土壤化学数据表层</option>
							<option value="cstrhxsjpm">初始土壤化学数据剖面</option>
							<option value="zzjlb">种植记录表</option>
							<option value="sfjlb">施肥记录表</option>
							<option value="syqjlb">生育期记录表</option>
							<option value="gxsjb">根系数据表</option>
							<option value="ggjlb">灌溉记录表</option>
							<option value="ghsjb">光合数据表</option>
							<option value="trwlsjb">土壤物理数据表</option>
							<option value="trhxsjbc">土壤化学数据表层</option>
							<option value="trhxsjpm">土壤化学数据剖面</option>
							<option value="trpmsfdtsjb">土壤剖面水分动态数据表</option>
							<option value="trsrydtsjb">土壤水热盐动态数据表</option>
							<option value="wsqtcdb">温室气体测定表</option>
							<option value="zzypb">植株样品表</option>
							<option value="kzb">考种表</option>
							<option value="qxsjb">气象数据表</option>
						</select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="form-label">按年份删除</label>
				    <div class="col-sm-10">
				    	<select class="form-control" name="year">
							<option value="">-请选择-</option>
							<option value="2013">2013年</option>
							<option value="2014">2014年</option>
							<option value="2015">2015年</option>
							<option value="2016">2016年</option>
						</select>
				    </div>
				  </div>
			      <span class="help-block"><span class="label label-warning">注意</span> 导入新数据之前，请删除旧数据</span>
				  <div class="form-group">
				  	<label class="form-label" style="height:auto;"></label>
				  		<button id="query-btn" type="button"
					      	class="btn btn-primary ladda-button" data-style="slide-down">
					      	<span class="ladda-label">查询数据</span>
					      </button>
				      <button id="del-btn" type="submit"
				      	class="btn btn-primary ladda-button" data-style="slide-down">
				      	<span class="ladda-label">确定删除</span>
				      </button>
				  </div>
				</form>
			</div>
			<div class="row-fluid">
				<div class="alert" role="alert" style="margin:5px 20px;display:none;" id="tip-info">
					<button type="button" class="close" onclick="$('#tip-info').css('display','none')">
						<span aria-hidden="true">&times;</span>
					</button>
					<span></span>
				</div>
				<table class="table table-hover" id="table-list">
					<tbody></tbody>
				</table>
				<div class="pagination"><ul></ul></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$("[item=delete]").addClass("active");
	
	$("#query-btn,#del-btn").click(function(){
		$('#tip-info').css('display','none');
	});
	
	$("#query-btn").click(function(){
		var _btn = this;
		var table = $("[name=table]").val();
		var year = $("[name=year]").val();
		
		if(table == ''){
			$("#tip-info").addClass("alert-danger").css("display","block");
			$("#tip-info > span").text("请选择一张表");
			return false;
		} else if(year == ""){
			$("#tip-info").addClass("alert-danger").css("display","block");
			$("#tip-info > span").text("请选择年份");
			return false;
		} else {
			__btn = Ladda.create(_btn);
		 	__btn.start();
		 	window.table = table;
		 	window.filterval = year;
		 	$.ajax({
				url : "/PLVDS/argcomm",
				type : "post",
				data : {
					table:table,
					filter:"试验年度",
					filterval:year,
					page:1
				},
				dataType : "json",
				success : function(obj){
					__btn.stop();
					$("#table-list tbody").html('');
					$(".pagination ul").html('');
					if(parseInt(obj.total) > 0)
						handlerList(obj,1);
				}
			});
		}
	});
	
	var form = $("#del-form");
	var btn;
	form.ajaxForm({
		beforeSubmit : function(){
			var table = $("[name=table]").val();
			var year = $("[name=year]").val();
			
			if(table == ''){
				$("#tip-info").addClass("alert-danger").css("display","block");
				$("#tip-info > span").text("请选择一张表");
				return false;
			} else if(year == ""){
				$("#tip-info").addClass("alert-danger").css("display","block");
				$("#tip-info > span").text("请选择年份");
				return false;
			} else {
				btn = Ladda.create($("#del-btn").get(0));
			 	btn.start();
			}
		},
		dataType : "json",
		success : function(data){
			if(data.status == "Y"){
				$("#tip-info").removeClass("alert-danger").addClass("alert-success").css("display","block");
				$("#tip-info > span").text(data.info);
			} else {
				$("#tip-info").removeClass("alert-danger").addClass("alert-danger").css("display","block");
				$("#tip-info > span").text(data.info);
			}
			btn.stop();
		}
	});
});
function handlerList(obj,pageno){
	var table = $("#table-list tbody");
	var htmltt = '';
	for(var i=0;i<obj.list.length;i++){
		var tmp = obj.list[i];
		var html = "<tr>";
		for(var at in tmp){
			html += "<td>"+tmp[at]+"</td>";
		}
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
		data : {
			table:window.table,
			filter:"试验年度",
			filterval:window.year,
			page:pagenn
		},
		dataType : "json",
		success : function(obj){
			if(parseInt(obj.total) > 0)
				handlerList(obj,pagenn);
		}
	});
}
</script>
</body>
</html>