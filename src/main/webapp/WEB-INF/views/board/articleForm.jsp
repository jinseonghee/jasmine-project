<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
  request.setCharacterEncoding("UTF-8");
%> 
<html lang="ko">
  <head>
  <!-- bootstrap -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
     integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" 
     crossorigin="anonymous">
     
     
    <meta charset="UTF-8">
    <title>게시판글쓰기</title>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
 
   <script type="text/javascript">
   
   function readURL(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function (e) {
           $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
  function backToList(obj){
    obj.action="${contextPath}/board/listArticles.do";
    obj.submit();
  }
  
  var cnt=1;
  function fn_addFile(){
     $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
     cnt++;
  }  


</script>
<style>
th{
color:#ffffff;
background-color:#585858;
width:30px;
font-size:12px;
font-align:center;
}
.back_color{
background-color:#585858;
}
</style>
 </head>
  
 <body>
 <!-- <div class="container"> -->
  <form name="articleForm" method="post" action="${contextPath}/board/addNewArticle.do" enctype="multipart/form-data">
  <h3 style="font-weight:bold; font-weight:700px; font-size:20px; margin:30px 0px 30px 0px;">게시판 글 작성</h3>
   <table class="table table-bordered">
  <tr>
   <th colspan="6" style="background-color: #585858; text-align: center; padding:20px;"></th>
  </tr>
        <tr>
            <th style="text-align:center;">작성자</th>
            <td colspan="4"><input type="text" name="id" value="${memberInfo.member_name}" readonly class = "form-control" /> </td>
            <td class="back_color"></td>
      </tr>
          <tr>
                <th style="text-align:center;">글 제목</th>
                <td colspan="4"><input type="text"  name="title" class="form-control"/></td>
                <td class="back_color"></td>
       </tr>
       <tr>
       <th style="text-align:center;"><br><br><br>글 내용</th>
       <td colspan="4">
    <!-- </table> -->
    <!-- <div id="summernote"></div> -->
    <textarea colspan="5" id="summernote" name="content"></textarea>
    <script>
      $('#summernote').summernote({
        placeholder: '내용을 작성 해 주세요.',
        tabsize: 2,
        //height: 120,
        height: 300,                 // set editor height
        //minHeight: null,             // set minimum height of editor
        //maxHeight: null,             // set maximum height of editor
        //focus: true        
        
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
   <!-- <table class="table table-bordered"> -->
   <td class="back_color"></td>
          </tr>
          
		   <tr>
           	<th colspan="6" style="text-align:center;"></th>
           </tr>
           
            <tr>
            <th style="width:15.6%; text-align:center;" >파일 첨부</th>
            <td colspan="4" style="text-align:center;"><input type="file" name="imageFileName"  onchange="readURL(this);" class = "form-contorl" /></td>
            <td class="back_color"></td>
           </tr>
         
         <tr>
           <td  class="back_color"></td>
           <td colspan = "4"><img id="preview" src="#" width=100% height=200 /></td>
           <td class="back_color" ></td>  
      </tr>     
           
     <tr>
       <td align="center" colspan="6" style="background-color:#585858;">
          <input type="submit" value="등록하기"  class="btn btn-secondary" class = "form-control"/>
          <input type=button value="목록보기"  class="btn btn-secondary" onClick="backToList(this.form)" />
         </td>
     </tr>  
     
     
    
   </table>
    </form>    
   <!-- </div> -->
    

      <!-- bootstrap  -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
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
    </script>
    
  </body>
</html>