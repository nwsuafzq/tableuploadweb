<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String type = (String)request.getSession().getAttribute("usertype");
	if(type != null && type.equals("I")){
%>
	<div class="span2" style="background: #DDD;">
		<ul class="nav nav-list">
			<li class="nav-header">用户管理</li>
			<li item="userlist"><a href="/PLVDS/index.jsp">用户列表</a></li>
			<li item="adduser"><a href="/PLVDS/user/adduser.jsp">添加用户</a></li>
			<li item="chpwd"><a href="/PLVDS/user/chpwd.jsp">修改密码</a></li>
			<li class="nav-header" id="setuf" status="false"><span>+</span>监测数据</li>
			<li id="folder-menu">
				<ul class="nav nav-list">
					<li item="jbqkb"><a href="/PLVDS/argcom.jsp?table=jbqkb">基本情况表</a></li>
					<li item="clmsb"><a href="/PLVDS/argcom.jsp?table=clmsb">处理描述表</a></li>
					<li item="cstrwlsj"><a href="/PLVDS/argcom.jsp?table=cstrwlsj">初始土壤物理数据</a></li>
					<li item="cstrhxsjbc"><a href="/PLVDS/argcom.jsp?table=cstrhxsjbc">初始土壤化学数据表层</a></li>
					<li item="cstrhxsjpm"><a href="/PLVDS/argcom.jsp?table=cstrhxsjpm">初始土壤化学数据剖面</a></li>
					<li item="zzjlb"><a href="/PLVDS/argcom.jsp?table=zzjlb">种植记录表</a></li>
					<li item="sfjlb"><a href="/PLVDS/argcom.jsp?table=sfjlb">施肥记录表</a></li>
					<li item="syqjlb"><a href="/PLVDS/argcom.jsp?table=syqjlb">生育期记录表</a></li>
					<li item="gxsjb"><a href="/PLVDS/argcom.jsp?table=gxsjb">根系数据表</a></li>
					<li item="ggjlb"><a href="/PLVDS/argcom.jsp?table=ggjlb">灌溉记录表</a></li>
					<li item="ghsjb"><a href="/PLVDS/argcom.jsp?table=ghsjb">光合数据表</a></li>
					<li item="trwlsjb"><a href="/PLVDS/argcom.jsp?table=trwlsjb">土壤物理数据表</a></li>
					<li item="trhxsjbc"><a href="/PLVDS/argcom.jsp?table=trhxsjbc">土壤化学数据表层</a></li>
					<li item="trhxsjpm"><a href="/PLVDS/argcom.jsp?table=trhxsjpm">土壤化学数据剖面</a></li>
					<li item="trpmsfdtsjb"><a href="/PLVDS/argcom.jsp?table=trpmsfdtsjb">土壤剖面水分动态数据表</a></li>
					<li item="trsrydtsjb"><a href="/PLVDS/argcom.jsp?table=trsrydtsjb">土壤水热盐动态数据表</a></li>
					<li item="wsqtcdb"><a href="/PLVDS/argcom.jsp?table=wsqtcdb">温室气体测定表</a></li>
					<li item="zzypb"><a href="/PLVDS/argcom.jsp?table=zzypb">植株样品表</a></li>
					<li item="kzb"><a href="/PLVDS/argcom.jsp?table=kzb">考种表</a></li>
					<li item="qxsjb"><a href="/PLVDS/argcom.jsp?table=qxsjb">气象数据表</a></li>
				</ul>
			</li>
			<li class="divider"></li>
			<li item="delete"><a href="/PLVDS/delete.jsp">删除数据</a></li>
			<li item="import"><a href="/PLVDS/import.jsp">导入数据</a></li>
		</ul>
	</div>
<%
	} else if(type != null && type.equals("T")){
%>
	<div class="span2" style="background: #DDD;">
		<ul class="nav nav-list">
			<li class="nav-header" id="setuf" status="false"><span>+</span>监测数据</li>
			<li id="folder-menu">
				<ul class="nav nav-list">
					<li item="jbqkb"><a href="/PLVDS/argcom.jsp?table=jbqkb">基本情况表</a></li>
					<li item="clmsb"><a href="/PLVDS/argcom.jsp?table=clmsb">处理描述表</a></li>
					<li item="cstrwlsj"><a href="/PLVDS/argcom.jsp?table=cstrwlsj">初始土壤物理数据</a></li>
					<li item="cstrhxsjbc"><a href="/PLVDS/argcom.jsp?table=cstrhxsjbc">初始土壤化学数据表层</a></li>
					<li item="cstrhxsjpm"><a href="/PLVDS/argcom.jsp?table=cstrhxsjpm">初始土壤化学数据剖面</a></li>
					<li item="zzjlb"><a href="/PLVDS/argcom.jsp?table=zzjlb">种植记录表</a></li>
					<li item="sfjlb"><a href="/PLVDS/argcom.jsp?table=sfjlb">施肥记录表</a></li>
					<li item="syqjlb"><a href="/PLVDS/argcom.jsp?table=syqjlb">生育期记录表</a></li>
					<li item="gxsjb"><a href="/PLVDS/argcom.jsp?table=gxsjb">根系数据表</a></li>
					<li item="ggjlb"><a href="/PLVDS/argcom.jsp?table=ggjlb">灌溉记录表</a></li>
					<li item="ghsjb"><a href="/PLVDS/argcom.jsp?table=ghsjb">光合数据表</a></li>
					<li item="trwlsjb"><a href="/PLVDS/argcom.jsp?table=trwlsjb">土壤物理数据表</a></li>
					<li item="trhxsjbc"><a href="/PLVDS/argcom.jsp?table=trhxsjbc">土壤化学数据表层</a></li>
					<li item="trhxsjpm"><a href="/PLVDS/argcom.jsp?table=trhxsjpm">土壤化学数据剖面</a></li>
					<li item="trpmsfdtsjb"><a href="/PLVDS/argcom.jsp?table=trpmsfdtsjb">土壤剖面水分动态数据表</a></li>
					<li item="trsrydtsjb"><a href="/PLVDS/argcom.jsp?table=trsrydtsjb">土壤水热盐动态数据表</a></li>
					<li item="wsqtcdb"><a href="/PLVDS/argcom.jsp?table=wsqtcdb">温室气体测定表</a></li>
					<li item="zzypb"><a href="/PLVDS/argcom.jsp?table=zzypb">植株样品表</a></li>
					<li item="kzb"><a href="/PLVDS/argcom.jsp?table=kzb">考种表</a></li>
					<li item="qxsjb"><a href="/PLVDS/argcom.jsp?table=qxsjb">气象数据表</a></li>
				</ul>
			</li>
			<li class="divider"></li>
			<li item="stulist"><a href="/PLVDS/user/stulist.jsp">学生列表</a></li>
			<li item="chpwd"><a href="/PLVDS/user/chpwd.jsp">修改密码</a></li>
			<li class="divider"></li>
			<li item="delete"><a href="/PLVDS/delete.jsp">删除数据</a></li>
			<li item="import"><a href="/PLVDS/import.jsp">导入数据</a></li>
		</ul>
	</div>
<%
	} else if(type != null && type.equals("S")){
%>
	<div class="span2" style="background: #DDD;">
		<ul class="nav nav-list">
			<li class="nav-header" id="setuf" status="false"><span>+</span>监测数据</li>
			<li id="folder-menu">
				<ul class="nav nav-list">
					<li item="jbqkb"><a href="/PLVDS/argcom.jsp?table=jbqkb">基本情况表</a></li>
					<li item="clmsb"><a href="/PLVDS/argcom.jsp?table=clmsb">处理描述表</a></li>
					<li item="cstrwlsj"><a href="/PLVDS/argcom.jsp?table=cstrwlsj">初始土壤物理数据</a></li>
					<li item="cstrhxsjbc"><a href="/PLVDS/argcom.jsp?table=cstrhxsjbc">初始土壤化学数据表层</a></li>
					<li item="cstrhxsjpm"><a href="/PLVDS/argcom.jsp?table=cstrhxsjpm">初始土壤化学数据剖面</a></li>
					<li item="zzjlb"><a href="/PLVDS/argcom.jsp?table=zzjlb">种植记录表</a></li>
					<li item="sfjlb"><a href="/PLVDS/argcom.jsp?table=sfjlb">施肥记录表</a></li>
					<li item="syqjlb"><a href="/PLVDS/argcom.jsp?table=syqjlb">生育期记录表</a></li>
					<li item="gxsjb"><a href="/PLVDS/argcom.jsp?table=gxsjb">根系数据表</a></li>
					<li item="ggjlb"><a href="/PLVDS/argcom.jsp?table=ggjlb">灌溉记录表</a></li>
					<li item="ghsjb"><a href="/PLVDS/argcom.jsp?table=ghsjb">光合数据表</a></li>
					<li item="trwlsjb"><a href="/PLVDS/argcom.jsp?table=trwlsjb">土壤物理数据表</a></li>
					<li item="trhxsjbc"><a href="/PLVDS/argcom.jsp?table=trhxsjbc">土壤化学数据表层</a></li>
					<li item="trhxsjpm"><a href="/PLVDS/argcom.jsp?table=trhxsjpm">土壤化学数据剖面</a></li>
					<li item="trpmsfdtsjb"><a href="/PLVDS/argcom.jsp?table=trpmsfdtsjb">土壤剖面水分动态数据表</a></li>
					<li item="trsrydtsjb"><a href="/PLVDS/argcom.jsp?table=trsrydtsjb">土壤水热盐动态数据表</a></li>
					<li item="wsqtcdb"><a href="/PLVDS/argcom.jsp?table=wsqtcdb">温室气体测定表</a></li>
					<li item="zzypb"><a href="/PLVDS/argcom.jsp?table=zzypb">植株样品表</a></li>
					<li item="kzb"><a href="/PLVDS/argcom.jsp?table=kzb">考种表</a></li>
					<li item="qxsjb"><a href="/PLVDS/argcom.jsp?table=qxsjb">气象数据表</a></li>
				</ul>
			</li>
			<li class="divider"></li>
			<li item="chpwd"><a href="/PLVDS/user/chpwd.jsp">修改密码</a></li>
			<li class="divider"></li>
			<li item="delete"><a href="/PLVDS/delete.jsp">删除数据</a></li>
			<li item="import"><a href="/PLVDS/import.jsp">导入数据</a></li>
		</ul>
	</div>
<%	
	}
%>