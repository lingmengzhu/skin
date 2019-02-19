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
    <title>美妆资讯管理</title>
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
            <div class="content-head"><span>美妆资讯管理</span></div>
            <div class="content-center">
                <div class="search"><input type="text" name="key"><button class="btn btn-info" onclick="searchBI()">搜索</button><button data-toggle="modal" data-target="#addinformation" class="btn btn-info">新增资讯</button></div>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>资讯编号</th>
                            <th>标题</th>
                            <th>关键字</th>
                            <th>例图</th>
                            <th>来源</th>
                            <th>发布时间</th>
                            <th>作者</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="pb.content" id="bInfo">
							<tr>
							    <td><s:property value="#bInfo.beautyInformationId" /></td>
								<td><s:property value="#bInfo.beautyInformationTitle" /></td>
								<td><s:property value="#bInfo.beautyInformationKeyword" /></td>
								<td><img alt="" src="${dir }<s:property value="#bInfo.beautyInformationImage" />" style="width:50px;"></td>
								<td><s:property value="#bInfo.beautyInformationResourse" /></td>
								<td><s:property value="#bInfo.beautyInformationTime" /></td>
								<td><s:property value="#bInfo.beautyInformationAuthor" /></td>
								<td><button data-toggle="modal" data-target="#edit" onclick="editBI(<s:property value="beautyInformationId" />)">编辑</button> <span>|</span>
									<button onclick="delBI(<s:property value="beautyInformationId" />)">删除</button></td>
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
                <div class="modal-dialog" style="max-width:800px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">编辑资讯</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                         <form action="" id="editBI" method="post" enctype="multipart/form-data" style="width:100%;">
                            <div style="float:left; width:400px;">
                                    <div class="input-group ">
                                        <span class="input-group-addon">标题</span>
                                        <input type="hidden" class="form-control" name="beautyInformationId">
                                        <input type="text" class="form-control" name="beautyInformationTitle">
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">关键字</span>
                                        <input type="text" class="form-control" name="beautyInformationKeyword">
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">来源</span>
                                        <input type="text" class="form-control" name="beautyInformationResourse">
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">作者</span>
                                        <input type="text" class="form-control" name="beautyInformationAuthor">
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">发布时间</span>
                                        <input type="text" class="form-control" name="beautyInformationTime">
                                    </div>
                            </div>
                             <div style="float:right;width:360px;">
                          <div>
                            <span style="vertical-align:90px;">内容:</span>
                            <textarea id="beautyInformationContent" rows="" cols="" name="bInfo.beautyInformationContent" style="width:260px;height:120px;"></textarea>
                            </div> 
                            <div><span  style="vertical-align:90px;">摘要:</span>
                            <textarea id="beautyInformationSynopsis" rows="" cols="" name="bInfo.beautyInformationSynopsis" style="width:260px;height:120px;"></textarea>
                            </div>
                             <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">图片</span>
                                       <input
										id="file1" name="file" type="file" style="display: none;"
										onchange="fileUpload(this,'editBInfoImg')" multiple="multiple" /> <input type="button"
										class="btn btn-primary" onclick="$('#file1').click()"
										value="上传" style="height:30px;line-height:15px;margin-top:10px;"/>
										<input id="editBInfoImg" name="beautyInformationImage" type="hidden" />
                                    </div>
                            </div>
                              </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="updateBI()">提交更改</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
            <div class="modal fade" id="addinformation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog"  style="max-width:800px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">新增资讯</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                         <form action="addBI" id="addBI" method="post" enctype="multipart/form-data" style="width:100%;">
                            <div style="float:left; width:400px;">
                                    <div class="input-group ">
                                        <span class="input-group-addon">标题</span>
                                        <input type="text" class="form-control" name="bInfo.beautyInformationTitle">
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">关键字</span>
                                        <input type="text" class="form-control" name="bInfo.beautyInformationKeyword">
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">来源</span>
                                        <input type="text" class="form-control" name="bInfo.beautyInformationResourse">
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">作者</span>
                                        <input type="text" class="form-control" name="bInfo.beautyInformationAuthor">
                                    </div>
                                    <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">发布时间</span>
                                        <input type="text" class="form-control" name="bInfo.beautyInformationTime">
                                    </div>
                            </div>
                            <div style="float:right;width:360px;" >
                            <div>
                            <span class="input-group-addon" style="vertical-align:90px;">内容:</span>
                            <textarea rows="" cols="" name="bInfo.beautyInformationContent" style="width:260px;height:120px;"></textarea>
                            </div> 
                            <div><span class="input-group-addon" style="vertical-align:90px;">摘要:</span>
                            <textarea rows="" cols="" name="bInfo.beautyInformationSynopsis" style="width:260px;height:120px;"></textarea>
                            </div>
                             <div class="leave"></div>
                                    <div class="input-group ">
                                        <span class="input-group-addon">图片:</span>
                                        <input
										id="addfile1" name="file" type="file" style="display: none;"
										onchange="fileUpload(this,'addBInfoImg')" multiple="multiple" /> <input type="button"
										class="btn btn-primary" onclick="$('#addfile1').click()"
										value="上传" style="height:30px;line-height:15px;margin-top:10px;"/>
										<input id="addBInfoImg" name="bInfo.beautyInformationImage" type="hidden" />
                                    </div>
                            </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="$('#addBI').submit();">提交更改</button>
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
 			   $("#"+str).attr("value",data[i]);
 			   })
 		   },
 		   error:function(data){
 			   }
 	   })
 	   
    }
    function sk(currentPage){
    	location.href="informationMPage?currentPage="+currentPage;
    }
    function go(){
    	var currentPage=$("input[name=currentPage]").val();
    	location.href="informationMPage?currentPage="+currentPage;
    }
    </script>
</body>
</html>