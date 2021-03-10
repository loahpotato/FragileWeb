var productObj;
function deleteProduct(obj){
	$.ajax({
		type:"GET",
		url:path+"/jsp/product.do",
		data:{method:"delproduct",proid:obj.attr("proid")},
		dataType:"json",
		success:function(data){
			if(data.delResult == "true"){
				cancleBtn();
				obj.parents("tr").remove();
			}else if(data.delResult == "false"){
				changeDLGContent("Sorry，Delete product<"+obj.attr("proname")+">failed");
			}else if(data.delResult == "notexist"){
				changeDLGContent("Sorry, product<"+obj.attr("proname")+">not exist");
			}else{
				changeDLGContent("Sorry, product<"+obj.attr("proname")+">has<"+data.delResult+"> orders, cannot be deleted");
			}
		},
		error:function(data){
			changeDLGContent("Sorry, Delete failed.");
		}
	});
}

function openYesOrNoDLG(){
	$('.zhezhao').css('display', 'block');
	$('#removeProv').fadeIn();
}

function cancleBtn(){
	$('.zhezhao').css('display', 'none');
	$('#removeProv').fadeOut();
}
function changeDLGContent(contentStr){
	var p = $(".removeMain").find("p");
	p.html(contentStr);
}
$(function(){
	$(".viewProduct").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/jsp/product.do?method=view&proid="+ obj.attr("proid");
	});
	
	$(".modifyProduct").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/jsp/product.do?method=modify&proid="+ obj.attr("proid");
	});

	$(".modifyPicture").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/jsp/product.do?method=image&proid="+ obj.attr("proid");
	});

	$('#no').click(function () {
		cancleBtn();
	});
	
	$('#yes').click(function () {
		deleteProduct(productObj);
	});

	$(".deleteProduct").on("click",function(){
		productObj = $(this);
		changeDLGContent("Are you sure you really want to delete Product?<"+productObj.attr("proname")+">?");
		openYesOrNoDLG();
	});
});