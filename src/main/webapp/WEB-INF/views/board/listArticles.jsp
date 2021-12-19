<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set  var="articlesList"  value="${articlesMap.articlesList}" />
<c:set  var="totArticles"  value="${articlesMap.totArticles}" />
<c:set  var="section"  value="${articlesMap.section}" />
<c:set  var="pageNum"  value="${articlesMap.pageNum}" />

<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
 <style>
 
   a{
   color:#424242;
   }
  .myDiv{
    width: 100%;
    border: 1px solid #D8D8D8;
  }
   table {
    width: 100%;
    border-bottom: 1px solid #D8D8D8;
    border-top: 1px solid #D8D8D8;
  }
  td{
   border-bottom: 1px solid #D8D8D8;
    padding: 10px;
  }
   .cls1 {text-decoration:none;}
   .cls2{text-align:center; font-size:20px; }
   
   .right2{
       text-align:left;
         color:#555555
         font-size: 10px;
         color: #000000;
         text-shadow: 1px 1px 1px gray;
         font-weight:300;
   }
   #gogak_left{
   border-bottom: 1px solid #D8D8D8;
         font-family:"Arial Black",snas-serif;
         color:#555555
         font-size: 36px;
         text-shadow: 1px 1px 1px gray;
         font-weight:600;
         text-align:left;
   }
   #gogak_right{
      border-bottom: 1px solid #D8D8D8;
         font-family:"Arial Black",snas-serif;
         color:#555555
         font-size: 36px;
         text-shadow: 1px 1px 1px gray;
         font-weight:600;
         text-align:right;
   }
   .box_td{
     border-bottom: 1px solid #FFFFFF;
         border-spacing:5px 5px;
         font-size: 15px;
         text-shadow: 1px 1px 1px #FBEFEF;
         font-weight:500;
         color:#FAFAFA;
   }
   .table table-hover" {
   bord er-spacing:5px 5px;
   }
   
 
 </style>
  <meta charset="UTF-8">
  <title>글목록창</title>
</head>
<script>
   function fn_articleForm(isLogOn,articleForm,loginForm){
     if(isLogOn != '' && isLogOn != 'false'){
       location.href=articleForm;
     }else{
       alert("로그인 후 글쓰기가 가능합니다.")
       location.href=loginForm+'?action=/board/articleForm.do';
     }
   }
</script>
<body>
<div class="myDiv" style="
    margin-right: 0px;
    margin-left: 5px;
">
   <div>
   <table>
  <tr>
  <td id="gogak_left">고객 센터</td> 
  <td id="gogak_right">문의사항</td>
</tr>
</table>
</div>
<form>
<table align="center"  width="100%" class="table table-hover"  >
  <tr class="box_td" style="width:100%; height:15px; background: linear-gradient(to bottom, #000000, #A4A4A4); color:#FFFFFF; text-align:center;"  >
      <td width="10%"><input type="checkbox" name="chk" /></td>
     <td >번호</td>
     <td >작성자</td>
     <td >제목</td>
     <td >작성일</td>
     </tr>
<c:choose>
  <c:when test="${empty articlesList}" >
    <tr  height="10">
      <td colspan="4">
      
      
      
      
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
  </c:when>
  <c:when test="${!empty articlesList}" >
    <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
     <tr align="center">
    <td 쟝소="5%"><input type="checkbox" name="chk" /></td>
   <td width="5%">${articleNum.count}</td>
   <td width="10%">${article.id }</td>
   <td align='left'  width="35%">
       <span style="padding-right:30px"></span>    
      <c:choose>
         <c:when test='${article.level > 1 }'>  
            <c:forEach begin="1" end="${article.level }" step="1">
                <span style="padding-left:10px"></span> 
            </c:forEach>
            <span style="font-size:12px; color:red;">[답변]</span>
                   <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
             </c:when>
             <c:otherwise>
               <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
             </c:otherwise>
           </c:choose>
     </td>
     <td  width="10%"><fmt:formatDate value="${article.writeDate}" /></td> 
   </tr>
    </c:forEach>
     </c:when>
    </c:choose>
</table>
<!-- <<<<<<< HEAD -->

<div class="cls2">
 <c:if test="${totArticles != null }" >
      <c:choose>
        <c:when test="${totArticles >100 }">  <!-- 글 개수가 100 초과인경우 -->
         <c:forEach   var="page" begin="1" end="10" step="1" >
            <c:if test="${section >1 && page==1 }">
             <a class="no-uline" href="${contextPath }/board/listArticles.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; pre </a>
            </c:if>
             <a class="no-uline" href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
            <c:if test="${page ==10 }">
             <a class="no-uline" href="${contextPath }/board/listArticles.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
            </c:if>
         </c:forEach>
        </c:when>
        <c:when test="${totArticles ==100 }" >  <!--등록된 글 개수가 100개인경우  -->
         <c:forEach   var="page" begin="1" end="10" step="1" >
           <a class="no-uline"  href="#">${page } </a>
         </c:forEach>
        </c:when>
        
        <c:when test="${totArticles< 100 }" >   <!--등록된 글 개수가 100개 미만인 경우  -->
         <c:forEach   var="page" begin="1" end="${totArticles/10 +1}" step="1" >
            <c:choose>
              <c:when test="${page==pageNum }">
               <a class="sel-page"  href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}">${page } </a>
             </c:when>
             <c:otherwise>
               <a class="no-uline"  href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}">${page } </a>
             </c:otherwise>
           </c:choose>
         </c:forEach>
        </c:when>
      </c:choose>
    </c:if>
</div>    
<br><br>
<%-- <a  class="cls1"  href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do', 
                                                    '${contextPath}/member/loginForm.do')"><button type ="button" class="btn btn-outline-info" id="btns">글쓰기</button></a> --%>
<!-- ======= -->
  <div style='width:80px;float: right;'>
   <tr>
   <br>
   <a  class="cls1"  href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do', 
                                                    '${contextPath}/member/loginForm.do')"><button type ="button" 
                                                    style="width:85px; height:35px; font-size:15px; font-color:red;"
                                                    class="btn btn-outline-dark" id="btns2" >글쓰기
                                                    </button></a></tr></div>
                                                    
                                                    <!-- 
                                                    style="width:30px; height:30px; font-size:30px; font-color:red;"
                                                    class="btn btn-outline-dark" id="btns2" >글쓰기
                                                    </button></a></tr></div>
                                        -->

</form>
</div>
<!-- <a  class="cls1"  href="#"><p class="cls2">글쓰기</p></a> -->
<!-- >>>>>>> origin/feature/khm2 -->
</body>
</html>