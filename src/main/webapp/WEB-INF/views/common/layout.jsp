<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath}/resources/css/basic-jquery-slider.css" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath}/resources/css/mobile.css" rel="stylesheet" type="text/css">
<script src="${contextPath}/resources/jquery/jquery-1.6.2.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/stickysidebar.jquery.js" type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/basic-jquery-slider.js" type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/tabs.js" type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/carousel.js" type="text/javascript"></script>
<!-- jQuery -->
<!--  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->

<!-- iamport.payment.js -->
<style>
ul {
list-style-type:none;margin:0;padding:0;
}
li {
display:inline;
}
a{
text-align:center;
color:#black;

}
.nav_info{
float:right;
color:#FFFFFF;
font-size:13.5px;
margin: 15px 5px 15px 0px;
padding-right:0;
}

</style>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	// 슬라이드 
	$(document).ready(function() {
		$('#ad_main_banner').bjqs({
			'width' : 780,
			'height' : 421,
			'showMarkers' : true,
			'showControls' : false,
			'centerMarkers' : false
		});
	});
	// 스티키 		
	$(function() {
		$("#sticky").stickySidebar({
			timer : 100,
			easing : "easeInBounce"
		});
	});
</script>
	<title><tiles:insertAttribute name="title" /></title>
	
</head>
<div style="background-color:#2E2E2E; height:50px;">
 <div id="head_link" style="background-color:#2E2E2E; height:50px; font-color:#FFFFFF; position: absolute; position: relative; margin-right: -600px;">
	
	<ul style="display:table; margin:auto; ">
         	<c:if test="${isLogOn == true and memberInfo.member_id == 'admin' }">  
	   	   	   <li><a href="${contextPath}/admin/goods/adminGoodsMain.do" class="nav_info" >관리자</a></li>
	    	</c:if>
			   <li><a href="${contextPath}/board/listArticles.do" class="nav_info">고객센터</a></li>
			<c:choose>
		     <c:when test="${isLogOn==true and not empty memberInfo }"><!-- MemberControlleriImpl 에서 설정한 isLogOn으로 컨트롤 -->
			   <li><a href="${contextPath}/mypage/selectDelivery.do" class="nav_info">주문배송</a></li>
			   <li><a href="${contextPath}/cart/myCartList.do" class="nav_info">장바구니</a></li>
			   <li><a href="${contextPath}/mypage/myPageMain.do" class="nav_info">마이페이지</a></li>
			   <li><a href="${contextPath}/member/logout.do" class="nav_info">로그아웃</a></li>
			 </c:when>
			 <c:otherwise>
			   <li><a href="${contextPath}/member/memberForm.do" class="nav_info">회원가입</a></li> 
			   <li><a href="${contextPath}/member/loginForm.do" class="nav_info">로그인</a></li>
			   <li><a href="#" class="nav_info" style="visibility: hidden;">가나다라마</a></li>
			   <li><a href="#" class="nav_info" style="visibility: hidden;">가나다라마</a></li>
			 </c:otherwise>
			</c:choose>
			  
			
	</ul>
	</div> 
	</div>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<header>
				   <tiles:insertAttribute name="header" />
			</header>
			
			<div class="clear"></div>
			
			<aside >
				 <tiles:insertAttribute name="side" />
			</aside>
			
			<article >
			 	<tiles:insertAttribute name="body" />
			</article>
			
			<div class="clear"></div>
			
			</div>
				 <tiles:insertAttribute name="quickMenu" />
  			</div>        	
		<div id="footer_wrap" style="margin-top: 100px;"><footer>
        		<tiles:insertAttribute name="footer" />
        	</footer>
        </div>
</body>      
        
        