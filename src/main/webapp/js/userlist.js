var userObj;

function deleteUser(obj){
	$.ajax({
		type:"GET",
		url:path+"/jsp/user.do",
		data:{method:"deluser",uid:obj.attr("userid")},
		dataType:"json",
		success:function(data){
			if(data.delResult == "true"){
				cancleBtn();
				obj.parents("tr").remove();
			}else if(data.delResult == "false"){
				changeDLGContent("Sorry, delete User<"+obj.attr("username")+">failed.");
			}else if(data.delResult == "notexist"){
				changeDLGContent("Sorry, User<"+obj.attr("username")+">not exist");
			}
		},
		error:function(data){
			changeDLGContent("Sorry, delete failed.");
		}
	});
}

function openYesOrNoDLG(){
	$('.zhezhao').css('display', 'block');
	$('#removeUse').fadeIn();
}

function cancleBtn(){
	$('.zhezhao').css('display', 'none');
	$('#removeUse').fadeOut();
}
function changeDLGContent(contentStr){
	var p = $(".removeMain").find("p");
	p.html(contentStr);
}

$(function(){
	$(".viewUser").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/jsp/user.do?method=view&uid="+ obj.attr("userid");
	});
	
	$(".modifyUser").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/jsp/user.do?method=modify&uid="+ obj.attr("userid");
	});

	$('#no').click(function () {
		cancleBtn();
	});
	
	$('#yes').click(function () {
		deleteUser(userObj);
	});

	$(".deleteUser").on("click",function(){
		userObj = $(this);
		changeDLGContent("Are you sure you really want to delete<"+userObj.attr("username")+">?");
		openYesOrNoDLG();
	});
});