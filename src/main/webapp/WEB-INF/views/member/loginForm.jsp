<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="${contextPath}/resources/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" media="screen">
    <c:if test='${not empty message}'>
<script>
	window.onload=function()
	{
	  result();
	}
	
	function result(){
		alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
	}
</script>
</c:if>
</head>
<body>
	<form action="${contextPath}/member/login.do" method="post">
    <div class="main">

        
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">

                        <figure><img src="${contextPath}/resources/images/Study.jpg" alt="sing up image"></figure>
                        <!-- <input type="button" value="회원가입"> --><a href="${contextPath}/member/memberForm.do" class="signup-image-link">회원 가입</a>

                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">로그인</h2>
                        <form method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="member_id"  id="your_name" placeholder="아이디"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="member_pw" id="your_pass" placeholder="비밀번호"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>로그인 상태 유지</label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="로그인"/>
                            </div>
                        </form>
                        <div class="social-login">
                            
                            <ul class="socials">
                                <li>
                                <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0d2976f52e2191eed8909314c41a95f8&redirect_uri=http://192.168.1.108:8088/jasmine/member/memberForm.do">
                                <i class="display-flex-center zmdi zmdi-kakao"><img src="${contextPath}/resources/image/kakaotalk.png">
                                </i>
                                </a>
                                </li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-kakao"><img src="${contextPath}/resources/image/naver.png"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>
	</form>
    <!-- JS -->
    <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>