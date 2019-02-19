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
    <title>产品管理</title>
    <link rel="stylesheet" href="${path }css/userM.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="${path }js/public.js"></script>
    <script src="${path }js/products.js"></script>
    <script src="${path }js/type.js"></script>
</head>

<body>
    <div class="userM">
        <div class="content">
            <div class="content-head"><span>产品管理</span></div>
            <div class="content-center">
                <div class="search"><input type="text" name="key"><button class="btn btn-info" onclick="searchP()">搜索</button><button class="btn btn-info" data-toggle="modal" data-target="#addproduct" onclick="showselect()">新增产品</button></div>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>产品编号</th>
                            <th>产品名</th>
                            <th>图1</th>
                            <th>图2</th>
                            <th>图3</th>
                            <th>图4</th>
                            <th>图5</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                         <s:iterator value="pb.content" id="p">
                          <tr>
                            <td><s:property value="#p.productsId" /></td>
                            <td><s:property value="#p.productsName" /></td>
                            <td><img alt="" src="${dir }<s:property value="#p.productsImg1" />" style="width:50px;"></td>
                            <td><img alt="" src="${dir }<s:property value="#p.productsImg2" />" style="width:50px;"></td>
                            <td><img alt="" src="${dir }<s:property value="#p.productsImg3" />" style="width:50px;"></td>
                            <td><img alt="" src="${dir }<s:property value="#p.productsImg4" />" style="width:50px;"></td>
                            <td><img alt="" src="${dir }<s:property value="#p.productsImg5" />" style="width:50px;"></td>
						    <td><button data-toggle="modal" data-target="#edit" onclick="editP(<s:property value="#p.productsId" />)">编辑</button><span>|</span><button onclick="delP(<s:property value="#p.productsId" />)">删除</button></td>
                        </tr>
                          </s:iterator>
                        <tr>
                            <td colspan="8" align="center">
                            <div>
                                                                                                               第<span id="currentPage">${pb.currentPage }</span>页
													    &nbsp;&nbsp; 
														共${pb.pageTotal }页
														 &nbsp;&nbsp; 
														共<span id="recordTotal">${pb.recordTotal }</span>条信息
														<div>
														<s:if test="#request.pb.currentPage==1"> 首页&nbsp;&nbsp;上一页 </s:if>
														<s:else>
															<a href='javascript:void(0)' onclick="sk(1)">首页</a>
															<a href='javascript:void(0)' onclick="sk(<s:property value="#request.pb.currentPage - 1"/>)">上一页</a>
														</s:else>
														<s:if test="#request.pb.currentPage != #request.pb.pageTotal">
															<a href='javascript:void(0)' onclick="sk(<s:property value="#request.pb.currentPage + 1"/>)">下一页</a>
															<a href='javascript:void(0)' onclick="sk(<s:property value="#request.pb.pageTotal"/>)">尾页</a>
														</s:if>
														<s:else>下一页&nbsp;&nbsp;尾页</s:else>&nbsp;&nbsp; 
														跳转至 <input class="small" type="text" name="currentPage"/>页 <a href='javascript:void(0)' onclick="go()">跳转</a>
														</div>
											</div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">编辑产品</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <form action="" id="updateP" enctype="multipart/form-data" method="post">
                                    <div class="input-group ">
                                        <span class="input-group-addon">产品名</span>
                                        <input type="hidden" class="form-control" name="productsId">
                                        <input type="hidden" class="form-control" name="productsTypeId">
                                        <input type="text" class="form-control" name="productsName">
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">功能</span>
                                        <select id="Function" name="productsFunctionTitle" onChange="getPtn()" class="cd-select">
                                        </select>
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">类型</span>
                                        <select id="Type" name="productsTypeName" class="cd-select">
                                        </select>
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">产品简介</span>
                                        <textarea id="productsFunctionContent" name="productsFunctionContent" style="width:293px;height: 100px;border: 1px solid #ced4da;"></textarea>
                                    </div>
                                    <span class="" style="height: 30px;">图片:</span> <input
										id="file1" name="file" type="file" style="display: none;"
										onchange="fileUpload(this,'editproductsImg')" multiple="multiple" /> <input type="button"
										class="btn btn-primary" onclick="$('#file1').click()"
										value="上传" />
                                        <input id="editproductsImg0" name="productsImg1" type="hidden" />
                                        <input id="editproductsImg1" name="productsImg2" type="hidden" />
                                        <input id="editproductsImg2" name="productsImg3" type="hidden" />
                                        <input id="editproductsImg3" name="productsImg4" type="hidden" />
                                        <input id="editproductsImg4" name="productsImg5" type="hidden" />
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="updateP()">提交更改</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
            <div class="modal fade" id="addproduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">新增产品</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <form action="addP" id="addP" enctype="multipart/form-data" method="post">
                                     <div class="input-group ">
                                        <span class="input-group-addon">产品名</span>
                                        <input type="text" class="form-control" name="p.productsName">
                                        <input type="text" id="productsTypeId" name="p.productsTypeId" style="display:none">
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">功能</span>
                                        <select id="productsFunctionTitle" onChange="getProductsTypeName()" class="cd-select">
                                        </select>
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">类型</span>
                                        <select id="productsTypeName" class="cd-select">
                                        </select>
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">产品简介:</span>
                                        <textarea name="p.productsFunctionContent" style="width:293px;height: 100px;border: 1px solid #ced4da;"></textarea>
                                    </div>
										 <span class="" style="height: 30px;">图片:</span> <input
										id="addfile1" name="file" type="file" style="display: none;"
										onchange="fileUpload(this,'addproductsImg')" multiple="multiple" /> <input type="button"
										class="btn btn-primary" onclick="$('#addfile1').click()"
										value="上传" />
                                        <input id="addproductsImg0" name="p.productsImg1" type="hidden" />
                                        <input id="addproductsImg1" name="p.productsImg2" type="hidden" />
                                        <input id="addproductsImg2" name="p.productsImg3" type="hidden" />
                                        <input id="addproductsImg3" name="p.productsImg4" type="hidden" />
                                        <input id="addproductsImg4" name="p.productsImg5" type="hidden" />
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="addP()">提交更改</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
        </div>
    </div>
<script type="text/javascript">
function fileUpload(file,str){
	   console.log(str);
	   console.log(file);
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
			   $("#"+str+i).attr("value",data[i]);
			   })
		   },
		   error:function(data){
			   }
	   })
	   
}
    function showselect(){
    	$.post('findTypeOne',"",function(data){
    		$("#productsFunctionTitle").empty();
    		$(data).each(function(i,n){
    		   $("#productsFunctionTitle").append("<option value='"+n.productsFunctionTitle+"'>"+n.productsFunctionTitle+"</option>");
    		});
    		$("#productsFunctionTitle option").each(function() {
    	            var val = $(this).val();
    	            if ($("#productsFunctionTitle option[value='" + val + "']").length > 1 )
    	                $("#productsFunctionTitle option[value='" + val + "']:gt(0)").remove();
    	    });
    		var formdata=$("#productsFunctionTitle option:selected").val();
			$.post('findTypeNameByFunction',{formdata : formdata},(data)=>{
				$(data).each(function(i){
					$("#productsTypeName").append("<option value='"+data[i]+"'>"+data[i]+"</option>");
				});
				$("#productsTypeName option").each(function() {
    	            var val = $(this).val();
    	            if ($("#productsTypeName option[value='" + val + "']").length > 1 )
    	                $("#productsTypeName option[value='" + val + "']:gt(0)").remove();
    	    });
				
			},'json')
    	},'json'); 
    }
	function sk(currentPage){
    	location.href="productsMPage?currentPage="+currentPage;
    }
	function go(){
		var currentPage=$("input[name=currentPage]").val();
		location.href="productsMPage?currentPage="+currentPage;
	}
    </script>
</body>
</html>