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
    <meta charset="utf-8" />
    <title>Campus Second-hand</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/index.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/materialize.min.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/index.bundle.js" ></script>
    <link rel="stylesheet" href="<%=basePath%>css/materialize-icon.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />

    <script>
        function showLogin() {
            if($("#signup-show").css("display")=='block'){
                $("#signup-show").css("display","none");
            }
            if($("#login-show").css("display")=='none'){
                $("#login-show").css("display","block");
            }else{
                $("#login-show").css("display","none");
            }
        }
        function showSignup() {
            if($("#login-show").css("display")=='block'){
                $("#login-show").css("display","none");
            }
            if($("#signup-show").css("display")=='none'){
                $("#signup-show").css("display","block");
            }else{
                $("#signup-show").css("display","none");
            }
        }

        function ChangeName() {
            if($("#changeName").css("display")=='none'){
                $("#changeName").css("display","block");
            }else{
                $("#changeName").css("display","none");
            }
        }

        $(document).ready(function(){
            //异步验证
            $("#phone").blur(function(){
                var phone=$(this).val();
                $.ajax({
                    url:'<%=basePath%>user/register',
                    type:'POST',
                    data:{phone:phone},
                    dataType:'json',
                    success:function(json){
                        if(json.flag){
                            $("#errorPhone").html("Account exist!");
                            $("#register").attr("disabled",true);
                        }else{
                            $("#errorPhone").empty();
                            $("#register").attr("disabled",false);
                        }
                    },
                    error:function(){
                        alert('Request timeout!');
                    }
                });

            });

            <%--    $("#login_password").blur(function(){
                   var phone=$("#login_phone").val();
                   var password=$(this).val();
                   $.ajax({
                         url:'<%=basePath%>user/password',
                         type:'POST',
                         data:{phone:phone,password:password},
                         dataType:'json',
                         success:function(json){
                         if(json){
                             if(json.flag){
                                  $("#errorPassword").html("请核对账号密码，再重新输入!");
                                  $("#loginIn").attr("disabled",true);
                             }else{
                                  $("#errorPassword").empty();
                                  $("#loginIn").attr("disabled",false);
                             }
                         }else{
                             if(json.flag){
                                $("#errorPassword").html("请输入的密码有误!");
                                $("#loginIn").attr("disabled",true);
                           }if(json.flag==false){
                                $("#login_errorPhone").html("您输入的在账号有误!");
                                $("#loginIn").attr("disabled",true);
                           }
                         }
                         },
                         error:function(json){
                            alert("系统出错啦")
                         }
                     });

                 }); --%>

        });
    </script>
</head>

<body ng-view="ng-view">
    <!--首页导航栏-->

    <div ng-controller="headerController" class="header stark-components navbar-fixed ng-scope">
        <nav class="white nav1">
            <div class="nav-wrapper">
                <a href="<%=basePath%>goods/homeGoods" class="logo">
                    <em class="em1">Liverpool</em>
                    <em class="em2">Campus</em>
                    <%--<em class="em3"></em>--%>
                </a>
                <c:if test="${!empty cur_user}">
                    <div class="nav-wrapper search-bar">
                        <form class="ng-pristine ng-invalid ng-invalid-required" action="<%=basePath%>goods/search">
                            <div class="input-field">
                                <input id="search" name="str" placeholder="search..." style="height: 40px;"
                                       class="ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"/>
                                <input type="submit" class="btn"value="Go"/>
                                <label for="search" class="active">
                                    <i ng-click="search()" class="iconfont"></i>
                                </label>
                            </div>
                        </form>
                    </div>
                </c:if>
                <ul class="right">
                    <c:if test="${empty cur_user}">
                        <li class="publish-btn">
                            <button onclick="showLogin()" data-toggle="tooltip"
                                    title="Sign First！" class="red lighten-1 waves-effect waves-light btn" 	>
                                Upload</button>
                        </li>
                    </c:if>
                    <c:if test="${!empty cur_user}">
                        <li class="publish-btn">
                            <button data-position="bottom" class="red lighten-1 waves-effect waves-light btn">
                                <a href="<%=basePath%>goods/publishGoods">Upload</a>
                            </button>
                        </li>
                        <li>
                            <a href="<%=basePath%>user/allGoods">Uploaded Goods</a>
                        </li>
                        <li>
                            <a>${cur_user.username}</a>
                        </li>
                        <!-- <li class="notification">
                        <i ng-click="showNotificationBox()" class="iconfont"></i>
                        </li> -->
                        <li class="changemore">
                            <a class="changeMoreVertShow()">
                                <i class="iconfont"></i>
                            </a>
                            <div class="more-vert">
                                <ul class="dropdown-content">
                                    <li><a href="<%=basePath%>user/home">Profile</a></li>
                                    <li><a href="<%=basePath%>user/allFocus">Favourites</a></li>
                                    <li><a onclick="ChangeName()">Change username</a></li>
                                    <li><a href="<%=basePath%>admin" target="_blank">Admin login</a></li>
                                    <li><a href="<%=basePath%>user/logout">Logout</a></li>
                                </ul>
                            </div>
                        </li>
                    </c:if>
                    <c:if test="${empty cur_user}">
                        <li>
                            <a onclick="showLogin()">Signin</a>
                        </li>
                        <li>
                            <a onclick="showSignup()">Register</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>
    </div>

    <!--log in-->
    <div ng-controller="loginController" class="ng-scope">
        <div id="login-show" class="login stark-components">
            <div class="publish-box z-depth-4">
                <div class="row">
                    <a onclick="showLogin()">
                        <div class="col s12 title"></div>
                    </a>
                    <form action="<%=basePath%>user/login" method="post" role="form">
                        <div class="input-field col s12">
                            <input type="text" name="phone" id="login_phone" required="required" pattern="^1[0-9]{10}$" class="validate ng-pristine" />
                            <label>mobile&nbsp;&nbsp;<div id="login_errorPhone" style="color:red;display:inline;"></div></label>
                        </div>
                        <div class="input-field col s12">
                            <input type="password" id="login_password"  name="password" required="required" class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
                            <label>password&nbsp;&nbsp;<div id="errorPassword" style="color:red;display:inline;"></div></label>
                            <!--   <a ng-click="showForget()" class="forget-btn">忘记密码？</a> -->
                        </div>
                        <button type="submit" id="loginIn" class="waves-effect waves-light btn login-btn red lighten-1">
                            <i class="iconfont left"></i>
                            <em>sign in</em>
                        </button>
                        <div class="col s12 signup-area">
                            <em>No account？Go to</em>
                            <a onclick="showSignup()" class="signup-btn">Register</a>
                            <em> ！</em>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!--Sign up-->
    <div ng-controller="signupController" class="ng-scope">
        <div id="signup-show" class="signup stark-components">
            <div class="publish-box z-depth-4">
                <div class="row">
                    <a onclick="showSignup()">
                        <div class="col s12 title"></div>
                    </a>
                    <form action="<%=basePath%>user/addUser" method="post" role="form" id="signup_form">
                        <div class="input-field col s12">
                            <input type="text" name="username" required="required" class="validate ng-pristine" />
                            <label>Nickname</label>
                        </div>
                        <div class="input-field col s12">
                            <input type="text" name="phone" id="phone" required="required" pattern="^1[0-9]{10}$" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                            <label>Mobile&nbsp;&nbsp;<div id="errorPhone" style="color:#ff0000;display:inline;"></div></label>

                        </div>
                        <div class="input-field col s12">
                            <input type="password" name="password" required="required" class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
                            <label>Password</label>
                        </div>
                        <div ng-show="checkTelIsShow" class="col s12">
                            <button type="submit" id="register" class="waves-effect waves-light btn verify-btn red lighten-1">
                                <i class="iconfont left"></i>
                                <em>Register</em>
                            </button>
                        </div>
                        <div ng-show="checkTelIsShow" class="login-area col s12">
                            <em>Got one? Go to</em>
                            <a onclick="showLogin()">Sign in</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--更改用户名-->
    <div ng-controller="changeNameController" class="ng-scope">
        <div id="changeName" class="change-name stark-components">
            <div class="publish-box z-depth-4">
                <div class="row">
                    <div class="col s12 title">
                        <h1>Change username</h1>
                    </div>
                    <form action="<%=basePath%>user/changeName" method="post"  role="form">
                        <div class="input-field col s12">
                            <input type="text" name="username" required="required" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                            <label>change username</label>

                        </div>
                        <div ng-show="checkTelIsShow" class="col s12">
                            <button class="waves-effect waves-light btn publish-btn red lighten-1">
                                <i class="iconfont left"></i>
                                <em>Confirm</em>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--
    描述：左侧导航条
-->
        <div ng-controller="sidebarController" class="sidebar stark-components ng-scope">
            <li ng-class="{true: 'active'}[isAll]">
                <a href="<%=basePath%>goods/catelog" class="index">
                    <img src="<%=basePath%>img/index.png">
                    <em>Recent</em>
                </a>
            </li>
            <li ng-class="{true: 'active'}[isDigital]">
                <a href="<%=basePath%>goods/catelog/1" class="digital">
                    <img src="<%=basePath%>img/digital.png"  />
                    <em>Digital</em>
                </a>
            </li>
            <li ng-class="{true: 'active'}[isRide]">
                <a href="<%=basePath%>goods/catelog/2" class="ride">
                    <img src="<%=basePath%>img/ride.png"/>
                    <em>Trans</em>
                </a>
            </li>
            <li ng-class="{true: 'active'}[isCommodity]">
                <a href="<%=basePath%>goods/catelog/3" class="commodity">
                    <img src="<%=basePath%>img/commodity.png"/>
                    <em>Commodity</em>
                </a>
            </li>
            <li ng-class="{true: 'active'}[isBook]">
                <a href="<%=basePath%>goods/catelog/4" class="book">
                    <img src="<%=basePath%>img/book.png"/>
                    <em>Book</em>
                </a>
            </li>
            <li ng-class="{true: 'active'}[isMakeup]">
                <a href="<%=basePath%>goods/catelog/5" class="makeup">
                    <img src="<%=basePath%>img/makeup.png"/>
                    <em>Makeup</em>
                </a>
            </li>
            <li ng-class="{true: 'active'}[isSport]">
                <a href="<%=basePath%>goods/catelog/6" class="sport">
                    <img src="<%=basePath%>img/sport.png"/>
                    <em>Sport</em>
                </a>
            </li>
            <li ng-class="{true: 'active'}[isSmallthing]">
                <a href="<%=basePath%>goods/catelog/7" class="smallthing">
                    <img src="<%=basePath%>img/smallthing.png"/>
                    <em>Others</em>
                </a>
            </li>
            <div class="info">
                <a href="#">About us</a><em>-</em>
                <a href="#">Contact</a>
                <p>©Liverpool Uni</p>
            </div>
        </div>

    <!--描述：右侧显示部分-->
    <div class="main-content">
        <!--
            描述：右侧banner（图片）部分
        -->
        <div class="slider-wapper">
            <div class="slider" style="height: 440px; touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                <ul class="slides" style="height: 400px;">
                    <li class="active" style="opacity: 1;">
                        <a href="<%=basePath%>goods/homeGoods">
                            <div class="bannerimg">
                            <%--<div class="blur">
                                Blur Area
                            </div>--%>
                            <ul class="bannerul">
                                <p class="text1">Hello：</p>
                                <p class="text2">Welcome to the campus secondary market.</p>
                                <p class="text3">As the graduation season is approaching, do you have too much idle</p>
                                <p class="text4"> time to share with alumni? In order to pursue better campus services, ——<span>Campus Second-hand sharing platform</p>
                                <p class="text5">we have created a new campus platform. Campus secondary market There are more idle sharing and more free campus topic discussions</p>
                                <p class="text6">Come and find out!</p>
                            </ul>

                                <!--   <div class="logoimg">
                                      <img src="../img/p_logo.jpg" />
                                  </div> -->
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!--

        描述：最新发布
    -->
        <div class="index-title">
            <a href="">Recent</a>
            <hr class="hr1">
            <hr class="hr2">
        </div>
        <div class="waterfoo stark-components row">
            <div class="item-wrapper normal">
                <c:forEach var="item" items="${catelogGoods}">
                    <div class="card col">
                        <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                            <div class="card-image">
                                <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                            </div>
                            <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                            <div class="card-content item-name">
                                <p><c:out value="${item.goods.name}"></c:out></p>
                            </div>
                            <div class="card-content item-location">
                                <p>UOL</p>
                                <p><c:out value="${item.goods.startTime}"></c:out></p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!--
    
            描述：Digital
        -->
        <div class="index-title">
            <a href="">Digital</a>
            <hr class="hr1">
            <hr class="hr2">
        </div>
        <div class="waterfoo stark-components row">
            <div class="item-wrapper normal">
                <c:forEach var="item" items="${catelogGoods1}">
                    <div class="card col">
                        <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                            <div class="card-image">
                                <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                            </div>
                            <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                            <div class="card-content item-name">
                                <p><c:out value="${item.goods.name}"></c:out></p>
                            </div>
                            <div class="card-content item-location">
                                <p>UOL</p>
                                <p><c:out value="${item.goods.startTime}"></c:out></p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!--
    
            描述：Trans
        -->
        <div class="index-title">
            <a href="">Trans</a>
            <hr class="hr1">
            <hr class="hr2">
        </div>
        <div class="waterfoo stark-components row">
            <div class="item-wrapper normal">
                <c:forEach var="item" items="${catelogGoods2}">
                    <div class="card col">
                        <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                            <div class="card-image">
                                <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                            </div>
                            <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                            <div class="card-content item-name">
                                <p><c:out value="${item.goods.name}"></c:out></p>
                            </div>
                            <div class="card-content item-location">
                                <p>UOL</p>
                                <p><c:out value="${item.goods.startTime}"></c:out></p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="index-title">
            <a href="">Eletical</a>
            <hr class="hr1">
            <hr class="hr2">
        </div>
        <div class="waterfoo stark-components row">
            <div class="item-wrapper normal">
                <c:forEach var="item" items="${catelogGoods3}">
                    <div class="card col">
                        <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                            <div class="card-image">
                                <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                            </div>
                            <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                            <div class="card-content item-name">
                                <p><c:out value="${item.goods.name}"></c:out></p>
                            </div>
                            <div class="card-content item-location">
                                <p>UOL</p>
                                <p><c:out value="${item.goods.startTime}"></c:out></p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="index-title">
            <a href="">Books</a>
            <hr class="hr1">
            <hr class="hr2">
        </div>
        <div class="waterfoo stark-components row">
            <div class="item-wrapper normal">
                <c:forEach var="item" items="${catelogGoods4}">
                    <div class="card col">
                        <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                            <div class="card-image">
                                <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                            </div>
                            <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                            <div class="card-content item-name">
                                <p><c:out value="${item.goods.name}"></c:out></p>
                            </div>
                            <div class="card-content item-location">
                                <p>UOL</p>
                                <p><c:out value="${item.goods.startTime}"></c:out></p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="index-title">
            <a href="">MakeUp</a>
            <hr class="hr1">
            <hr class="hr2">
        </div>
        <div class="waterfoo stark-components row">
            <div class="item-wrapper normal">
                <c:forEach var="item" items="${catelogGoods5}">
                    <div class="card col">
                        <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                            <div class="card-image">
                                <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                            </div>
                            <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                            <div class="card-content item-name">
                                <p><c:out value="${item.goods.name}"></c:out></p>
                            </div>
                            <div class="card-content item-location">
                                <p>UOL</p>
                                <p><c:out value="${item.goods.startTime}"></c:out></p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="index-title">
            <a href="">Sports</a>
            <hr class="hr1">
            <hr class="hr2">
        </div>
        <div class="waterfoo stark-components row">
            <div class="item-wrapper normal">
                <c:forEach var="item" items="${catelogGoods6}">
                    <div class="card col">
                        <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                            <div class="card-image">
                                <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                            </div>
                            <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                            <div class="card-content item-name">
                                <p><c:out value="${item.goods.name}"></c:out></p>
                            </div>
                            <div class="card-content item-location">
                                <p>UOL</p>
                                <p><c:out value="${item.goods.startTime}"></c:out></p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="index-title">
            <a href="">Others</a>
            <hr class="hr1">
            <hr class="hr2">
        </div>
        <div class="waterfoo stark-components row">
            <div class="item-wrapper normal">
                <c:forEach var="item" items="${catelogGoods7}">//
                    <div class="card col">
                        <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                            <div class="card-image">
                                <img src="<%=basePath%>upload/${item.images[0].imgUrl}" />
                            </div>
                            <div class="card-content item-price"><c:out value="${item.goods.price}"></c:out></div>
                            <div class="card-content item-name">
                                <p><c:out value="${item.goods.name}"></c:out></p>
                            </div>
                            <div class="card-content item-location">
                                <p>UOL</p>
                                <p><c:out value="${item.goods.startTime}"></c:out></p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>


</body>
</html>