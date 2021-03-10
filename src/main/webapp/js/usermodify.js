var userName = null;
var birthday = null;
var phone = null;
var userRole = null;
var saveBtn = null;
var backBtn = null;

$(function(){
	userName = $("#userName");
	birthday = $("#birthday");
	phone = $("#phone");
	userRole = $("#userRole");
	saveBtn = $("#save");
	backBtn = $("#back");
	
	userName.next().html("*");
	birthday.next().html("*");
	phone.next().html("*");
	userRole.next().html("*");
	
	
	$.ajax({
		type:"GET",
		url:path+"/jsp/user.do",
		data:{method:"getrolelist"},
		dataType:"json",
		success:function(data){
			if(data != null){
				var rid = $("#rid").val();
				userRole.html("");
				var options = "<option value=\"0\">Please choose</option>";
				for(var i = 0; i < data.length; i++){
					//alert(data[i].id);
					//alert(data[i].roleName);
					if(rid != null && rid != undefined && data[i].id == rid ){
						options += "<option selected=\"selected\" value=\""+data[i].id+"\" >"+data[i].roleName+"</option>";
					}else{
						options += "<option value=\""+data[i].id+"\" >"+data[i].roleName+"</option>";
					}
					
				}
				userRole.html(options);
			}
		},
		error:function(data){
			validateTip(userRole.next(),{"color":"red"},imgNo+" Get UserRole list error",false);
		}
	});
	
	
	userName.on("focus",function(){
		validateTip(userName.next(),{"color":"#666666"},"* The UserName must be a character greater than 1 and less than 15",false);
	}).on("blur",function(){
		if(userName.val() != null && userName.val().length > 1 
				&& userName.val().length < 15){
			validateTip(userName.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userName.next(),{"color":"red"},imgNo+" The UserName input does not conform to the specification, please retype",false);
		}
		
	});
	
	birthday.on("focus",function(){
		validateTip(birthday.next(),{"color":"#666666"},"* Click the input box to select the date",false);
	}).on("blur",function(){
		if(birthday.val() != null && birthday.val() != ""){
			validateTip(birthday.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(birthday.next(),{"color":"red"},imgNo + " The selected date is incorrect, please re-enter",false);
		}
	});
	
	phone.on("focus",function(){
		validateTip(phone.next(),{"color":"#666666"},"* Please input PhoneNumber",false);
	}).on("blur",function(){
		var patrn=/^([0-9])\d{10}$/;
		if(phone.val().match(patrn)){
			validateTip(phone.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(phone.next(),{"color":"red"},imgNo + " PhoneNumber must be 11 digits",false);
		}
	});
	
	userRole.on("focus",function(){
		validateTip(userRole.next(),{"color":"#666666"},"* Please select UserRole",false);
	}).on("blur",function(){
		if(userRole.val() != null && userRole.val() > 0){
			validateTip(userRole.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userRole.next(),{"color":"red"},imgNo+" Please reselect UserRole",false);
		}
		
	});
	
	saveBtn.on("click",function(){
		userName.blur();
		phone.blur();
		birthday.blur();
		userRole.blur();
		if(userName.attr("validateStatus") == "true" 
			&& phone.attr("validateStatus") == "true"
			&& birthday.attr("validateStatus") == "true"
			&& userRole.attr("validateStatus") == "true"){
			if(confirm("Submit?")){
				$("#userForm").submit();
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