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
<link rel="stylesheet" type="text/css" href="${path }css/userM.css">
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
				<span>用户管理</span>
			</div>
			<div class="content-center">
				<div class="search">
					<input type="text" name="key">
					<button class="btn btn-info" onclick="searchU()">搜索</button>
				</div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>邮箱</th>
							<th>密码</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pb.content" id="u">
							<tr>
								<td><s:property value="#u.userName" /></td>
								<td><s:property value="#u.password" /></td>
								<td><button data-toggle="modal" data-target="#edit" onclick="editU(<s:property value="#u.userName" />)">编辑</button> <span>|</span>
									<button onclick="delU(<s:property value="#u.userName" />)">删除</button></td>
							</tr>
						</s:iterator>
						<tr>
							<td colspan="3" align="center">
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
			<!--  模态框编辑 -->
			<div class="modal fade" id="edit" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">编辑用户</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div>
							    <form action="" id="updateU">
									<div class="input-group ">
										<span class="input-group-addon">邮箱</span> 
										<input type="text" class="form-control" name="userName" readonly="readonly">
									</div>
									<div class="leave"></div>
									<div class="input-group ">
										<span class="input-group-addon">密码</span> 
										<input type="text" class="form-control" name="password">
									</div>
									</form>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" onclick="updateU()">提交更改</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function sk(currentPage){
	location.href="userMPage?currentPage="+currentPage;
}
function go(){
	var currentPage=$("input[name=currentPage]").val();
	location.href="userMPage?currentPage="+currentPage;
}
</script>
</html>