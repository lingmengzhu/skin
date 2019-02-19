<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String url = request.getServletPath();
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
<title>工具管理</title>
<link rel="stylesheet" href="${path }css/userM.css">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="${path }js/public.js"></script>
</head>

<body>
	<div class="userM">
		<div class="content">
			<div class="content-head">
				<span>工具管理</span>
			</div>
			<div class="content-center">
				<div class="search">
					<input type="text" name="key">
					<button class="btn btn-info" onclick="searchT()">搜索</button>
					<button class="btn btn-info" data-toggle="modal"
						data-target="#addtool">新增工具</button>
				</div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>工具编号</th>
							<th>工具名</th>
							<th>图片</th>
							<th>类别</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pb.content" id="t">
							<tr>
								<td><s:property value="#t.toolsId" /></td>
								<td><s:property value="#t.toolsName" /></td>
								<td><img alt="" src="${dir }<s:property value="#t.toolsImg" />" style="width:50px;"></td>
								<td><s:property value="#t.toolsType" /></td>
								<td><button data-toggle="modal" data-target="#edit"
										onclick="editT(<s:property value="toolsId" />)">编辑</button> <span>|</span>
									<button onclick="delT(<s:property value="toolsId" />)">删除</button></td>
							</tr>
						</s:iterator>
						<tr>
							<td colspan="5" align="center">
								<div>
									第<span id="currentPage">${pb.currentPage }</span>页 &nbsp;&nbsp;
									共${pb.pageTotal }页 &nbsp;&nbsp; 共<span id="recordTotal">${pb.recordTotal }</span>条信息
									<div>
										<s:if test="#request.pb.currentPage==1"> 首页&nbsp;&nbsp;上一页 </s:if>
										<s:else>
											<a href='javascript:void(0)' onclick="sk(1)">首页</a>
											<a href='javascript:void(0)'
												onclick="sk(<s:property value="#request.pb.currentPage - 1"/>)">上一页</a>
										</s:else>
										<s:if test="#request.pb.currentPage != #request.pb.pageTotal">
											<a href='javascript:void(0)'
												onclick="sk(<s:property value="#request.pb.currentPage + 1"/>)">下一页</a>
											<a href='javascript:void(0)'
												onclick="sk(<s:property value="#request.pb.pageTotal"/>)">尾页</a>
										</s:if>
										<s:else>下一页&nbsp;&nbsp;尾页</s:else>
										&nbsp;&nbsp; 跳转至 <input class="small" type="text"
											name="currentPage" />页 <a href='javascript:void(0)'
											onclick="go()">跳转</a>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal fade" id="edit" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">编辑工具</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div>
								<form id="editT" action="" enctype="multipart/form-data">
									<div class="input-group ">
										<span class="input-group-addon">工具名</span> <input
											type="hidden" name="toolsId"> <input type="text"
											class="form-control" name="toolsName">
									</div>
									<div class="leave"></div>
									<div class="input-group ">
										<span class="input-group-addon">类别</span> <input type="text"
											class="form-control" name="toolsType">
									</div>
									<div class="leave"></div>
									<div class="input-group ">
										<span class="input-group-addon">使用方式</span>
										<textarea id="useMethod" name="useMethod"
											style="width: 293px; height: 100px; border: 1px solid #ced4da;"></textarea>
									</div>
									<span class="" style="height: 30px;">图片:</span> <input
										id="file1" name="file" type="file" style="display: none;"
										onchange="fileUpload(this,'edittoolsImg')" multiple="multiple" /> <input type="button"
										class="btn btn-primary" onclick="$('#file1').click()"
										value="上传" />
										<input id="edittoolsImg" name="toolsImg" type="hidden" />
								</form>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" onclick="updateT()">提交更改</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
			<div class="modal fade" id="addtool" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">新增工具</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div>
								<form id="addT" action="addT" enctype="multipart/form-data"
									method="post">
									<div class="input-group ">
										<span class="input-group-addon">工具名</span> <input type="text"
											class="form-control" name="t.toolsName">
									</div>
									<div class="leave"></div>
									<div class="input-group ">
										<span class="input-group-addon">类别</span> <input type="text"
											class="form-control" name="t.toolsType">
									</div>
									<div class="leave"></div>
									<div class="input-group ">
										<span class="input-group-addon">使用方式</span>
										<textarea id="useMethod" name="t.useMethod"
											style="width: 293px; height: 100px; border: 1px solid #ced4da;"></textarea>
									</div>
									<span class="" style="height: 30px;">图片:</span> <input
										id="addfile1" name="file" type="file" style="display: none;"
										onchange="fileUpload(this,'addtoolsImg')" multiple="multiple" /> <input type="button"
										class="btn btn-primary" onclick="$('#addfile1').click()"
										value="上传" />
										<input id="addtoolsImg" name="t.toolsImg" type="hidden" />
								</form>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary"
								onclick="$('#addT').submit();">提交更改</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
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
			   $("#"+str).attr("value",data[i]);
			   })
		   },
		   error:function(data){
			   }
	   })
	   
   }
    function sk(currentPage){
    	location.href="toolsMPage?currentPage="+currentPage;
    }
    function go(){
    	var currentPage=$("input[name=currentPage]").val();
    	location.href="toolsMPage?currentPage="+currentPage;
    }
    </script>
</body>

</html>