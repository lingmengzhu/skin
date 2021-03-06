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
%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员管理</title>
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
            <div class="content-head"><span>管理员管理</span></div>
            <div class="content-center">
                <div class="search"><input type="text" name="key"><button class="btn btn-info" onclick="searchM()">搜索</button></div>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="pb.content" id="m">
							<tr>
								<td><s:property value="#m.managerName" /></td>
								<td><s:property value="#m.managerPassword" /></td>
								<td><button data-toggle="modal" data-target="#edit" onclick="editM(<s:property value="#m.managerName" />)">编辑</button> <span>|</span>
									<button onclick="delM(<s:property value="#m.managerName" />)">删除</button></td>
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
            <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">编辑管理员</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <form action="" id="editM">
                                    <div class="input-group ">
                                        <span class="input-group-addon">用户名</span>
                                        <input type="text" class="form-control" id="managerName" name="m.managerName" disabled="disabled">
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">密码</span>
                                        <input type="text" class="form-control" id="managerPassword" name="m.managerPassword">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="updateM()">提交</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
        </div>
    </div>
</body>
</html>