
var addBtn = null;
var backBtn = null;

$(function(){

	addBtn = $("#add");
	backBtn = $("#back");

	addBtn.bind("click",function(){

			if(confirm("Confirm whether to submit data")){
				$("#pictureForm").submit();
			}
	});
	
	backBtn.on("click",function(){
		if(referer !== undefined && "" !== referer && "null" !== referer
			&& referer.length > 4){
		 window.location.href = referer;
		}else{
			history.back(-1);
		}
	});
});