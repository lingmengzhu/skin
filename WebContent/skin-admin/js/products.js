function getProductsTypeName(){
	var formdata=$('#productsFunctionTitle option:selected').val();
	$.post('findTypeNameByFunction',{formdata : formdata},(data)=>{
		$("#productsTypeName").empty(); 
		$(data).each(function(i){
			$("#productsTypeName").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
		});
	},'json')
}
function addP(){
	var productsFunctionTitle=$("#productsFunctionTitle option:selected").val();
	var productsTypeName=$("#productsTypeName option:selected").val();
	var url="findProductsTypeId?productsFunctionTitle="+productsFunctionTitle+"&productsTypeName="+productsTypeName;
	$.get(url,(data)=>{
		$("#productsTypeId").attr("value",data);
		$("#addP").submit();
	});
}
