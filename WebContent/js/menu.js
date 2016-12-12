$(function(){
	$("#setuf").click(function(){
		var $this = $(this);
		var status = $this.attr("status");
		if(status === "false"){
			$this.attr("status","true");
			$this.find("span").text("-");
			$("#folder-menu").show(300);
		} else {
			$this.attr("status","false");
			$this.find("span").text("+");
			$("#folder-menu").hide(300);
		}
	});
});

function commonPageList(page,pageno,obj){
	page.html("");
	if(pageno == 1){
		page.append("<li class='disabled'><a href='javascript:void(0);'>上一页</a></li>");
	} else {
		page.append("<li><a href='javascript:jumpPage(\"prev\");'>上一页</a></li>");
	}
	for(var i=1;i<=obj.total;i++){
		if(pageno == i){
			page.append("<li class='active'><a href='javascript:void(0);'>"+i+"</a></li>");
		} else {
			page.append("<li><a href='javascript:jumpPage("+i+");'>"+i+"</a></li>");
		}
	}
	if(pageno == obj.total){
		page.append("<li class='disabled'><a href='javascript:void(0);'>下一页</a></li>");
	} else {
		page.append("<li><a href='javascript:jumpPage(\"next\");'>下一页</a></li>");
	}
}
