<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<style>	
ul a{
		font-family:"Arial Black",snas-serif;
      	font-size: 12.8px;
      	color: #000000;
		font-weight:bold;
		font-weight:600px;
		
}
.main_side{

	left: 50px;
	padding: 10px;
	border-bottom: solid 3px #F2F2F2;
	border-left: solid 3px #F2F2F2;
	border-right: solid 3px #F2F2F2;
	margin:10px 0px 0px 0px;
	padding:0px;
}
.main_side ul{

  padding-bottom:0px;
}
	
.main_side li{

	padding:0px;
}
#notice h2{
	margin-top

}
#notice{
	text-align:center;
	margin-top:18px;
	left: 50px;
	padding: 10px;
	border-top: solid 3px #F2F2F2;
	border-bottom: solid 3px #F2F2F2;
	border-left: solid 3px #F2F2F2;
	border-right: solid 3px #F2F2F2;
}	
.book_story{	
		text-align:center;
		font-family:"Arial Black",snas-serif;
      	font-size: 13.5px;
      	color: #FFFFFF;
      	text-shadow: 1px 1px 1px gray;
      	font-weight:600;
      	background-color: #424242;

      	margin:8px 0px 12px 0px ;
      	height:25px;
      	padding:5px 0px 10px 0px;
      	border-radius: 13px 13px 13px 13px;
      	
}
.music{
		text-align:center;
		font-family:"Arial Black",snas-serif;
      	font-size: 13.5px;
      	color: #FFFFFF;
      	text-shadow: 1px 1px 1px gray;
      	font-weight:600;
      	background-color: #424242;
}
.book_font{
		font-family:"Arial Black",snas-serif;
      	font-size: 12.8px;
      	color: #000000;
		font-weight:700;

		margin: 0px 0px 0px 0px;

}
.music_font{
		font-family:"Arial Black",snas-serif;
      	font-size: 12.8px;
      	color: #000000;
      	font-weight:700;
      	margin:0px;
      	
}
.book_menu{
	margin:0px auto;
}
#notice{
	margin:0px 0px 0px 0px;
}
</style>	
<nav>
<ul class="main_side">
<c:choose>
<c:when test="${side_menu=='admin_mode' }">
   <li>
		<H3 class="book_story">주요기능</H3>
		<ul>
			<li><a href="${contextPath}/admin/goods/adminGoodsMain.do">상품관리</a></li>
			<li><a href="${contextPath}/admin/order/adminOrderMain.do">주문관리</a></li>
			<li><a href="${contextPath}/admin/member/adminMemberMain.do">회원관리</a></li>
			<li><a href="#">배송관리</a></li>
			<li><a href="#">게시판관리</a></li>
			<li><a href="${contextPath}/admin/datavis/dataVisualization.do">데이터 시각화</a></li>
		</ul>
	</li>
</c:when>
<c:when test="${side_menu=='my_page' }">
	<li>
		<h3 class="book_story">주문내역</h3>
		<ul class="book_list">
			<li><a href="${contextPath}/mypage/listMyOrderHistory.do">주문내역/배송 조회</a></li>
			<li><a href="#">반품/교환 신청 및 조회</a></li>
			<li><a href="#">취소 주문 내역</a></li>
			<li><a href="${contextPath}/mypage/selectDelivery.do">배송 조회</a></li>
		</ul>
	</li>
	<li>
		<h3 class="book_story">정보내역</h3>
		<ul>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">회원정보관리</a></li>
			<li><a href="#">나의 주소록</a></li>
			<li><a href="#">개인정보 동의내역</a></li>
			<li><a href="#">회원탈퇴</a></li>
		</ul>
	</li>
</c:when>


<c:otherwise>
<div>
		<h3 class="book_story">국내외 도서</h3></div>
<div>
	<li>
		<ul class="book_font">
			<li><a href="${contextPath}/goods/categoryGoods.do?keyWord=컴퓨터와 인터넷" class="book_menu">IT / 모바일</a></li>
			<li><a href="${contextPath}/goods/categoryGoodsNovel.do?keyWord=소설 시 에세이" class="book_menu">소설 / 시 / 에세이</a></li>
			<li><a href="${contextPath}/goods/categoryGoodsComic.do?keyWord=만화" class="book_menu">만화</a></li>
			<li><a href="${contextPath}/goods/categoryGoodsSD.do?keyWord=자기계발" class="book_menu">자기계발</a></li>
			<li><a href="${contextPath}/goods/categoryGoodsChild.do?keyWord=어린이" class="book_menu">어린이</a></li>
			<li><a href="${contextPath}/goods/categoryGoodsHealth.do?keyWord=건강 취미" class="book_menu">건강 / 취미</a></li>
		</ul>
	</li>
	<br>
	<li>
		<h3 class="music">음반</h3>
		<ul class="music_font">
			<li><a href="#" class="music_menu">가요</a></li>
			<li><a href="#" class="music_menu">록</a></li>
			<li><a href="#" class="music_menu">클래식</a></li>
			<li><a href="#" class="music_menu">뉴에이지</a></li>
			<li><a href="#" class="music_menu">재즈</a></li>
			<li ><a href="#" class="music_menu" style="margin-bottom:10px;">기타</a></li>
		</ul>
	</li>
	</div>
 </c:otherwise>
</c:choose>	

</nav>
<div class="clear"></div>
<DIV id="notice" style="
    margin-top: 18px;
">
	<H2 style="font-weight:bold;font-weight:700px; " >공지사항</H2>
	<UL>
	
	<c:forEach  var="i" begin="1" end="5" step="1">
		<li><a href="#">공지사항입니다.<br></a></li>
	</c:forEach>
	</ul>
</div>
<div id="banner">
	<a href="#"><img width="204" height="300" src="${contextPath}/resources/image/Psycho.jpg"> </a>
</div>


<div id="banner">
	<a href="#"><img width="204" height="185" src="${contextPath}/resources/image/ebs_ad.jpg"></a>
</div>
<div id="banner">
	<a href="#"><img width="204" height="185" src="${contextPath}/resources/image/nadaum.jpg"></a>
</div>
<div id="banner">
	<a href="#"><img width="204" height="185" src="${contextPath}/resources/image/fuckmoney.jpg"></a>
</div>
</html>