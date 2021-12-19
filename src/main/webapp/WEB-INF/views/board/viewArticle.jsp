<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%-- 
<c:set var="article"  value="${articleMap.article}"  />
<c:set var="imageFileList"  value="${articleMap.imageFileList}"  />

 --%>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>

 <!-- bootstrap -->
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
  	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" 
  	crossorigin="anonymous">
  	
   <meta charset="UTF-8">
   <title>글보기</title>
   <style>
     #tr_file_upload{
       display:none;
     }
     #tr_btn_modify{
       display:none;
     }
  .back_color{
  background-color:#585858;
  }
   </style>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
   
     function backToList(obj){
	    obj.action="${contextPath}/board/listArticles.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){
		 document.getElementById("i_articleNO").disabled=false;
		 document.getElementById("i_articleNO").readOnly=true;
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("i_imageFileName").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_file_upload").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/board/modArticle.do";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,articleNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","articleNO");
	     articleNOInput.setAttribute("value", articleNO);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
	 function fn_reply_form(url, parentNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "get");
		 form.setAttribute("action", url);
	     var parentNOInput = document.createElement("input");
	     parentNOInput.setAttribute("type","hidden");
	     parentNOInput.setAttribute("name","parentNO");
	     parentNOInput.setAttribute("value", parentNO);
		 
	     form.appendChild(parentNOInput);
	     document.body.appendChild(form);
		 form.submit();
	 }
	 
	 function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     }
	 }  
 </script>
</head>
<body>
<div class = "container" >
	<div class="row">
		<table class="table table-light"  style="text-align:center; border:2px solid #DCDCDC; width:780px;">
  <form name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data">
  <thead>
  <h3 style="margin:30px 0px 30px 0px; font-weight:bold; font-weight:750px; font-size:20px;">게시판 글 보기</h3>
  <tr>
	<th colspan="6" style="background-color: #585858; color:#ffffff;  text-align: center;"></th>
  </tr>
 </thead>
 
 <tbody>
	
  	<tr>
   	<td  align="center" style="background-color: #585858; color:#ffffff; width="300">
   	글번호
   	</td>
   	<td>
    <input type="text" name="articleNO" id="i_articleNO" value="${article.articleNO}"  rows="50" disabled style="width:100%; border:1; color : #828282"/>
  	</td>
  	 <td class="back_color"></td>
    </tr>
   	
	
  	<tr>
    <td  align="center" style="background-color: #585858; color:#ffffff;">
        작성자 아이디
    </td>
    
    <td>
    <input type=text value="${article.id}" name="writer" style="width:100%; border:1;"  disabled />
    </td>
     <td class="back_color"></td>
    </tr>
    
    <tr>
    <td width="150" align="center" style="background-color: #585858; color:#ffffff;">
         제목 
    </td>
    <td>
    <input type=text value="${article.title}"  name="title"  id="i_title" style="width:100%; border: 1;" disabled />
    </td>   
     <td class="back_color"></td>
    </tr>
  
    <tr>
    <td width="150" align="center" style="background-color: #585858; color:#ffffff;">
         내용
    </td>
    <td>
    <textarea rows="20" cols="60"  name="content"  id="i_content"  disabled />${article.content}</textarea>
   </td> 
    <td class="back_color"></td> 
   </tr>
	
	<tr>
	<!-- <td align="center" style="background-color: #585858; color:#ffffff;">
	  이미지
    </td> -->
	
  	<c:choose> 
	<c:when test="${not empty article.imageFileName && article.imageFileName!='null' }">
 		<td width="150" align="center" style="background-color: #585858; color:#ffffff;">
		    이미지
	   </td>
	   <td>
	   		<input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
		    <img src="${contextPath}/download.img.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview" /><br>
		    <input  type="file"  name="imageFileName" id="i_imageFileName"   disabled   onchange="readURL(this);"   />
	   </td>   
	    <td class="back_color"></td>
	</tr>  
	 </c:when>
		<c:otherwise>
		 <tr id="tr_file_upload" >
				    <td width="150" align="center"style="background-color: #585858; color:#ffffff;"  rowspan="2">
				    </td>
				    <td>
				      <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
				    </td>
				     <td class="back_color"></td>
		</tr>
		 	<tr>
           	<td colspan="5" style="background-color:#585858;">
           	</td>
           	</tr>
		<tr>    
		<td style="background-color:#585858; color:#ffffff;">파일첨부</td>
			        <td  >
				       <img id="preview"  /><br>
				       <input  type="file"  name="imageFileName " id="i_imageFileName" disabled onchange="readURL(this);"  />
				    </td>
				     <td class="back_color"></td>
		</tr>
	         <tr>
           <td class="back_color" ></td>
           <td colspan = "1"><img id="preview" src="#" width=100% height=200 /></td>
           <td class="back_color" ></td>  
      </tr>     
		
		 </c:otherwise>
	 </c:choose>
	 
  <tr>
	   <td align="center" style="background-color: #585858; color:#ffffff;">
	      등록일자
	   </td>
	   <td>
	    <input type=text value="<fmt:formatDate value="${article.writeDate}" />" style="width:100%; border:1;" disabled />
	   </td>
	    <td class="back_color"></td>   
  </tr>
  
  <tr id="tr_btn_modify"  align="center" >
	   <td colspan="2">
	       <input type=button value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  >
           <input type=button value="취소"  onClick="backToList(frmArticle)">
	   </td>
	   <td class="back_color"></td>   
  </tr>
    
  <tr id="tr_btn" >
   <td colspan="6" align="center" style="background-color:#585858;">
       <c:if test="${memberInfo.member_id == article.id }">
	      <input type=button style="background-color:#ffffff;" value="수정하기" class="btn btn-outline-dark" onClick="fn_enable(this.form)" />
	      <input type=button style="background-color:#ffffff;" value="삭제하기" class="btn btn-outline-dark" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})"/>
	    </c:if>
	    <input type=button  style="background-color:#ffffff;" value="리스트로 돌아가기" class="btn btn-outline-dark" onClick="backToList(this.form)">
  		<input type=button value="답글쓰기" style="background-color:#ffffff;" class="btn btn-outline-dark" onClick="fn_reply_form('${contextPath}/board/replyForm.do', ${article.articleNO})">	    	

   </td>
  </tr>
  
  </tbody>
  
 </table>
 </form>
 </div>

    <!-- bootstrap  -->
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MV BnE+IbbVYUew+OrCXaRkfj" 
	crossorigin="anonymous">
	</script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
 	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
  	crossorigin="anonymous">
  	</script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
 	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" 
 	crossorigin="anonymous">
 	</script>			 -->	


</body>
</html>