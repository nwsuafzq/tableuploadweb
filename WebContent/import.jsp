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
<title>导入表数据 - 作物生境模拟数据库系统</title>
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
			<h3>导入表数据</h3>
			<div class="alert" role="alert" style="margin:5px 20px;display:none;" id="tip-info">
				<button type="button" class="close" onclick="$('#tip-info').css('display','none')">
					<span aria-hidden="true">&times;</span>
				</button>
				<span></span>
			</div>
			<form class="self-form" style="width:500px;overflow:hidden;"  enctype="multipart/form-data" method="post" action="/PLVDS/import" id="import-form">
			  <div class="form-group">
			    <label class="form-label">选择对应表</label>
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
			    <label class="form-label">选择文件</label>
			    <div class="col-sm-10">
			    	<a type="button" class="btn btn-info btn-lg" style="position:relative;">选择文件
						<input type="file" name="importxls" style="position:absolute;
							opacity:0;width:100%;height:100%;top:0;left:0;z-index:999;">
			    	</a>
			    	<span id="file_name"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="form-label">从第几行开始是数据</label>
			    <div class="col-sm-10">
			    	<input type="text" value="2" name="startrow">
			    </div>
			  </div>
		      <span class="help-block"><span class="label label-info">要求</span> 起始行默认为2，最小值为1；Excel中字段顺序要和数据库中的一致；列数要和数据中的字段数相同；数字类型请转化为数字格式，设置成常规即可</span>
		      <span class="help-block"><span class="label label-warning">注意</span> 目前只支持Microsoft Excel 97/2000/XP/2003文件(.xls);</span>
			  <div class="form-group">
			  	<label class="form-label" style="height:auto;"></label>
			      <button id="import-btn" type="submit"
			      	class="btn btn-primary ladda-button" data-style="slide-down">
			      	<span class="ladda-label">导入</span>
			      </button>
			  </div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$("[name=importxls]").change(function(){
		$("#file_name").text(this.value);
	})
	$("[item=import]").addClass("active");
	
	var form = $("#import-form");
	var btn;
	form.ajaxForm({
		beforeSubmit : function(){
			var table = $("[name=table]").val();
			var file = $("[name=importxls]").val();
			
			if(table == ''){
				$("#tip-info").addClass("alert-danger").css("display","block");
				$("#tip-info > span").text("请选择一张表");
				return false;
			} else if(file == ""){
				$("#tip-info").addClass("alert-danger").css("display","block");
				$("#tip-info > span").text("请选择要上传的文件");
				return false;
			} else if(!checkFile(file)){
				$("#tip-info").addClass("alert-danger").css("display","block");
				$("#tip-info > span").text("文件格式错误");
				return false;
			} else {
				btn = Ladda.create($("#import-btn").get(0));
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

function checkFile(file){
	return /\.(xls)$/.test(file)||/\.(xlsx)$/.test(file);
}
</script>
</body>
</html>