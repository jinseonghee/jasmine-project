<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>카카오 아이디로 회원가입이 되어있습니다.</h1>
	<form action="${contextPath}/member/login.do" method="post">
		<input type="submit" value="로그인하기">
	</form>
</body>
</html>