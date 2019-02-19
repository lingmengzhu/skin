function getProductsTypeName(){
	var formdata=$('#productsFunctionTitle option:selected').val();
	$.post('findTypeNameByFunction',{formdata : formdata},(data)=>{
		$("#productsTypeName").empty(); 
		$(data).each(function(i){
			$("#productsTypeName").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
		});
	},'json')
}
function getPtn(){
	var formdata=$('#Function option:selected').val();
	$.post('findTypeNameByFunction',{formdata : formdata},(data)=>{
		$("#Type").empty(); 
		$(data).each(function(i){
			$("#Type").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
		});
	},'json')
}