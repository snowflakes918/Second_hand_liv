<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload goods</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
   <!-- bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <!-- 图片上传即使预览插件 -->
    <link rel="stylesheet" href="<%=basePath%>css/fileinput.min.css">
    <script type="text/javascript" src="<%=basePath%>js/fileinput.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/zh.js"></script>

    <style>
        .container{padding-top:10px}
    </style>
</head>
<body>
<%--    顶部导航栏--%>
    <div id="cover" style="min-height: 639px;">
        <div id="user_area">
            <div id="home_header">
                <a href="<%=basePath%>goods/homeGoods">
                    <h1 class="logo"></h1>
                </a>
                <a href="<%=basePath%>user/home">
                    <img src="<%=basePath%>img/header2.jpg"  style="margin-left: 20px;" >
                </a>
                <a href="<%=basePath%>user/home">
                    <div class="home"></div>
                </a>
            </div>
            <!--

                描述：左侧个人中心栏
            -->
            <div id="user_nav">
                <div class="user_info">
                    <div class="head_img">
                        <img src="<%=basePath%>img/photo.jpg">
                    </div>
                    <div class="big_headimg">
                        <img src="">
                    </div>
                    <span class="name">${cur_user.username}</span><hr>
                    <!--   <span class="school"></span> -->
                    <a class="btn" style="width: 98%;background-color: rgb(79, 190, 246);color:rgba(255, 255, 255, 1);" href="<%=basePath%>user/myPurse">My Purse：￥${myPurse.balance}</a>
                    <input type="hidden" value="${myPurse.recharge}" id="recharge"/>
                    <input type="hidden" value="${myPurse.withdrawals}" id="withdrawals"/>
                    <span class="btn" data-toggle="modal" data-target="#myModal" style="width: 98%;background-color: rgb(79, 190, 246); color:rgba(255, 255, 255, 1);margin-top:0.5cm;">My credit：${cur_user.power}</span>

                </div>
                <div class="home_nav">
                    <ul>
                        <a href="<%=basePath%>orders/myOrders">
                            <li class="notice">
                                <div></div>
                                <span>Order</span>
                                <strong></strong>
                            </li>
                        </a>
                        <a href="<%=basePath%>user/allFocus">
                            <li class="fri">
                                <div></div>
                                <span>Favourites</span>
                                <strong></strong>
                            </li>
                        </a>
                        <a href="<%=basePath%>goods/publishGoods">
                            <li class="store">
                                <div></div>
                                <span>Uploads</span>
                                <strong></strong>
                            </li>
                        </a>
                        <a href="<%=basePath%>user/allGoods">
                            <li class="second">
                                <div></div>
                                <span>My idle</span>
                                <strong></strong>
                            </li>
                        </a>
                        <a href="<%=basePath%>user/basic">
                            <li class="set">
                                <div></div>
                                <span>Settings</span>
                                <strong></strong>
                            </li>
                        </a>
                    </ul>
                </div>
            </div>

            <div id="user_content">
                <div class="basic">
                    <form:form action="../goods/publishGoodsSubmit" method="post" role="form" enctype="multipart/form-data">
                        <h1 style="margin-left: 210px;">Upload goods</h1><hr/>
                        <div class="changeinfo">
                            <span>Name: </span>
                            <input class="in_info" type="text" name="name" placeholder="Name"/>
                            <span>(*Required)</span>
                        </div>
                        <div class="changeinfo">
                            <span>Selling prcie：</span>
                            <input class="in_info" type="text" name="price" placeholder="Selling price"/>
                            <span>(*Required)</span>
                        </div>
                        <div class="changeinfo">
                            <span>Original price：</span>
                            <input class="in_info" type="text" name="realPrice" placeholder="Original price"/>
                            <span id="checkphone">(*OPTIONAL)</span>
                        </div>
                        <div class="changeinfo">
                            <span>Categories：</span>
                                <select class="in_info" name="catelogId">
                                    <option value="1">Digital</option>
                                    <option value="2">Transportation</option>
                                    <option value="3">Electrical</option>
                                    <option value="4">Books</option>
                                    <option value="5">Clothes&Makeup</option>
                                    <option value="6">Sports</option>
                                    <option value="7">Tickets</option>
                                </select>
                        </div>
                        <div class="changeinfo" id="dir">
                            <span>Description：</span>
                            <div class="sha">
                                <div class="publ">
                                    <div class="pub_con">
                                        <div class="text_pu">
                                            <textarea name="describle" class="emoji-wysiwyg-editor"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <hr />
                        <div class="changeinfo">
                            <span>Image: </span>
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-6 col-sm-offset-1">
                                        <div class="form-group">
                                            <div class="col-sm-10">
                                                <input type="file" name="myfile" data-ref="imgUrl" class="col-sm-10 myfile" value=""/>
                                                <input type="hidden" name="imgUrl" value="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="submit" class="setting-save" value="Upload" style="margin-top: 20px;background-color: blue;"/>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
<script>
    $(".myfile").fileinput({
        uploadUrl:"<%=basePath%>goods/uploadFile",//上传的地址
        uploadAsync:true, //默认异步上传
        showUpload: false, //是否显示上传按钮,跟随文本框的那个
        showRemove : false, //显示移除按钮,跟随文本框的那个
        showCaption: true,//是否显示标题,就是那个文本框
        showPreview : true, //是否显示预览,不写默认为true
        dropZoneEnabled: true,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
        //minImageWidth: 50, //图片的最小宽度
        //minImageHeight: 50,//图片的最小高度
        //maxImageWidth: 1000,//图片的最大宽度
        //maxImageHeight: 1000,//图片的最大高度
        //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
        //minFileCount: 0,
        maxFileCount: 3, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        validateInitialCount:true,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "Upload file number: ({n}) exceeds maximum number: {m}！",
        allowedFileTypes: ['image'],//配置允许文件上传的类型
        allowedPreviewTypes : [ 'image' ],//配置所有的被预览文件类型
        allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ],//控制被预览的所有mime类型
        language : 'zh'
    })
    //异步上传返回结果处理
    $('.myfile').on('fileerror', function(event, data, msg) {
        console.log("fileerror");
        console.log(data);
    });
    //异步上传返回结果处理
    $(".myfile").on("fileuploaded", function (event, data, previewId, index) {
        console.log("fileuploaded");
        var ref=$(this).attr("data-ref");
        $("input[name='"+ref+"']").val(data.response.imgUrl);
    });

    //同步上传错误处理
    $('.myfile').on('filebatchuploaderror', function(event, data, msg) {
        console.log("filebatchuploaderror");
        console.log(data);
    });

    //同步上传返回结果处理
    $(".myfile").on("filebatchuploadsuccess", function (event, data, previewId, index) {
        console.log("filebatchuploadsuccess");
        console.log(data);
    });

    //上传前
    $('.myfile').on('filepreupload', function(event, data, previewId, index) {
        console.log("filepreupload");
    });
</script>
</body>
</html>
