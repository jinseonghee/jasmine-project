<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1"> 


<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
 

<style>
 
.fixed a{
 margin: 10px 0px 0px 0px;
 border-right: solid 1px #6E6E6E;
 text-align: center;
 width:8px;
 height:8px;
 
} 
.rev{
border: solid 1px #6E6E6E;
padding:3px;
}

a{
color:#000000;
}
.goods_enrollment{
     	font-family:"Arial Black",snas-serif;
      	font-size: 13px;
      	font-weight: 500;
      	color: #000000;
      	text-shadow: 1px 1px 1px #A4A4A4;
        float: right; dispaly:inline-block;
}
.date_search{
      	font-family:"Arial Black",snas-serif;
      	color:#555555
      	font-size: 20px;
      	font-weight: 500;
      	color: #000000;
      	text-shadow: 1px 1px 1px #A4A4A4;
}
.goods_lookup{
		font-family:"Arial Black",snas-serif;
      	font-size: 20px;
      	font-weight: 700;
      	color: #000000;
      	text-shadow: 1px 1px 1px #A4A4A4;
}


.line_gray{
 border-bottom: solid 1px #6E6E6E;
 border-right: solid 1px #6E6E6E;
 border-left: solid 1px #6E6E6E;
 border-top: solid 1px #6E6E6E; 
 
}
.line_td{
padding-bottom:10px;
}


.text_view{
		font-family:"Arial Black",snas-serif;
      	font-size: 15px;
      	font-weight: bold;
      	font-weight: 650;
      	color: #000000;
      	text-shadow: 2px 2px 2px #gray;
}

border-bottom:  0px;
}
a{
color:#424242;
}

</style>
<script>
function search_goods_list(fixeSearchPeriod){
	var formObj=document.createElement("form");
	var i_fixedSearch_period = document.createElement("input");
	i_fixedSearch_period.name="fixedSearchPeriod";
	i_fixedSearch_period.value=searchPeriod;
    formObj.appendChild(i_fixedSearch_period);
    document.body.appendChild(formObj); 
    formObj.method="get";
    formObj.action="${contextPath}/admin/goods/adminGoodsMain.do";
    formObj.submit();
}


function  calcPeriod(search_period){
	var dt = new Date();
	var beginYear,endYear;
	var beginMonth,endMonth;
	var beginDay,endDay;
	var beginDate,endDate;
	
	endYear = dt.getFullYear();
	endMonth = dt.getMonth()+1;
	endDay = dt.getDate();
	if(search_period=='today'){
		beginYear=endYear;
		beginMonth=endMonth;
		beginDay=endDay;
	}else if(search_period=='one_week'){
		beginYear=dt.getFullYear();
		beginMonth=dt.getMonth()+1;
		dt.setDate(endDay-7);
		beginDay=dt.getDate();
		
	}else if(search_period=='two_week'){
		beginYear = dt.getFullYear();
		beginMonth = dt.getMonth()+1;
		dt.setDate(endDay-14);
		beginDay=dt.getDate();
	}else if(search_period=='one_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-1);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='two_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-2);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='three_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-3);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='four_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-4);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}
	
	if(beginMonth <10){
		beginMonth='0'+beginMonth;
		if(beginDay<10){
			beginDay='0'+beginDay;
		}
	}
	if(endMonth <10){
		endMonth='0'+endMonth;
		if(endDay<10){
			endDay='0'+endDay;
		}
	}
	endDate=endYear+'-'+endMonth +'-'+endDay;
	beginDate=beginYear+'-'+beginMonth +'-'+beginDay;
	//alert(beginDate+","+endDate);
	return beginDate+","+endDate;
}
</script>
</head>
<body>
	<H3 class="goods_lookup">상품 조회</H3>
	<form  method="post" class="line_gray" >	
		<TABLE  cellpadding="10" cellspacing="10" style="border-bottom-color: rgb(102, 102, 102); border-bottom-width: 1px; border-bottom-style: solid; width:775px;">
			<TBODY >
				<tr class="gray_line"> 
					<TD class="date_search" style="background: linear-gradient(to bottom, #000000, #A4A4A4); color:#FAFAFA;">
						<input type="radio" name="r_search"  checked/>등록일로조회 &nbsp;&nbsp;&nbsp;
						<input type="radio" name="r_search" />상세조회 &nbsp;&nbsp;&nbsp;
					</TD>
				</TR>
				<tr class="gray_line"> 
					<td class="line_td">
					<br>
					  <select name="curYear">
					    <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${endYear==endYear-i}">
					          <option value="${endYear}" selected>${endYear}</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${endYear-i }">${endYear-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select><strong>년</strong> <select name="curMonth" >
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
					</select><strong>월</strong>
					
					 <select name="curDay">
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i}">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select><strong>일 </strong> &nbsp;<strong>이전</strong>&nbsp;&nbsp;&nbsp;&nbsp; 
					<a href="javascript:search_goods_list('one_week')">
					   <button type="button" style="text-align:center; font-size:10px; width:auto; height:auto;"" class="btn btn-outline-dark" id="change">1주</button>
					</a>
					<a href="javascript:search_goods_list('one_month')">
					   <button type="button" style="text-align:center; font-size:10px; width:auto; height:auto;"" class="btn btn-outline-dark" id="change">1개월</button>
					</a>
					<a href="javascript:search_goods_list('three_month')">
					   <button type="button" style="text-align:center; font-size:10px; width:auto; height:auto;" class="btn btn-outline-dark" id="change">3개월</button>
					</a>
					&nbsp;<strong>까지 조회</strong>
					</TD>
				</TR>
				<tr class="gray_line">
				  <td class="line_td">
				  <br>
				    <select name="search_condition" disabled >
						<option value="전체" checked>전체</option>
						<option value="제품번호">상품번호</option>
						<option value="제품이름">상품이름</option>
						<option value="제조사">제조사</option>
					</select>
					<input  type="text"  size="30"  disabled/>  
					<input   type="button"  value="조회" disabled/>
				  </td>
				</tr>
				<tr class="gray_line">
				  <td class="line_td">
				  <br>
					<strong>조회한 기간</strong>&nbsp; : &nbsp;<input  type="text" style="width:auto; height:auto; font-size:11.3px;" size="4" value="${beginYear}" /><strong>년</strong>
							<input  type="text"  style="width:auto; height:auto; font-size:11.3px;" size="4" value="${beginMonth}"/><strong>월</strong>	
							 <input  type="text" style="width:auto; height:auto; font-size:11.3px;"  size="4" value="${beginDay}"/><strong>일</strong>	
							 &nbsp; ~
							<input  type="text" style="width:auto; height:auto; font-size:11.3px;" size="4" value="${endYear }" /><strong>년</strong> 
							<input  type="text" style="width:auto; height:auto; font-size:11.3px;"  size="4" value="${endMonth }"/><strong>월</strong>	
							 <input  type="text" style="width:auto; height:auto; font-size:11.3px;"  size="4" value="${endDay }"/><strong>일</strong> 							 
				  </td>
				</tr>
			</TBODY>
		</TABLE>
		<DIV class="clear">
	</DIV>
</form>	
<DIV class="clear"></DIV>
<TABLE class="list_view">
		<TBODY align=center >
			<tr id="text_view" style="background: linear-gradient(to bottom, #000000, #A4A4A4); 
			font-weight:bold; font-weight:700px; font-size:12.8px; color:#FFFFFF; text-align:center; border-bottom:0.1px solid #848484;" >
				<td>상품번호</td>
				<td>상품이름</td>
				<td>저자</td>
				<td>출판사</td>
				<td>상품가격</td>
				<td>입고일자</td>
				<td>출판일</td>
			</tr>
   <c:choose>
     <c:when test="${empty newGoodsList }">			
			<tr class="gray_line">
		       <TD colspan=8 class="fixed">
				  <strong>조회된 상품이 없습니다.</strong>
			   </TD>
		     </TR>
	 </c:when>
	 <c:otherwise>
     <c:forEach var="item" items="${newGoodsList }">
			 <tr class="gray_line">       
				<td class="line_td">
				  <strong>${item.goods_id }</strong>
				</TD>
				<TD >
				 <a href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}">
				    <strong>${item.goods_title } </strong>
				 </a> 
				</TD>
				<td class="line_td">
				<strong>${item.goods_writer }</strong> 
				</TD>
				<TD >
				   <strong>${item.goods_publisher }</strong> 
				</TD>
				<td class="line_td">
				  <strong>${item.goods_sales_price }</strong>
				</td>
				<td class="line_td">
				 <strong>${item.goods_credate }</strong> 
				</td>
				<td class="line_td">
				    <c:set var="pub_date" value="${item.goods_published_date}" />
					   <c:set var="arr" value="${fn:split(pub_date,' ')}" />
					<strong>
					   <c:out value="${arr[0]}" />
					</strong>
				</td>
				
			</TR>
	</c:forEach>
	</c:otherwise>
  </c:choose>
           <tr class="gray_line">
             <td colspan=8 class="fixed" style="border-bottom: solid 1px #F2F2F2; margin:">
             	 <a href="#" class="rev"><strong> 이전 </strong> </a>&nbsp;
                 <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${section >1 && page==1 }">
		          <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }" class="pagenation">&nbsp; &nbsp;</a>
		         </c:if>
		          <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page } </a>&nbsp;
		         
		         <c:if test="${page == 10 }">	      
		          <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section+1}&pageNum=${section*10+1}" class="rev"> <strong> 다음 </strong> </a>
		         </c:if> 
		         
	      		</c:forEach> 
	<form action="${contextPath}/admin/goods/addNewGoodsForm.do">
		<input class="goods_enrollment"   type="submit" style="background-color:black; color:#E6E6E6;" value="상품 등록">
	</form>
     	</td></tr>
		</TBODY>
		
	</TABLE>
	<DIV class="clear"></DIV>
	<br><br><br>
<DIV id="search">
</DIV>
</body>
</html>