var proCode = null;
var proName = null;
var proDeveloper = null;
var proPrice = null;
var addBtn = null;
var backBtn = null;

$(function(){
	proCode = $("#proCode");
	proName = $("#proName");
	proDeveloper = $("#proDeveloper");
	proPrice = $("#proPrice");
	addBtn = $("#add");
	backBtn = $("#back");
	proCode.next().html("*");
	proName.next().html("*");
	proDeveloper.next().html("*");
	proPrice.next().html("*");

	proCode.on("blur",function(){
		if(proCode.val() != null && proCode.val() != ""){
			validateTip(proCode.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(proCode.next(),{"color":"red"},imgNo+"ProductCode cannot be Null, please retype",false);
		}
	}).on("focus",function(){
		validateTip(proCode.next(),{"color":"#666666"},"* Please input productCode",false);
	}).focus();
	
	proName.on("focus",function(){
		validateTip(proName.next(),{"color":"#666666"},"* Please input product name",false);
	}).on("blur",function(){
		if(proName.val() != null && proName.val() != ""){
			validateTip(proName.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(proName.next(),{"color":"red"},imgNo+"ProductName cannot be Null, please retype",false);
		}
		
	});
	
	proDeveloper.on("focus",function(){
		validateTip(proDeveloper.next(),{"color":"#666666"},"* Please input Developer",false);
	}).on("blur",function(){
		if(proDeveloper.val() != null && proDeveloper.val() != ""){
			validateTip(proDeveloper.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(proDeveloper.next(),{"color":"red"},imgNo+"Developer cannot be Null, please retype",false);
		}
		
	});
	
	proPrice.on("focus",function(){
		validateTip(proPrice.next(),{"color":"#666666"},"* Please input Price",false);
	}).on("blur",function(){
		if(proPrice.val() != null && proPrice.val() != ""){
			validateTip(proPrice.next(),{"color":"green"},imgYes,true);}
		else{
			validateTip(proPrice.next(),{"color":"red"},imgNo+"Price cannot be Null, please retype",false);
		}
		});
	
	addBtn.bind("click",function(){
		if(proCode.attr("validateStatus") != "true"){
			proCode.blur();
		}else if(proName.attr("validateStatus") != "true"){
			proName.blur();
		}else if(proDeveloper.attr("validateStatus") != "true"){
			proDeveloper.blur();
		}else if(proPrice.attr("validateStatus") != "true"){
			proPrice.blur();
		}else{
			if(confirm("Confirm whether to submit data")){
				$("#productForm").submit();
			}
		}
	});
	
	backBtn.on("click",function(){
		if(referer != undefined 
			&& null != referer 
			&& "" != referer
			&& "null" != referer
			&& referer.length > 4){
		 window.location.href = referer;
		}else{
			history.back(-1);
		}
	});
});