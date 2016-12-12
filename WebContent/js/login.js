$(function(){
	$("#loginBtn").click(function(){
		var username = $("input[name=username]").val(),
		password = $("input[name=password]").val(),
		usertype = $("input[name=usertype]:checked").val();
		if(username === '' || password === '' || usertype === ''){
			$("#myModal").modal();
		} else {
			$.post("/PLVDS/login",
				{	username : username,
					password : password,
					usertype : usertype
				},function(data){
					var obj = eval("("+data+")");
					if(obj.status === "true"){
						location.href = "/PLVDS/index.jsp";
					} else {
						$("#tip-con").text("用户名或密码错误");
						$("#myModal").modal();
					}
				}
			);
		}
	});
});
