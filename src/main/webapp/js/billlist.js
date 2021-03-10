var billObj;


function deleteBill(obj){
	$.ajax({
		type:"GET",
		url:path+"/jsp/bill.do",
		data:{method:"delbill",billid:obj.attr("billid")},
		dataType:"json",
		success:function(data){
			if(data.delResult == "true"){
				cancleBtn();
				obj.parents("tr").remove();
			}else if(data.delResult == "false"){
				changeDLGContent("Sorry，Delete Order<"+obj.attr("billcc")+">failed");
			}else if(data.delResult == "notexist"){
				changeDLGContent("Sorry, Order<"+obj.attr("billcc")+">not exist");
			}
		},
		error:function(data){
			alert("Sorry, Delete failed.");
		}
	});
}

function openYesOrNoDLG(){
	$('.zhezhao').css('display', 'block');
	$('#removeBi').fadeIn();
}

function cancleBtn(){
	$('.zhezhao').css('display', 'none');
	$('#removeBi').fadeOut();
}
function changeDLGContent(contentStr){
	var p = $(".removeMain").find("p");
	p.html(contentStr);
}

$(function(){
	$(".viewBill").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/jsp/bill.do?method=view&billid="+ obj.attr("billid");
	});
	
	$(".modifyBill").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/jsp/bill.do?method=modify&billid="+ obj.attr("billid");
	});
	$('#no').click(function () {
		cancleBtn();
	});
	
	$('#yes').click(function () {
		deleteBill(billObj);
	});

	$(".deleteBill").on("click",function(){
		billObj = $(this);
		changeDLGContent("Are you sure you really want to delete Order<"+billObj.attr("billcc")+">?");
		openYesOrNoDLG();
	});
});