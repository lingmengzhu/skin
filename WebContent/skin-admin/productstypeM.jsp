<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
    String url=request.getServletPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	     + path + "/skin-admin/";
	request.setAttribute("path", basePath);
%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>产品类别管理</title>
    <link rel="stylesheet" href="${path }css/userM.css">
    <link rel="stylesheet" type="text/css" href="${path }css/type.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script src="${path }js/public.js"></script>
    <script src="${path }js/type.js"></script>
</head>

<body>
    <div class="userM">
        <div class="content">
            <div class="content-head"><span>产品类别管理</span></div>
            <div class="content-center">
                <div class="search"><button class="btn btn-info" data-toggle="modal" data-target="#add-one">新增一级分类</button><button class="btn btn-info" data-toggle="modal" data-target="#add-two" onclick="showselect()">新增二级分类</button></div>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>产品id</th>
                            <th>功能</th>
                            <th>类型</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                     <s:iterator value="pb.content" id="pt">
                        <tr>
                            <td><s:property value="#pt.productsTypeId" /></td>
                            <td><s:property value="#pt.productsFunctionTitle" /></td>
						    <td><s:property value="#pt.productsTypeName" /></td>
						    <td><button data-toggle="modal" data-target="#edit" onclick="editPT(<s:property value="#pt.productsTypeId" />)">编辑</button><span>|</span><button onclick="delPT(<s:property value="#pt.productsTypeId" />)">删除</button></td>
                        </tr>
                       </s:iterator>
                        <tr>
                            <td colspan="4" align="center">
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
                            <h4 class="modal-title" id="myModalLabel">编辑分类信息</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <form action="" id="editPT">
                                    <input type="text" style="display:none;" name="productsTypeId">
                                     <div class="input-group ">
                                        <span class="input-group-addon">功能</span>
                                        <select id="productsFunctionTitle" onChange="getProductsTypeName()" name="productsFunctionTitle" class="cd-select">
                                        </select>
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">类别</span>
                                        <select id="productsTypeName" name="productsTypeName" class="cd-select">
                                        </select>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="updatePT()">提交更改</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
            <div class="modal fade" id="add-one" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">新增功能</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <form action="addPT" id="addPTOne">
                                    <div class="input-group ">
                                        <span class="input-group-addon">功能</span>
                                        <input type="text" class="form-control" name="pt.productsFunctionTitle">
                                        <input type="text" class="form-control" name="pt.productsTypeName" value="" style="display:none;">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="$('#addPTOne').submit();">提交更改</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
            <div class="modal fade" id="add-two" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">新增类型</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <form action="addPT" id="addPTTwo">
                                    <div class="input-group ">
                                        <span class="input-group-addon">功能</span>
                                        <select id="showselect" name="pt.productsFunctionTitle" class="cd-select">
                                            <option value="-1" selected>请选择</option>
                                        </select>
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">类别</span>
                                        <input type="text" class="form-control" name="pt.productsTypeName">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="$('#addPTTwo').submit();">提交更改</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
   </div>
   </div>
    <script type="text/javascript">
    function sk(currentPage){
    	location.href="productstypeMPage?currentPage="+currentPage;
    }
    function go(){
    	var currentPage=$("input[name=currentPage]").val();
    	location.href="productstypeMPage?currentPage="+currentPage;
    }
    function showselect(){
    	$.post('findTypeOne',"",function(data){
    		$("#showselect").empty();
    		$(data).each(function(i,n){
    		   $("#showselect").append("<option value='"+n.productsFunctionTitle+"'>"+n.productsFunctionTitle+"</option>");
    		});
    		$("#showselect option").each(function() {
    	            var val = $(this).val();
    	            if ($("#showselect option[value='" + val + "']").length > 1 )
    	                $("#showselect option[value='" + val + "']:gt(0)").remove();
    	    });
    	},'json'); 
    }
    </script>
</body>
</html>