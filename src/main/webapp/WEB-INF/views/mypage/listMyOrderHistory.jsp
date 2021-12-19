 <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta   charset="utf-8">
<script>
function search_order_history(fixedSearchPeriod){
	var formObj=document.createElement("form");
	var i_fixedSearch_period = document.createElement("input");
	i_fixedSearch_period.name="fixedSearchPeriod";
	i_fixedSearch_period.value=fixedSearchPeriod;
    formObj.appendChild(i_fixedSearch_period);
    document.body.appendChild(formObj); 
    formObj.method="get";
    formObj.action="${contextPath}/mypage/listMyOrderHistory.do";
    formObj.submit();
}

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
	img.relative{
	position: relative;
	left: 50px;
	padding: 10px;
	border-top: solid 3px #F2F2F2;
	border-bottom: solid 3px #F2F2F2;
	border-left: solid 3px #F2F2F2;
	border-right: solid 3px #F2F2F2;
	}
	.bs{
	width:100%;
	 border: solid 1px #6E6E6E;
	}
	
	th, td{
	border-bottom: 1px dotted #6E6E6E;
	padding: 10px;
	text-align: left;
	}
	
	.btns{
		font-family:"Arial Black",snas-serif;
      	color:#555555
      	font-size: 36px;
      	color: #000000;
      	text-shadow: 1px 1px 1px gray;
      	font-weight:600;
	}	
	.h3{
		font-family:"Arial Black",snas-serif;
      	color:#555555
      	font-size: 20px;
      	color: #000000;
      	text-shadow: 1px 1px 1px gray;
      	font-weight:600;
	}
	.bs{
	border-radius: 80px / 40px;
	}
	.view{
		font-family:"Arial Black",snas-serif;
      	color:#555555
      	font-size: 36px;
      	font-weight: 600;
      	color: #000000;
      	text-shadow: 2px 2px 2px #A4A4A4;
	}
	
	
</style>
</head>
<body>
	
	<H3 class="h3">주문 배송 조회</H3><hr>
	<form  method="post">	
		<table class="bs" frame=void>
			<tbody>
				</tr>
				<tr>
					<td>
					  <select name="curYear">
					    <c:forEach   var="i" begin="0" end="5" >
					      <c:choose>
					        <c:when test="${endYear==endYear-i }">
					          <option value="${endYear}" selected>${endYear}</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${endYear-i }">${endYear-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 <select name="curMonth" >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${endMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					
					 <select name="curDay">
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일  &nbsp;이전&nbsp;&nbsp;&nbsp;&nbsp; 
					<div class="btn-group btn-group-sm" >
					<a href="javascript:search_order_history('two_week')">
					<button type="button" style="width:auto; height:auto; font-size:12px" class="btn btn-outline-Secondary" id="btns">1주일</button></a>
					<a href="javascript:search_order_history('one_month')">
					<button type="button" style="width:auto; height:auto; font-size:12px" class="btn btn-outline-Secondary" id="btns">1개월</button></a>
					<a href="javascript:search_order_history('three_month')">
					<button type="button" style="width:auto; height:auto; font-size:12px" class="btn btn-outline-Secondary" id="btns">3개월</button></a>
					</div>
					</td>
				</tr>
				<tr>
				  <td>
				    <select name="search_condition">
						<option value="2015" checked>전체</option>
						<option value="2014">수령자</option>
						<option value="2013">주문자</option>
						<option value="2012">주문번호</option>
					</select>
					<input  type="text"  size="30" />  
					<input   type="button"  value="조회"/>
				  </td>
				</tr>
				<tr>
				  <td>
							<input  type="date"  size="4" value="${beginYear}" />년
							<%-- <input  type="text"  size="4" value="${beginMonth}"/>월	
							 <input  type="text"  size="4" value="${beginDay}"/>일 --%>	
							 &nbsp; ~
							<input  type="date"  size="4" value="${endYear}" />년 
							<%-- <input  type="text"  size="4" value="${endMonth}"/>월	
							 <input  type="text"  size="4" value="${endDay}"/>일	 --%>						 
				  </td>
				</tr>
			</tbody>
		</table>
		<div class="clear">
	</div>
</form>	
<div class="clear"></div>
<table class="list_view">
		<tbody align=center >
			<tr style="background: linear-gradient(to bottom, #000000, #A4A4A4); color:#F2F2F2;" class="view" >
				<td class="fixed" >주문번호</td>
				<td class="fixed">주문일자</td>
				<td>주문내역</td>
				<td>주문금액/수량</td>
				<td>주문상태</td>
				<td>주문자</td>
				<td>수령자</td>
				<td>주문취소</td>
				<td>주문조회</td>
			</tr>
			
   <c:choose>
     <c:when test="${empty myOrderHistList }">			
			<tr>
		       <td colspan=8 class="fixed">
				  <strong>주문한 상품이 없습니다.</strong>
			   </td>
		     </tr>
	 </c:when>
	 <c:otherwise> 
     <c:forEach var="item" items="${myOrderHistList }" varStatus="i">
        <c:choose>
          <c:when test="${item.order_id != pre_order_id }">   
            <tr>       
				<td>
				  <a href="${contextPath}/mypage/myOrderDetail.do?order_id=${item.order_id }"><strong>${item.order_id }</strong>  </a>
				</td>
				<td >
				 <strong>${item.pay_order_time }</strong> 
				</td>
				<td> 
				    <strong>
					   <c:forEach var="item2" items="${myOrderHistList}" varStatus="j">
				          <c:if  test="${item.order_id ==item2.order_id}" >
				            <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item2.goods_id }">${item2.goods_title }</a><br>
				         </c:if>   
					 </c:forEach>
					 </strong>
				</td>
				<td>
				   <strong>
				      <c:forEach var="item2" items="${myOrderHistList}" varStatus="j">
				          <c:if  test="${item.order_id ==item2.order_id}" >
				             ${item.goods_sales_price*item.order_goods_qty }원/${item.order_goods_qty }<br>
				         </c:if>   
					 </c:forEach>
				   </strong>
				</td>
				<td>
				  <strong>
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
					       반품
					    </c:when>
				  </c:choose>
				  </strong>
				</td>
				<td>
				 <strong>${item.orderer_name }</strong> 
				</td>
				<td>
					<strong>${item.receiver_name }</strong>
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
 			    <td>
				  <a href="${contextPath}/mypage/selectDelivery.do"> 
				   		<input type="button" value="배송추적"/> 
				   </a>
			   	</td>
			</tr>
			<c:set  var="pre_order_id" value="${item.order_id }" />
		   </c:when>	
	  </c:choose>		
	</c:forEach>
	</c:otherwise>
  </c:choose>			   
		</tbody>
	</table>
	
	<br><div><br>
	<img src="${contextPath}/resources/image/200.jpg" class="relative">
	</div>
	<div class="clear"></div>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>