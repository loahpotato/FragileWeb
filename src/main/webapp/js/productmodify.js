var proDeveloper = null;
var proPrice = null;
var saveBtn = null;
var backBtn = null;

$(function(){
	proDeveloper  = $("#proDeveloper ");
	proPrice= $("#proPrice");
	saveBtn = $("#save");
	backBtn = $("#back");
	proDeveloper .next().html("*");
	proPrice.next().html("*");
	proDeveloper .on("focus",function(){
		validateTip(proDeveloper .next(),{"color":"#666666"},"* Please input Developer ",false);
	}).on("blur",function(){
		if(proDeveloper .val() != null && proDeveloper .val() != ""){
			validateTip(proDeveloper .next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(proDeveloper .next(),{"color":"red"},imgNo+" Developer cannot be Null, please retype",false);
		}
		
	});

	proPrice.on("focus",function(){
		validateTip(proPrice.next(),{"color":"#666666"},"* Please input price",false);
		if(proPrice .val() != null && proPrice .val() != ""){
			validateTip(proPrice .next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(proPrice .next(),{"color":"red"},imgNo+" Price cannot be Null, please retype",false);
		}
	});
	
	saveBtn.on("click",function(){
		/*if(proDeveloper.attr("validateStatus") != "true"){
			proDeveloper.blur();
		}else if(proPrice.attr("validateStatus") != "true"){
			proPrice.blur();
		}else{*/
			if(confirm("Confirm whether to submit data")){
				$("#productForm").submit();
			}
		//}
	});
	
	backBtn.on("click",function(){
		//alert("modify: "+referer);
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