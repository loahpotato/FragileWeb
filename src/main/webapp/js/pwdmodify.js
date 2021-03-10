var oldpassword = null;
var newpassword = null;
var rnewpassword = null;
var saveBtn = null;

$(function(){
	oldpassword = $("#oldpassword");
	newpassword = $("#newpassword");
	rnewpassword = $("#rnewpassword");
	saveBtn = $("#save");
	
	oldpassword.next().html("*");
	newpassword.next().html("*");
	rnewpassword.next().html("*");
	
	oldpassword.on("blur",function(){
		$.ajax({
			type:"GET",
			url:path+"/jsp/user.do",
			data:{method:"pwdmodify",oldpassword:oldpassword.val()},
			dataType:"json",
			success:function(data){
				if(data.result == "true"){
					validateTip(oldpassword.next(),{"color":"green"},imgYes,true);
				}else if(data.result == "false"){
					validateTip(oldpassword.next(),{"color":"red"},imgNo + " The original password was entered incorrectly",false);
				}else if(data.result == "sessionerror"){
					validateTip(oldpassword.next(),{"color":"red"},imgNo + " Login information expired, please login again",false);
				}else if(data.result == "error"){
					validateTip(oldpassword.next(),{"color":"red"},imgNo + " Please input original password",false);
				}
			},
			error:function(data){
				validateTip(oldpassword.next(),{"color":"red"},imgNo + " Request failed.",false);
			}
		});
		
		
	}).on("focus",function(){
		validateTip(oldpassword.next(),{"color":"#666666"},"* Please input original password",false);
	});
	
	newpassword.on("focus",function(){
		validateTip(newpassword.next(),{"color":"#666666"},"* Password must be between 6 digits and 16 digits",false);
	}).on("blur",function(){
		if(newpassword.val() != null && newpassword.val().length > 5
				&& newpassword.val().length < 17 ){
			validateTip(newpassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(newpassword.next(),{"color":"red"},imgNo + " Password input doesn't meet the specification, please retype",false);
		}
	});
	
	
	rnewpassword.on("focus",function(){
		validateTip(rnewpassword.next(),{"color":"#666666"},"* Please enter the same password as above",false);
	}).on("blur",function(){
		if(rnewpassword.val() != null && rnewpassword.val().length > 5
				&& rnewpassword.val().length < 17 && newpassword.val() == rnewpassword.val()){
			validateTip(rnewpassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(rnewpassword.next(),{"color":"red"},imgNo + " The two passwords are inconsistent. Please retype",false);
		}
	});

	saveBtn.on("click",function(){
		oldpassword.blur();
		newpassword.blur();
		rnewpassword.blur();
		if(oldpassword.attr("validateStatus") == "true" 
			&& newpassword.attr("validateStatus") == "true"
			&& rnewpassword.attr("validateStatus") == "true"){
			if(confirm("Are you sure you really want to change your password?")){
				$("#userForm").submit();
			}
		}
		
	});
});