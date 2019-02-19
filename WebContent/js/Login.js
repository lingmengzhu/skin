function Mlogincheck() {
	var managerName = $("input[name='managerName']").val();
	var managerPassword = $("input[name='managerPassword']").val();
	var data = {
		managerName : managerName,
		managerPassword : managerPassword
	};
	var formdata = JSON.stringify(data);
	$.post('MLogin',{formdata : formdata},(m)=>{
		if(m.managerName=="1"){
			location.href="/skin/skin-admin/index.jsp";
		}else{
			alert("error");
		}
		
	},'json')
}
function loginU() {
	var userName = $("input[name='userName']").val();
	var password = $("input[name='password']").val();
	var data = {
			userName : userName,
			password : password
	};
	var formdata = JSON.stringify(data);
	$.post('loginU',{formdata : formdata},(u)=>{
		if(u.userName=="1"){
			alert("success");
		}else{
			alert("error");
		}
		
	},'json')
}
function addU(){
	var userName = $("input[name=userName]").val();
	var password = $("input[name=password]").val();
	var data = {
			userName : userName,
			password : password
	};
	var formdata = JSON.stringify(data);
	$.post('addU',{formdata : formdata},(u)=>{
		if(u.userName=="1"){
			alert("success");
		}else{
			alert("error");
		}
		
	},'json')
}