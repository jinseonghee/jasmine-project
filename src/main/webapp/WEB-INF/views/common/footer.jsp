<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<style>
	.fot{
		font-family:"Arial Black",snas-serif;
      	color: #000000;
      	text-shadow: 2px 2px 2px #A4A4A4;
		text-align: center;
		
	}
	.foot{
		padding: 0px;
		font-size: 15px;
		font-weight: bold;
		font-weight: 300;
		text-align: center;
		border-top: 1px solclass #ddd;
		
	}

	.foot ul{
      display:table; margin:auto; padding:0;
   }
   .foot li{
      float: left; text-align: center; display:inline-block;
   }
   
   .foot_main{
   
   text-align: left;
   }
   *{
   margin:auto;
   }
   
</style>

  
<div>
<div footer_foot>
<div class="clear"></div>
<div  class="foot" style="padding-left:0px"  >
<ul class="fot" >
<tr>
	<td>
	<li><a href="#">회사소개</a></li>
	<li><a href="#">이용약관</a></li>
	<li><a href="#">개인정보취급방침</a></li>
	<li><a href="#">제휴/도서홍보</a></li>
	<li><a href="#">광고센터</a></li>
	<li><a href="#">고객만족센터</a></li>
	<li class="no_line"><a href="#">찾아오시는길</a></li>
	<td>
</tr>
</ul>
<div class="foot_main" >
	<table>	
	<br>
	 <tr class="foot_main">
	 <td >㈜Jasmine 대표이사 : 오승용</td>
	 <!-- <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오승용</td> -->  
	 </tr>
	 <tr class="foot_main">
	 <td>주소 : 우편번호 06218 서울시 송파구</td>
	 <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사업자등록번호 : 102-99-99999"</td> 
	</tr>
	<tr class="foot_main">
	 <td>서울특별시 통신판매업신고번호 : 제 666호</td>
	 <td><a href="#"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사업자정보확인</strong></a></td> 
	 </tr>
	<tr class="foot_main">
	 <td> 대표전화 : 1544-1544 (발신자 부담전화)</td>
	 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;팩스 : 0502-977-7777 (지역번호공통)</td>
	</tr>
	<tr class="foot_main">
	<td colspan="3">COPYRIGHT(C) Jasmine BOOK CENTRE ALL RIGHTS RESERVED.</td>
	 </tr>
	 </table>
	 </div>
</div>
</div>
</div>
