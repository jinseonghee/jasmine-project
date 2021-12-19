<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<style> 

#topMenu { 
 margin:20px 0px 20px 0px;

}

#topMenu ul li { 
 list-style: none; 
 color: white; 
 background-color: #2d2d2d; 
 float: left;
 line-height:35px;
 vertical-align: middle; 
 text-align: center; 
 width : 200px;
 }
 
 #topMenu .menuLink { 
 text-decoration:none; 
 color: #F2F2F2; 
 display: block; 
 width: 150px; 
 font-size: 14px; 
 font-weight: bold; 
 font-weight: 800px;
 font-family: "Trebuchet MS", Dotum, Arial; 
 border:3px ridge #424242;
 margin:3px;
  }
  
 #topMenu .menuLink:hover { 
 color: red; 
 background-color: #4d4d4d; 
   }
 
   
.main_input{
	border: 2px solid #333333;

}
nav{

	width: 980px
	margin:0px 0px 0px 0px;
}


	.search{
      display:table; margin:auto; padding:0;
      float: left; text-align: center; display:inline-block;
      
	}
#head_link{
	border-top: solid 1px #000000;
	border-bottom: solid 1px #000000;
	border-left: solid 1px #000000;
	border-right: solid 1px #000000;
	border-radius: 5px;
}
</style>
<script type="text/javascript">
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/goods/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data); // JSON형식으로 넘어왔기 때문에 파싱 후 스크립트배열에 넣음.
			    // json data key인 keyword의 value를 스크립트 var에 배열로 담음.
				displayResult(jsonInfo);
			    // 담은 배열객체를 displayResult로 뽑아서 비동기 처리함.
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		}else{
		    hide('suggest');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show(elementId) {
		 var element = document.getElementById(elementId);
		 if(element) {
		  element.style.display = 'block';
		 }
		}
	
	function hide(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.style.display = 'none';
	   }
	}

</script>
<body>
	<div id="logo" >
	<a href="${contextPath}/main/main.do">
		<img width="185" height="100" alt="booktopia" src="${contextPath}/resources/image/logo.png">
		</a>
	
	 <%-- <div id="head_link">
	
		<ul>
		   <c:choose>
		     <c:when test="${isLogOn==true and not empty memberInfo }"><!-- MemberControlleriImpl 에서 설정한 isLogOn으로 컨트롤 -->
			   <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
			   <li><a href="${contextPath}/mypage/myPageMain.do">마이페이지</a></li>
			   <li><a href="${contextPath}/cart/myCartList.do">장바구니</a></li>
			   <li><a href="${contextPath}/mypage/selectDelivery.do">주문배송</a></li>
			 </c:when>
			 <c:otherwise>
			   <li><a href="${contextPath}/member/loginForm2.do">로그인</a></li>
			   <li><a href="${contextPath}/member/memberForm.do">회원가입</a></li> 
			 </c:otherwise>
			</c:choose>
			   <li><a href="${contextPath}/board/listArticles.do">고객센터</a></li>
         <c:if test="${isLogOn == true and memberInfo.member_id == 'admin' }">  
	   	   <li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
	    </c:if>
			  
		</ul>
		</div>  --%>
 <div class="search" style="width:1000px; height:20px;  border-color: #c0c91a;">
		<form name="frmSearch" action="${contextPath}/goods/searchGoods.do" >
			<input style="width:400px; height:25px;"name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()"> 
			<strong><input type="submit" style="background-color:black; font-weight:bold;font-weight:800px; color:#E6E6E6; width:50px; height:auto;" name="search" class="btn1" value="검색"  ></strong>
		</form>
	</div>
	<div style="width:1000px; height:20px; " >
	<br>
	<nav id="topMenu" >
	
	 <ul>
	  <li><a class="menuLink" href="#">About us</a></li>
	  <li><a class="menuLink" href="#">Ministries</a></li> 
	  <li><a class="menuLink" href="#">Community</a></li> 
	  <li><a class="menuLink" href="#">Locations</a></li> 
	  <li><a class="menuLink" href="#">Blog</a></li>
	   
	  </ul> 
	  </nav>
	  </div>
	</div>
	<br>
   <div id="suggest"> <!-- style="margin-top: 180px; top: -75; display:inline" -->
        <div id="suggestList"></div>
   </div>
</body>
</html>