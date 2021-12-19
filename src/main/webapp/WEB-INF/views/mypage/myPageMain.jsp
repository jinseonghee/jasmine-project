<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width-device-width",inital-scale="1">
<title>jasmine</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="${contextPath}/resources/css/mypage.css">

<!-- href="${contextPath}/resources/css/mobile.css -->
<c:if test="${message=='cancel_order'}">
	<script>
	window.onload=function()
	{
	  init();
	}
	
	function init(){
		alert("주문을 취소했습니다.");
	}
	</script>
</c:if>
<script>
function fn_cancel_order(order_id){
	var answer=confirm("주문을 취소하시겠습니까?");
	if(answer==true){
		var formObj=document.createElement("form");
		var i_order_id = document.createElement("input"); 
	    
	    i_order_id.name="order_id";
	    i_order_id.value=order_id;
		
	    formObj.appendChild(i_order_id);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/mypage/cancelMyOrder.do";
	    formObj.submit();	
	}
}

</script>
<style>
/*  	table{
	width:100%;
	border: 1px solid #333333;
	border-collapse:collapse;
	}
	th, td{
	border: 1px solid #333333;
	padding:5px
	}  */
	.tr0{
      	font-size: 16px;
      	font-weight: bold;
      	color: #000000;
      	padding :10px 0px;
		text-align:center;
	}
	.tr1{
      	font-size: 16px;
      	font-weight: bold;
      	color: #000000;
      	padding :10px 0px;
		text-align:center;
	} 
	.tr2{
      	font-size: 15px;
      	font-weight: bold;
      	color: #000000;
      	padding :10px 0px;
		text-align:center;
	}  
	th{
		background: linear-gradient(to bottom, black, #A4A4A4);
		color:#FFFFFF;
      	font-size: 17px;
      	font-weight:900;
      	text-align:center;
	}
	
	     input {
        vertical-align: middle;
      }
      input.form-text {
        border: 1px solid #bcbcbc;
        height: 28px;
      }
      input.img-button {
        background: url( "images/button_search.png" ) no-repeat;
        border: none;
        width: 32px;
        height: 32px;
        cursor: pointer;
      }
      .td0{
      	font-family:"Arial Black",snas-serif;
      	font-size: 15px;
      	font-weight: 500;
      	color: #000000;
      	text-shadow: 2px 2px 2px #A4A4A4;
      		padding :10px 0px;
	text-align:center;
      }
     .h0{
        font-family:"Arial Black",snas-serif;
      	font-size: 22px;
      	color: #000000;
      	text-shadow: 1px 1px 1px gray;
      	font-weight:600;
      	margin: 20px 0PX 0PX 0PX
     }
     .h1{
     	font-family:"Arial Black",snas-serif;
      	font-size: 22px;
      	color: #000000;
      	text-shadow: 1px 1px 1px gray;
      	font-weight:600;
     }
     .h2{
     	font-family:"Arial Black",snas-serif;
      	font-size: 22px;
      	color: #000000;
      	text-shadow: 1px 1px 1px gray;
      	font-weight:600;
     }
    .info0{
      	font-size: 15px;
      	font-weight: bold;
      	color: #000000;
      	padding :10px 0px;
		text-align:center;
    }
    .info1{	
    	font-size: 15px;
      	font-weight: bold;
      	color: #000000;
      	padding :10px 0px;
		text-align:center;
    }
    .info2{
    	font-size: 15px;
      	font-weight: bold;
      	color: #000000;
      	padding :10px 0px;
		text-align:center;
    }
    .info3{
    	font-size: 15px;
      	font-weight: bold;
      	color: #000000;
      	padding :10px 0px;
		text-align:center;
    }
    
	.list_view2 td, th, tr{
	padding :10px 0px;
	text-align:center;
	}
</style>
</head>
<body>
<h1 class="h0">나의 최근 주문 현황
    <A href="#"> <IMG  src="${contextPath}/resources/image/btn_more_see.jpg">  </A> 
</h1>
<table class="list_view">
		<tbody align=center >
			<tr class="td0" style="background: linear-gradient(to bottom, #000000, #A4A4A4); color:#FFFFFF;" >
				<td class="td1"><strong>주문번호</strong></td>
				<td class="td2"><strong>주문일자</strong></td>
				<td class="td3"><strong>주문상품</strong></td>
				<td class="td4"><strong>주문상태</strong></td>
				<td class="td5"><strong>주문취소</strong></td>
			</tr>
      <c:choose>
         <c:when test="${ empty myOrderList }">
		  <tr>
		    <td colspan=5 class="fixed">
				  <strong>주문한 상품이 없습니다.</strong>
		    </td>
		  </tr>
        </c:when>
        <c:otherwise>
	      <c:forEach var="item" items="${myOrderList }"  varStatus="i">
	       <c:choose> 
              <c:when test="${ pre_order_id != item.order_id}">
                <c:choose>
	              <c:when test="${item.delivery_state=='delivery_prepared' }">
	                <tr  bgcolor="lightgreen">    
	              </c:when>
	              <c:when test="${item.delivery_state=='finished_delivering' }">
	                <tr  bgcolor="lightgray">    
	              </c:when>
	              <c:otherwise>
	                <tr  bgcolor="orange">   
	              </c:otherwise>
	            </c:choose> 
            <tr>
             <td>
		       <a href="${contextPath}/mypage/myOrderDetail.do?order_id=${item.order_id }"><span>${item.order_id }</span>  </a>
		     </td>
		    <td><span>${item.pay_order_time }</span></td>
			<td align="center">
			   <strong>
			      <c:forEach var="item2" items="${myOrderList}" varStatus="j">
			          <c:if  test="${item.order_id ==item2.order_id}" >
			            <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item2.goods_id }">${item2.goods_title }/${item.order_goods_qty }개</a><br>
			         </c:if>   
				 </c:forEach>
				</strong></td>
			<td>
			  <c:choose>
			    <c:when test="${item.delivery_state=='delivery_prepared' }">
			       배송준비중
			    </c:when>
			    <c:when test="${item.delivery_state=='delivering' }">
			       배송중
			    </c:when>
			    <c:when test="${item.delivery_state=='finished_delivering' }">
			       배송완료
			    </c:when>
			    <c:when test="${item.delivery_state=='cancel_order' }">
			       주문취소
			    </c:when>
			    <c:when test="${item.delivery_state=='returning_goods' }">
			       반품완료
			    </c:when>
			  </c:choose>
			</td>
			<td>
			  <c:choose>
			   <c:when test="${item.delivery_state=='delivery_prepared'}">
			       <input  type="button" onClick="fn_cancel_order('${item.order_id}')" value="주문취소"  />
			   </c:when>
			   <c:otherwise>
			      <input  type="button" onClick="fn_cancel_order('${item.order_id}')" value="주문취소" disabled />
			   </c:otherwise>
			  </c:choose>
			</td>
			</tr>
          <c:set  var="pre_order_id" value="${item.order_id}" />
           </c:when>
      </c:choose>
	   </c:forEach>
	  </c:otherwise>
    </c:choose> 	    
</tbody>
</table>

<br><br><br>	
<h1 class="h1" >계좌내역
    <a href="#"> <img  src="${contextPath}/resources/image/btn_more_see.jpg" /> </a>
</h1>
<br>

<table class="list_view2" border=1 width=100%  cellpadding=10 cellspacing=10>
<tbody align=center >
  <tr>
    <th colspan="2">
	  Jasmine Point &nbsp;&nbsp;&nbsp;
	</th> 
  </tr>
  <tr class="tr0">
    <td>
	   예치금 &nbsp;&nbsp;&nbsp; <br><strong>10000원</strong>
    </td>
     <td>
	   쇼핑머니  &nbsp;&nbsp; <br><strong>9000원</strong>
    </td>
   </tr>
   <tr class="tr1">
    <td>
	   쿠폰  &nbsp;&nbsp;  <br><strong>6000원</strong>
   </td>
    <td>
	   포인트  &nbsp;&nbsp; <br><strong>2000원</strong>
   </td>
   </tr>
   <tr class="tr2">
    <td>
	   상품권  &nbsp;&nbsp;  <br><strong>4000원</strong>
   </td>
    <td>
	디지털머니  &nbsp;&nbsp; <br><strong>9000원</strong>
   </td>
   </tr>
   </tbody>
</table>

<br><br><br>	
<h1 class="h2">내정보
    <a href="#"> <img  src="${contextPath}/resources/image/btn_more_see.jpg" />  </a>
</h1>
<br>
<table class="list_view2" border=1 width=100%  cellpadding=10 cellspacing=10 style="padding:5px">

	<tr class="info-1">
	<th colspan="2">
	  MyInfo &nbsp;&nbsp;&nbsp;
	</th>
	</tr>
  <tr class="info0">
    <td>
	   이메일:
   </td>
    <td>
	   <strong>${memberInfo.email1 }@${memberInfo.email2 }</strong>
   </td>
   </tr>
   <tr class="info1">
    <td>
	   전화번호 
   </td>
    <td>
	   <strong>${memberInfo.hp1 }-${memberInfo.hp2}-${memberInfo.hp3 }</strong>
   </td>
   </tr>
   <tr class="info2">
   
    <td rowspan=2>주소
   </td>
    <td >
		도로명:  &nbsp;&nbsp; <strong>${memberInfo.roadAddress }</strong>  <br>
   </td>
   </tr>
   <tr class="info3">
   <td>
  	 	지번:   &nbsp;&nbsp; <strong>${memberInfo.jibunAddress }</strong>
   	</td> 
   </tr>
</table>
</body>
</html>
