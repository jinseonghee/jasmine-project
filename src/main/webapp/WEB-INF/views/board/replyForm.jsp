<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
   request.setCharacterEncoding("UTF-8");
%>

<head>

<meta charset="UTF-8">
<!-- bootstrap -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
   integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
   crossorigin="anonymous">

<script src="//code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
   function backToList(obj) {
      obj.action = "${contextPath}/board/listArticles.do";
      obj.submit();
   }

   function readURL(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function(e) {
            $('#preview').attr('src', e.target.result);
         }
         reader.readAsDataURL(input.files[0]);
      }
   }
</script>
<style>
#back_color{

}
</style>
<title>답글쓰기 페이지</title>
</head>

<body>
   <div class="container">
      <div class="row">
         <form name="frmReply" method="post"
            action="${contextPath}/board/addReply.do"
            enctype="multipart/form-data">
            
            <table class="table table-light" 
               style="text-align: center; margin: 15px 0px 0px 10px; border: solid 5px #ffffff; background-color: #585858; width: 700px; color:#e6e6e6;">
               <thead>
                  <tr>
                     <th colspan="2"
                        style="background-color: #585858; text-align: center;">답글
                        쓰기</th>
                  </tr>
               </thead>

               <tbody>
                  <tr>
                     <td align="center" bgcolor="#585858">작성자</td>
                     <td><input type="text" name="writer"
                        value="${memberInfo.member_id } " readonly
                        style="width: 100%; border: 1;" /></td>
                  </tr>

                  <tr>
                     <td align="center" bgcolor="#585858">제목</td>
                     <td><input type="text" maxlength="500" name="title"
                        style="width: 100%; border: 1;" /></td>
                  </tr>

                  <tr>
                     <td align="center" valign="top" bgcolor="#585858"><br><br><br><br><br><br><br><br><br><br>내용</td>
                     <td><textarea name="content" rows="20" cols="60"> </textarea>
                     </td>
                  </tr>

                  <tr>
                     <td align="center" bgcolor="#585858">비밀번호</td>
                     <td><input type="password" size="10" maxlength="12"
                        name="passwd" style="width: 100%; border: 1;" > </input></td>
                  </tr>
                  <tr>
                     <td align="center" bgcolor="#585858">이미지파일 첨부</td>
                     <td><input type="file" name="imageFileName"dURL(this);"></td>
                  </tr>
					         <tr>
	         <tr>
        <%--    <td id="back_color" ></td>
           <td style="background-color:#ffffff;" colspan = "1"><img id="preview" src="#" width=100% height=200 /></td>
           <td id="back_color" ></td>  
    	    </tr>     
			--%>	
                  <!-- 
           <td>    
            <img id="preview" src="#" width=200 />
            </td>
             -->
                  
                  <tr>
                     <td colspan="2"><input type=submit value="답글쓰기"
                        class="btn btn-outline-secondary" style="background-color:#ffffff;"/> <input type=button
                        value="취소" class="btn btn-outline-secondary" style="background-color:#ffffff;"
                        onClick="backToList(this.form)" /></td>
                  </tr>
            </table>

         </form>

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

         </tbody>
      </div>
   </div>

</body>
</html>