function editU(userName){
	var formdata = userName;
		$.post('editU',{formdata : formdata},(u)=>{
			$("#updateU input[name=userName]").attr("value",u.userName);
			$("#updateU input[name=password]").attr("value",u.password);
		},'json')
	}
function editP(productsId){
	var formdata = productsId;
		$.post('editP',{formdata : formdata},(p)=>{
			$("#updateP input[name=productsId]").attr("value",p.productsId);
			$("#updateP input[name=productsName]").attr("value",p.productsName);
			$("#productsFunctionContent").val(p.productsFunctionContent);
			$("#updateP input[name=productsImg1]").attr("value",p.productsImg1);
			$("#updateP input[name=productsImg2]").attr("value",p.productsImg2);
			$("#updateP input[name=productsImg3]").attr("value",p.productsImg3);
			$("#updateP input[name=productsImg4]").attr("value",p.productsImg4);
			$("#updateP input[name=productsImg5]").attr("value",p.productsImg5);
			var productsTypeId=p.productsTypeId;
			$.post('findPt',{formdata : productsTypeId},(pt)=>{
			$("#Function").append("<option value='"+pt.productsFunctionTitle+"'>"+pt.productsFunctionTitle+"</option>");
			$("#Type").append("<option value='"+pt.productsTypeName+"'>"+pt.productsTypeName+"</option>");
			$.post('findTypeOne',"",function(data){
	    		$(data).each(function(i,n){
	    			$("#Function").append("<option value='"+n.productsFunctionTitle+"'>"+n.productsFunctionTitle+"</option>");
	    		});
	    		$("#Function option").each(function() {
    	            var val = $(this).val();
    	            if ($("#Function option[value='" + val + "']").length > 1 )
    	                $("#Function option[value='" + val + "']:gt(0)").remove();
    	    });
	    	},'json'); 
			var formdata=pt.productsFunctionTitle;
			$.post('findTypeNameByFunction',{formdata : formdata},(data)=>{
				$(data).each(function(i){
					$("#Type").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
				});
				$("#Type option").each(function() {
    	            var val = $(this).val();
    	            if ($("#Type option[value='" + val + "']").length > 1 )
    	                $("#Type option[value='" + val + "']:gt(0)").remove();
    	    });
				
			},'json');
			},'json');
		},'json')
	}
function editPT(productsTypeId){
	var formdata = productsTypeId;
		$.post('editPT',{formdata : formdata},(pt)=>{
			$("#productsFunctionTitle").empty(); 
			$("#productsTypeName").empty(); 
			$("#editPT input[name=productsTypeId]").attr("value",pt.productsTypeId);
			$("#productsFunctionTitle").append("<option value='"+pt.productsFunctionTitle+"' selected>"+pt.productsFunctionTitle+"</option>");
			$("#productsTypeName").append("<option value='"+pt.productsTypeName+"' selected>"+pt.productsTypeName+"</option>");
			$.post('findTypeOne',"",function(data){
	    		$(data).each(function(i,n){
	    			$("#productsFunctionTitle").append("<option value='"+n.productsFunctionTitle+"'>"+n.productsFunctionTitle+"</option>");
	    		});
	    		$("#productsFunctionTitle option").each(function() {
    	            var val = $(this).val();
    	            if ($("#productsFunctionTitle option[value='" + val + "']").length > 1 )
    	                $("#productsFunctionTitle option[value='" + val + "']:gt(0)").remove();
    	    });
	    	},'json'); 
			var formdata=pt.productsFunctionTitle;
			$.post('findTypeNameByFunction',{formdata : formdata},(data)=>{
				$(data).each(function(i){
					$("#productsTypeName").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
				});
				$("#productsTypeName option").each(function() {
    	            var val = $(this).val();
    	            if ($("#productsTypeName option[value='" + val + "']").length > 1 )
    	                $("#productsTypeName option[value='" + val + "']:gt(0)").remove();
    	    });
				
			},'json');
			
		},'json');
	}
function editT(toolsId){
	var formdata = toolsId;
		$.post('editT',{formdata : formdata},(t)=>{
			$("#editT input[name=toolsId]").attr("value",t.toolsId);
			$("#editT input[name=toolsName]").attr("value",t.toolsName);
			$("#editT input[name=toolsType]").attr("value",t.toolsType);
			$("#useMethod").val(t.useMethod);
			$("#editT input[name=toolsImg]").attr("value",t.toolsImg);
		},'json')
	}
function editTT(toolsTypeId){
	var formdata = toolsTypeId;
		$.post('editTT',{formdata : formdata},(tt)=>{
		},'json')
	}
function editBI(beautyInformationId){
	var formdata = beautyInformationId;
		$.post('editBI',{formdata : formdata},(bInfo)=>{
			$("#editBI input[name=beautyInformationId]").attr("value",bInfo.beautyInformationId);
			$("#editBI input[name=beautyInformationKeyword]").attr("value",bInfo.beautyInformationKeyword);
			$("#editBI input[name=beautyInformationTitle]").attr("value",bInfo.beautyInformationTitle);
			$("#beautyInformationContent").val(bInfo.beautyInformationContent);
			$("#editBI input[name=beautyInformationImage]").attr("value",bInfo.beautyInformationImage);
			$("#beautyInformationSynopsis").val(bInfo.beautyInformationSynopsis);
			$("#editBI input[name=beautyInformationResourse]").attr("value",bInfo.beautyInformationResourse);
			$("#editBI input[name=beautyInformationAuthor]").attr("value",bInfo.beautyInformationAuthor);
			$("#editBI input[name=beautyInformationTime]").attr("value",bInfo.beautyInformationTime);
		},'json')
	}
function editM(managerName){
	var formdata = managerName;
		$.post('editM',{formdata : formdata},(m)=>{
			$("#managerName").attr("value",m.managerName);
			$("#managerPassword").attr("value",m.managerPassword);
		},'json')
	}
function updateM(){
	var managerName = $("#managerName").val();
	var managerPassword = $("#managerPassword").val();
	var currentPage = $("#currentPage").text();                            
	var data = {
			managerName : managerName,
			managerPassword : managerPassword
	};
	var formdata = JSON.stringify(data);
	$.post('updateM',{formdata : formdata},()=>{
		setTimeout(function(){ 
			  location.href="managerMPage?currentPage="+currentPage; 
			  }, 100);
			})
}
function updateU(){
	var userName = $("input[name='userName']").val();
	var password = $("input[name='password']").val();
	var currentPage = $("#currentPage").text();
	var data = {
			userName : userName,
			password : password
	};
	var formdata = JSON.stringify(data);
	
	 $.post('updateU',{formdata : formdata},()=>{
		  setTimeout(function(){ 
			  location.href="userMPage?currentPage="+currentPage; 
			  }, 100);
			})
}
function updateP(){
	var productsFunctionTitle=$("#Function option:selected").val();
	var productsTypeName=$("#Type option:selected").val();
	var url="findProductsTypeId?productsFunctionTitle="+productsFunctionTitle+"&productsTypeName="+productsTypeName;
	$.get(url,(data)=>{
		var productsId = $("input[name='productsId']").val();
		var productsName = $("input[name='productsName']").val();
		var productsImg1 = $("input[name='productsImg1']").val();
		var productsImg2 = $("input[name='productsImg2']").val();
		var productsImg3 = $("input[name='productsImg3']").val();
		var productsImg4 = $("input[name='productsImg4']").val();
		var productsImg5 = $("input[name='productsImg5']").val();
		var productsTypeId = data;
		var productsFunctionContent = $("#productsFunctionContent").val();
		var currentPage = $("#currentPage").text();
		var data = {
				productsId : productsId,
				productsName : productsName,
				productsImg1 : productsImg1,
				productsImg2 : productsImg2,
				productsImg3 : productsImg3,
				productsImg4 : productsImg4,
				productsImg5 : productsImg5,
				productsTypeId : productsTypeId,
				productsFunctionContent : productsFunctionContent,
				
		};
		var formdata = JSON.stringify(data);
		 $.post('updateP',{formdata : formdata},()=>{
			  setTimeout(function(){ 
				  location.href="productsMPage?currentPage="+currentPage; 
				  }, 100);
				})
	});
}
function updatePT(){
	var productsTypeId=$("#editPT input[name=productsTypeId]").val();
	var productsFunctionTitle = $("#productsFunctionTitle option:selected").val();
	var productsTypeName = $("#productsTypeName option:selected").val();
	var currentPage = $("#currentPage").text();
	var data = {
			productsTypeId : productsTypeId,
			productsFunctionTitle : productsFunctionTitle,
			productsTypeName:productsTypeName
	};
	var formdata = JSON.stringify(data);
	$.post('updatePT',{formdata : formdata},()=>{
		  setTimeout(function(){ 
			  location.href="productstypeMPage?currentPage="+currentPage; 
			  }, 100);
			})
}
function updateT(){
	var toolsId=$("#editT input[name=toolsId]").val();
	var toolsType = $("#editT input[name=toolsType]").val();
	var toolsImg = $("#editT input[name=toolsImg]").val();
	var toolsName = $("#editT input[name=toolsName]").val();
	var useMethod = $("#useMethod").val();
	var currentPage = $("#currentPage").text();
	var data = {
			toolsId : toolsId,
			toolsType : toolsType,
			toolsImg : toolsImg,
			toolsName : toolsName,
			useMethod : useMethod
	};
	var formdata = JSON.stringify(data);
	$.post('updateT',{formdata : formdata},()=>{
		  setTimeout(function(){ 
			  location.href="toolsMPage?currentPage="+currentPage; 
			  }, 100);
			})
}
function updateBI(){
	var beautyInformationId=$("#editBI input[name=beautyInformationId]").val();
	var beautyInformationTitle=$("#editBI input[name=beautyInformationTitle]").val();
	var beautyInformationKeyword=$("#editBI input[name=beautyInformationKeyword]").val();
	var beautyInformationImage=$("#editBI input[name=beautyInformationImage]").val();
	var beautyInformationResourse=$("#editBI input[name=beautyInformationResourse]").val();
	var beautyInformationTime=$("#editBI input[name=beautyInformationTime]").val();
	var beautyInformationAuthor=$("#editBI input[name=beautyInformationAuthor]").val();
	var beautyInformationContent = $("#beautyInformationContent").val();
	var beautyInformationSynopsis = $("#beautyInformationSynopsis").val();
	var currentPage = $("#currentPage").text();
	var data = {
			beautyInformationId : beautyInformationId,
			beautyInformationTitle : beautyInformationTitle,
			beautyInformationKeyword : beautyInformationKeyword,
			beautyInformationImage : beautyInformationImage,
			beautyInformationResourse : beautyInformationResourse,
			beautyInformationTime : beautyInformationTime,
			beautyInformationAuthor : beautyInformationAuthor,
			beautyInformationContent : beautyInformationContent,
			beautyInformationSynopsis : beautyInformationSynopsis
	};
	var formdata = JSON.stringify(data);
	$.post('updateBI',{formdata : formdata},()=>{
		  setTimeout(function(){ 
			  location.href="informationMPage?currentPage="+currentPage; 
			  }, 100);
			})
}

function delPT(productsTypeId){
	if (window.confirm("您确定要删除吗？")) {
    	var formdata = productsTypeId;
    	var currentPage=$("span#currentPage").text();
    	var recordTotal=$("span#recordTotal").text();
    	if(recordTotal%8==1&&recordTotal>8){
    		currentPage--;
    	}
    	$.post('delPT',{formdata : formdata},()=>{
  		  setTimeout(function(){ 
  			  location.href="productstypeMPage?currentPage="+currentPage; 
  			  }, 100);
  			})
    }
}
function delP(productsId){
	if (window.confirm("您确定要删除吗？")) {
    	var formdata = productsId;
    	var currentPage=$("span#currentPage").text();
    	var recordTotal=$("span#recordTotal").text();
    	if(recordTotal%6==1&&recordTotal>6){
    		currentPage--;
    	}
    	$.post('delP',{formdata : formdata},()=>{
  		  setTimeout(function(){ 
  			  location.href="productsMPage?currentPage="+currentPage; 
  			  }, 100);
  			})
    }
}
function delU(userName) {
    if (window.confirm("您确定要删除吗？")) {
    	var formdata = userName;
    	var currentPage=$("span#currentPage").text();
    	var recordTotal=$("span#recordTotal").text();
    	if(recordTotal%8==1&&recordTotal>8){
    		currentPage--;
    	}
    	$.post('delU',{formdata : formdata},()=>{
  		  setTimeout(function(){ 
  			  location.href="toolsMPage?currentPage="+currentPage; 
  			  }, 100);
  			})
    }
}
function delT(toolsId) {
	if (window.confirm("您确定要删除吗？")) {
    	var formdata = toolsId;
    	var currentPage=$("span#currentPage").text();
    	var recordTotal=$("span#recordTotal").text();
    	if(recordTotal%6==1&&recordTotal>6){
    		currentPage--;
    	}
    	$.post('delT',{formdata : formdata},()=>{
  		  setTimeout(function(){ 
  			  location.href="toolsMPage?currentPage="+currentPage; 
  			  }, 100);
  			})
    }
}
function delBI(BIId) {
	if (window.confirm("您确定要删除吗？")) {
    	var formdata = BIId;
    	var currentPage=$("span#currentPage").text();
    	var recordTotal=$("span#recordTotal").text();
    	if(recordTotal%6==1&&recordTotal>6){
    		currentPage--;
    	}
    	$.post('delBI',{formdata : formdata},()=>{
  		  setTimeout(function(){ 
  			  location.href="informationMPage?currentPage="+currentPage; 
  			  }, 100);
  			})
    }
}
function delM(managerName) {
	if (window.confirm("您确定要删除吗？")) {
    	var formdata = managerName;
    	var currentPage=$("span#currentPage").text();
    	var recordTotal=$("span#recordTotal").text();
    	if(recordTotal%8==1&&recordTotal>8){
    		currentPage--;
    	}
    	$.post('delM',{formdata : formdata},()=>{
    		location.href="managerMPage?currentPage="+currentPage; 
  			})
    }
}
function searchM(){
	var key=$("input[name=key]").val();
	location.href="managerMPage?key="+key;
}
function searchBI(){
	var key=$("input[name=key]").val();
	location.href="informationMPage?key="+key;
}
function searchT(){
	var key=$("input[name=key]").val();
	location.href="toolsMPage?key="+key;
}
function searchU(){
	var key=$("input[name=key]").val();
	location.href="userMPage?key="+key;
}
function searchP(){
	var key=$("input[name=key]").val();
	location.href="productsMPage?key="+key;
}