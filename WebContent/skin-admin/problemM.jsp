<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
	String path = request.getContextPath();
    String url=request.getServletPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/skin-admin/";
	request.setAttribute("path", basePath);
	String dir="/upload/";
	request.setAttribute("dir", dir);
%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>皮肤问题简介管理</title>
    <link rel="stylesheet" href="${path }css/userM.css">
    <link rel="stylesheet" href="${path }css/problemM.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
</head>

<body style="background-color: #e9ecf3;">
<input id="problemId" value="" style="display:none"/>
<button class="btn btn-primary" onclick="updatePblem()" style="position:absolute;top:700px;left:1000px;width:100px;">保存</button>
<div style="margin-top:50px;"><select class="cd-select" id="problemCondition" onchange="getProblemName()" name="problemCondition" style="height: 40px;">
            </select>
            <select class="cd-select" id="problemName" name="problemName" style="height: 40px;margin-left: 10px;">
            </select><button class="btn btn-primary" style="margin-left: 10px;height: 35px;" onclick="searchProblemInfo()">转到</button>
        </div>
        <div style="margin-top: 10px;">
            <img src="" alt="" id="problemImageShow" style="height: 200px;width: 200px;display:block;">
            <input
						id="file1" name="file" type="file" style="display: none;"
					onchange="fileUpload(this)" multiple="multiple" /> <input type="button"
						class="btn btn-primary" onclick="$('#file1').click()" style="margin-top:5px;"
						value="上传" />
                 <input id="problemImage" name="problemImage" type="hidden" />
        </div>
    <div class="promblemM">
        <div class="panel-group" id="accordion" style="margin-top: 5px;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion"
           href="#collapseOne">
          病理原因
        </a>
      </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in">
                    <div class="panel-body">
                       <p id="pathologyReason" contenteditable="true">答：</p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion"
                          href="#collapseTwo">
                         个人原因
                         </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">
                       <p id="personReason" contenteditable="true">答：</p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion"
           href="#collapseThree">
          特征
        </a>
        </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse">
                    <div class="panel-body">
                       <p id="feature" contenteditable="true">答：</p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion"
           href="#collapseFour">
          应对措施
        </a>
        </h4>
                </div>
                <div id="collapseFour" class="panel-collapse collapse">
                    <div class="panel-body">
                       <p id="solutions" contenteditable="true">答：</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    function fileUpload(file){
 	   var files=file.files;
 	   var formdata = new FormData();
 	   for(var i=0; i<files.length;i++){
 		   formdata.append("files",files[i]);
 	   }
 	   $.ajax({
 		   url: "fileUpload", 
 		   processData: false,
 		   contentType: false,
 		   data:formdata,
 		   method:'post',
 		   success:function(data){
 			   $(data).each(function(i){
 			   $("#problemImage").attr("value",data[i]);
 			   $("#problemImageShow").attr("src","/upload/"+data[i]);
 			   })
 		   },
 		   error:function(data){
 			   }
 	   })
 	   
    }
    function getProblemName(){
    	var formdata=$('#problemCondition option:selected').val();
    	$.post('findProblemNameByCondition',{formdata : formdata},(data)=>{
    		$("#problemName").empty(); 
    		$(data).each(function(i){
    			$("#problemName").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
    		});
    	},'json')
    	$("#problemName option").each(function() {
            var val = $(this).val();
            if ($("#problemName option[value='" + val + "']").length > 1 )
                $("#problemName option[value='" + val + "']:gt(0)").remove();
    });
    }
    function searchProblemInfo(){
    	var problemCondition=$('#problemCondition option:selected').val();
    	var problemName=$('#problemName option:selected').val();
    	var msg="findProblemId?problemCondition="+problemCondition+"&problemName="+problemName;
    	$.get(msg,function(data){
    		$("#problemId").val(data);
    	})
    	var url="problemM?problemCondition="+problemCondition+"&problemName="+problemName;
    	$.get(url,function(pBlem){
    		$("#problemImageShow").attr("src","/upload/"+pBlem.problemImage);
    		$("#problemImage").attr("value",pBlem.problemImage);
    		document.getElementById("pathologyReason").innerHTML=pBlem.pathologyReason; 
    		document.getElementById("personReason").innerHTML=pBlem.personReason; 
    		document.getElementById("feature").innerHTML=pBlem.feature; 
    		document.getElementById("solutions").innerHTML=pBlem.solutions; 
    	})
    }
    $(".panel-heading").click(function() {
        $(this).find("a")[0].click();
    });
    window.onload=function(){
    	$.post('findAllCondition',function(data){
    		$(data).each(function(i){
				$("#problemCondition").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
			});
  	        $("#problemCondition option").each(function() {
	            var val = $(this).val();
	            if ($("#problemCondition option[value='" + val + "']").length > 1 )
	                $("#problemCondition option[value='" + val + "']:gt(0)").remove();
	        });
  	        $('#problemCondition').children('option').eq(0).attr("selected", "selected");
  	        var formdata=data[0];
  	       $.post('findProblemNameByCondition',{formdata : formdata},(data)=>{
  		       $("#problemName").empty(); 
  		       $(data).each(function(i){
  		       	$("#problemName").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
  		        });
  	         },'json')
  	       $("#problemName option").each(function() {
             var val = $(this).val();
          if ($("#problemName option[value='" + val + "']").length > 1 )
              $("#problemName option[value='" + val + "']:gt(0)").remove();
           });
  	        $('#problemName').children('option').eq(0).attr("selected", "selected");
    })
    }
   function updatePblem(){
        	var problemId=$("#problemId").val();
        	var problemName=$("#problemName").val();
        	var problemCondition=$("#problemCondition").val();
        	var problemImage=$("#problemImage").val();
        	var pathologyReason=$("#pathologyReason").text();
        	var personReason=$("#personReason").text();
        	var feature=$("#feature").text();
        	var solutions=$("#solutions").text();
        	var data={
        			problemId:problemId,
        			problemName:problemName,
        			problemCondition:problemCondition,
        			problemImage:problemImage,
        			pathologyReason:pathologyReason,
        			personReason:personReason,
        			feature:feature,
        			solutions:solutions
        		}
        	var formdata = JSON.stringify(data);
        	$.post('updatePBlem',{formdata : formdata},function(){
        		toastr.success("保存成功");
        });
   } 

    </script>
</body>

</html>