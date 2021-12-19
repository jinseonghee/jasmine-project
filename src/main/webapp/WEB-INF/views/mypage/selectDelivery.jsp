<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8" />
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>스마트택배 배송조회</title>
  <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" />
  <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap-theme.min.css" />
  <link rel="stylesheet" href="${contextPath}/resources/css/tracking-pink.css" />
</head><body>
	<form method="get" action="${contextPath}/mypage/selectDelivery.do">
		<input type="hidden" class="form-control" id="t_key" name="t_key"
			value="2UOkPl0iU1w0eFG8agdiSg">
		<div class="container-fluid">
			<div class="panel-body">
				<div class="col-md-12 header-title">택배 배송조회</div>
				<div class="col-md-12">
					<div class="form-group row">
						<label for="invoice" class="col-xs-4 label-style">운송장번호</label> 
						<input type="text" class="form-control" name="t_invoice" id="t_invoice"
							placeholder="운송장 번호">
					</div>
					<div class="form-group row">
						<label for="company" class="col-xs-4 label-style">택배사</label>
						<select class="form-control" name="t_code" id="t_code">
							<option value="01" selected="selected">우체국택배</option>
							<option value="04">cj대한통운</option>
							<option value="05">한진택배</option>
							<option value="06">로젠택배</option>
							<option value="08">롯데택배</option>
							<option value="53">농협택배</option>
							<option value="08">롯데택배</option>
							<option value="18">건영택배</option>
							<option value="22">대신택배</option>
							<option value="24">CVSnet 편의점택배</option>
							<option value="12">EMS</option>
							<option value="99">롯데글로벌 로지스</option>
							<option value="42">CJ대한통운 국제특송</option>
							<option value="21">Fedex</option>
							<option value="13">DHL</option>
						</select>
					</div>
				</div>
			</div>
			<div style='width:80px;float: right;'>
			<button type="submit" class="btn btn-default">조회하기</button>
			</div>
	</form>
 <div class="col-sm-12">
    <table class="table table-striped">
		<c:forEach var="deliveryVO" items="${deliveryInfo}" varStatus="status">
				<c:if test="${status.count eq 1}">
				<thead>
					<tr>
						<th>시간</th>
						<th>현재 위치</th>
						<th>배송 상태</th>
					</tr>
				</thead>
				</c:if>
				<tr>
				<td>${deliveryVO.timeString}</td>
				<td>${deliveryVO.where}</td>
				<td>${deliveryVO.kind}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>