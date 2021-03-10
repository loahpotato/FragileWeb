var billCode = null;
var productName = null;
var productUnit = null;
var productCount = null;
var totalPrice = null;
var providerId = null;
var saveBtn = null;
var backBtn = null;

function priceReg (value){
	value = value.replace(/[^\d.]/g,"");
		value = value.replace(/^\./g,"");
    value = value.replace(/\.{2,}/g,".");
    value = value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
	if(value.indexOf(".")>0){
		value = value.substring(0,value.indexOf(".")+3);
	}
	return value;
}


$(function(){
	billCode = $("#billCode");
	productName = $("#productName");
	productUnit = $("#productUnit");
	productCount = $("#productCount");
	totalPrice = $("#totalPrice");
	providerId = $("#providerId");
	addBtn = $("#save");
	backBtn = $("#back");

	billCode.next().html("*");
	productName.next().html("*");
	productUnit.next().html("*");
	productCount.next().html("*");
	totalPrice.next().html("*");
	providerId.next().html("*");
	
	$.ajax({
		type:"GET",
		url:path+"/jsp/bill.do",
		data:{method:"getproviderlist"},
		dataType:"json",
		success:function(data){
			if(data != null){
				var pid = $("#pid").val();
				$("select").html("");
				var options = "<option value=\"0\">Please Choose</option>";
				for(var i = 0; i < data.length; i++){
					if(pid != null && pid != undefined && data[i].id == pid ){
						options += "<option selected=\"selected\" value=\""+data[i].id+"\" >"+data[i].proName+"</option>";
					}else{
						options += "<option value=\""+data[i].id+"\" >"+data[i].proName+"</option>";
					}
					
				}
				$("select").html(options);
			}
		},
		error:function(data){
			validateTip(providerId.next(),{"color":"red"},imgNo+" Get Developer list error",false);
		}
	});
	
	productName.on("focus",function(){
		validateTip(productName.next(),{"color":"#666666"},"* Please input ProductName",false);
	}).on("blur",function(){
		if(productName.val() != null && productName.val() != ""){
			validateTip(productName.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(productName.next(),{"color":"red"},imgNo+" ProductName cannot be Null, please retype",false);
		}
		
	});
	
	productUnit.on("focus",function(){
		validateTip(productUnit.next(),{"color":"#666666"},"* Please input CurrencyCode of Product",false);
	}).on("blur",function(){
		if(productUnit.val() != null && productUnit.val() != ""){
			validateTip(productUnit.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(productUnit.next(),{"color":"red"},imgNo+" CurrencyCode cannot be Null, please retype",false);
		}
		
	});
	
	providerId.on("focus",function(){
		validateTip(providerId.next(),{"color":"#666666"},"* Please Choose Developer",false);
	}).on("blur",function(){
		if(providerId.val() != null && providerId.val() != "" && providerId.val() != 0){
			validateTip(providerId.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(providerId.next(),{"color":"red"},imgNo+" Developer cannot be Null, please choose",false);
		}
		
	});
	
	productCount.on("focus",function(){
		validateTip(productCount.next(),{"color":"#666666"},"* Please enter a positive natural number greater than 0 with 2 decimal places left behind, such as 1.00",false);
	}).on("keyup",function(){
		this.value = priceReg(this.value);
	}).on("blur",function(){
		this.value = priceReg(this.value);
	});
	
	totalPrice.on("focus",function(){
		validateTip(totalPrice.next(),{"color":"#666666"},"* Please enter a positive natural number greater than 0 with 2 decimal places left behind, such as 1.00",false);
	}).on("keyup",function(){
		this.value = priceReg(this.value);
	}).on("blur",function(){
		this.value = priceReg(this.value);
	});
	
	addBtn.on("click",function(){
		productName.blur();
		productUnit.blur();
		providerId.blur();
		if(productName.attr("validateStatus") == "true" 
			&& productUnit.attr("validateStatus") == "true" 
			&& providerId.attr("validateStatus") == "true"){
			if(confirm("Confirm whether to submit data")){
				$("#billForm").submit();
			}
		}
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