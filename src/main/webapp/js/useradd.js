var userCode = null;
var userName = null;
var userPassword = null;
var ruserPassword = null;
var phone = null;
var birthday = null;
var userRole = null;
var addBtn = null;
var backBtn = null;


$(function(){
	userCode = $("#userCode");
	userName = $("#userName");
	userPassword = $("#userPassword");
	ruserPassword = $("#ruserPassword");
	phone = $("#phone");
	birthday = $("#birthday");
	userRole = $("#userRole");
	addBtn = $("#add");
	backBtn = $("#back");
	userCode.next().html("*");
	userName.next().html("*");
	userPassword.next().html("*");
	ruserPassword.next().html("*");
	phone.next().html("*");
	birthday.next().html("*");
	userRole.next().html("*");
	
	$.ajax({
		type:"GET",
		url:path+"/jsp/user.do",
		data:{method:"getrolelist"},
		dataType:"json",
		success:function(data){
			if(data != null){
				userRole.html("");
				var options = "<option value=\"0\">Please Choose</option>";
				for(var i = 0; i < data.length; i++){
					//alert(data[i].id);
					//alert(data[i].roleName);
					options += "<option value=\""+data[i].id+"\">"+data[i].roleName+"</option>";
				}
				userRole.html(options);
			}
		},
		error:function(data){
			validateTip(userRole.next(),{"color":"red"},imgNo+" Get UserRole list error",false);
		}
	});

	userCode.bind("blur",function(){
		$.ajax({
			type:"GET",
			url:path+"/jsp/user.do",
			data:{method:"ucexist",userCode:userCode.val()},
			dataType:"json",
			success:function(data){
				if(data.userCode == "exist"){
					validateTip(userCode.next(),{"color":"red"},imgNo+ " The user account already exists",false);
				}else{
					validateTip(userCode.next(),{"color":"green"},imgYes+" Available",true);
				}
			},
			error:function(data){
				validateTip(userCode.next(),{"color":"red"},imgNo+" The page you visit does not exists",false);
			}
		});
		
		
	}).bind("focus",function(){
		validateTip(userCode.next(),{"color":"#666666"},"* You can use account to login the system",false);
	}).focus();
	
	userName.bind("focus",function(){
		validateTip(userName.next(),{"color":"#666666"},"* The UserName must be a character greater than 1 and less than 10",false);
	}).bind("blur",function(){
		if(userName.val() != null && userName.val().length > 1
				&& userName.val().length < 10){
			validateTip(userName.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userName.next(),{"color":"red"},imgNo+" The UserName input does not conform to the specification, please retype",false);
		}
		
	});
	
	userPassword.bind("focus",function(){
		validateTip(userPassword.next(),{"color":"#666666"},"* Password must be between 6 digits and 16 digits",false);
	}).bind("blur",function(){
		if(userPassword.val() != null && userPassword.val().length > 5
				&& userPassword.val().length < 17 ){
			validateTip(userPassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userPassword.next(),{"color":"red"},imgNo + " Password input doesn't meet the specification, please retype",false);
		}
	});
	
	ruserPassword.bind("focus",function(){
		validateTip(ruserPassword.next(),{"color":"#666666"},"* Please enter the same password as above",false);
	}).bind("blur",function(){
		if(ruserPassword.val() != null && ruserPassword.val().length > 5
				&& ruserPassword.val().length < 17 && userPassword.val() == ruserPassword.val()){
			validateTip(ruserPassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(ruserPassword.next(),{"color":"red"},imgNo + " The two passwords are inconsistent. Please retype",false);
		}
	});
	
	
	birthday.bind("focus",function(){
		validateTip(birthday.next(),{"color":"#666666"},"* Click the input box to select the date",false);
	}).bind("blur",function(){
		if(birthday.val() != null && birthday.val() != ""){
			validateTip(birthday.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(birthday.next(),{"color":"red"},imgNo + " The selected date is incorrect, please re-enter",false);
		}
	});
	
	phone.bind("focus",function(){
		validateTip(phone.next(),{"color":"#666666"},"* Please input PhoneNumber",false);
	}).bind("blur",function(){
		if(phone.val()!= null && phone.val() != ""){
			validateTip(phone.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(phone.next(),{"color":"red"},imgNo + " PhoneNumber cannot be null",false);
		}
	});
	
	userRole.bind("focus",function(){
		validateTip(userRole.next(),{"color":"#666666"},"* Please select UserRole",false);
	}).bind("blur",function(){
		if(userRole.val() != null && userRole.val() > 0){
			validateTip(userRole.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(userRole.next(),{"color":"red"},imgNo + " Please reselect UserRole",false);
		}
	});
	
	addBtn.bind("click",function(){
		if(userCode.attr("validateStatus") != "true"){
			userCode.blur();
		}else if(userName.attr("validateStatus") != "true"){
			userName.blur();
		}else if(userPassword.attr("validateStatus") != "true"){
			userPassword.blur();
		}else if(ruserPassword.attr("validateStatus") != "true"){
			ruserPassword.blur();
		}else if(birthday.attr("validateStatus") != "true"){
			birthday.blur();
		}else if(phone.attr("validateStatus") != "true"){
			phone.blur();
		}else if(userRole.attr("validateStatus") != "true"){
			userRole.blur();
		}else{
			if(confirm("Submit?")){
				$("#userForm").submit();
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