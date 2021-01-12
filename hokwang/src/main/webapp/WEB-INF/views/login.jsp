<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>호광병원</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
   integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
   crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
   crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
   href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">

<!-- Custom styles for this template-->
<link
   href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
   rel="stylesheet">

<script>
   $(function() {
      findId();
      findPw();
   });

   function findId() {
      $('#btnId').on("click", function() {
         $.ajax({
            url : "ajax/findId",
            type : "POST",
            dataType : 'json',
            data : {
               emp_name : $('#inputName_1').val(),
               emp_tel : $('#inputPhone_1').val()
            },
            error : function(xhr, status, msg) {
               alert("상태값 :" + status + " Http에러메시지 :" + msg);
            },
            success : function(data) {
               if (data.result == true) {
                  $('#resultId').html(data.employeeVO.emp_no);
                  
               } else {
                  alert("검색결과가 없습니다.")
               }
            } 
         })
      });
      $('#btnX').on("click", function(){
         location.reload();
      })
      $('#Cancel').on("click", function(){
         location.reload();
      })
   }

   function findPw() {
      $('#btnPw').on("click", function() {
         $.ajax({
            url : "ajax/findPw",
            type : "POST",
            dataType : 'json',
            data : {
               emp_no : $('#inputempNo_1').val(),
               emp_tel : $('#inputemptel_1').val()
            },
            error : function(xhr, status, msg) {
               alert("상태값 : " + status + "Http에러메시지 : " + msg);
            },
            success : function(data) {
               if (data.result == true) {
                  $('#resultPw').html(data.employeeVO.emp_pwd);
               } else {
                  alert("검색결과가 없습니다.")
               } 
            }
         })
      })
   }
</script>

</head>

<style>
.page-header {
   height: 95vh;
   background-position: center center;
   background-size: cover;
   margin: 0;
   padding: 0;
   border: 0;
   display: flex;
   align-items: center;
}

.card .card-header {
   border-radius: 3px;
   padding: 1rem 15px;
   margin-left: 15px;
   margin-right: 15px;
   margin-top: -30px;
   border: 0;
   box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.2), 0 13px 24px -11px
      rgb(196 137 206/ 0%);
}

.text-center {
   text-align: center !important;
}

.card-title {
   margin-bottom: 0;
}

.input-group1 {
   /* position: revert;
    display: inline; */
   position: relative;
   display: flex;
   flex-wrap: wrap;
   align-items: stretch;
   width: 100%;
}

.input-group1-prepend {
   margin-right: -1px;
   display: flex;
}

.input-group1 .input-group1-text {
   display: flex;
   justify-content: center;
   align-items: center;
   padding: 0px 15px 0px 15px;
   background-color: transparent;
   margin-bottom: 0;
   font-size: 1rem;
   font-weight: 400;
   line-height: 1.5;
   color: #495057;
   text-align: center;
   white-space: nowrap;
}

.material-icons {
   font-family: 'Material Icons';
   font-weight: normal;
   font-style: normal;
   font-size: 24px;
   line-height: 1;
   letter-spacing: normal;
   text-transform: none;
   display: inline-block;
   white-space: nowrap;
   direction: ltr;
}

.input-group1 .input-group1-prepend .input-group1-text {
   border-top-right-radius: 0;
   border-bottom-right-radius: 0;
}

.form-control {
   background: no-repeat center bottom, center calc(100% - 1px);
   background-size: 0 100%, 100% 100%;
   border: 0;
   height: 36px;
   transition: background 0s ease-out;
   padding-left: 0;
   padding-right: 0;
   border-radius: 0;
   display: block;
   width: 100%;
   padding: 1.5rem 0;
   color: #495057;
   background-image: linear-gradient(to top, #9c27b0 2px, rgba(156, 39, 176, 0)
      2px), linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px);
}

.form-group {
   margin-bottom: 17px;
   position: relative;
}

.bmd-form-group {
   padding-top: 27px;
}

.bmd-form-group .bmd-help {
   margin-top: 0;
   font-size: 1rem;
}

.bmd-help {
   position: absolute;
   display: none;
   font-weight: normal;
   color: #6c757d !important;
}

.btn-lg {
   font-size: 1.25rem;
   line-height: 1.2;
   border-radius: .3rem;
   color: #f8f9fc;
   background-color: #169b6bba;
   border-color: #ffffff
}
</style>

<body>
   <jsp:include page="/WEB-INF/views/header.jsp" />
   <input type="hidden" name="redirectUrl">
   <div class="page-header"
      style="background-size: cover; background-position: top center;">
      <div class="container">
         <div class="row">
            <div class="col-lg-4 col-md-6 ml-auto mr-auto">
               <div class="card">
                  <div class="card-header text-center">
                     <h4 class="card-title">병원관리전산시스템</h4>
                  </div>
                  <div class="card-body">
                     <!-- 로그인  -->
                     <c:if test="${emp_vo == null}">
                        <form action='<c:url value='/login'/>' method="post"
                           name="myForm">
                           <div class="row">
                              <div class="col-lg-10 col-md-6 ml-auto mr-auto">

                                 <div class="input-group1">
                                    <div class="input-group1-prepend">
                                       <span class="input-group1-text"> <i
                                          class="material-icons">person_outline</i>
                                       </span>
                                    </div>
                                    <div class="form-group">
                                       <input type="text" class="form-control" placeholder="ID..."
                                          id="emp_no" name="emp_no" required="required"> <span
                                          class="bmd-help" id="id-warning"></span>
                                    </div>
                                 </div>

                                 <div class="input-group1">
                                    <div class="input-group1-prepend">
                                       <span class="input-group1-text"> <i
                                          class="material-icons">lock_outline</i>
                                       </span>
                                    </div>
                                    <div class="form-group">
                                       <input type="password" class="form-control"
                                          placeholder="Password..." id="emp_pwd" name="emp_pwd"
                                          required="required"> <span class="bmd-help"
                                          id="pw-warning"></span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="text-center">
                              <input type="submit" class="btn-lg" value="로그인">
                           </div>
                        </form>
                     </c:if>

                     <c:if test="${emp_vo != null }">
                        <c:redirect url="/base" />
                     </c:if>

                     <c:if test="${msg == false }">
                        <%
                        out.println("<script>alert('로그인 실패 ! 아이디나 비밀번호를 확인해 주세요.')</script>");
                        %>
                     </c:if>
                  </div>
                  <!-- 로그인 끝 -->
                  <div class="card-footer">
                     <span class="txt_find" style="">
                        <button type="button" class="btn btn-primary btn-sm "
                           data-toggle="modal" data-target="#idModal"
                           data-backdrop="static">사원번호 찾기</button>
                        <button type="button" class="btn btn-primary btn-sm"
                           data-toggle="modal" data-target="#pwModal"
                           data-backdrop="static">비밀번호 찾기</button>
                     </span>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- id Modal-->
   <div class="modal fade" id="idModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">

            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">사원번호 찾기</h5>
               <button class="close" type="button" data-dismiss="modal"
                  aria-label="Close" id="btnX">
                  <span aria-hidden="true">×</span>
               </button>
            </div>

            <div class="modal-body">
               <div class="card-body">
                  <div id="searchI">
                     <div class="form-group">
                        <label class="font-weight-bold" for="inputName_1">이름</label>
                        <div>
                           <input type="text" class="form-control" id="inputName_1"
                              name="inputName_1" placeholder="ex) hokwang" required="required">
                        </div>
                     </div>

                     <div class="form-group">
                        <label class="font-weight-bold" for="inputPhone_1">휴대폰번호</label>
                        <div>
                           <input type="text" class="form-control" id="inputPhone_1"
                              name="inputPhone_1" placeholder="ex) 1111-1111" required="required">
                        </div>
                     </div>

                     <h1 id="resultId"></h1>
                  </div>
               </div>
            </div>

            <div class="modal-footer">
               <input type="button" class="btn btn-primary" id="btnId"
                  name="btnId" value="찾기">
               <button class="btn btn-secondary" type="button" id="Cancel"
                  data-dismiss="modal">Cancel</button>
            </div>
         </div>
      </div>
   </div>

   <!-- pw Modal-->
   <div class="modal fade" id="pwModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">

            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
               <button class="close" type="button" data-dismiss="modal"
                  aria-label="Close" id="btnX">
                  <span aria-hidden="true">×</span>
               </button>
            </div>

            <div class="modal-body">
               <div class="card-body">
                  <div id="searchI">
                     <div class="form-group">
                        <label class="font-weight-bold" for="inputempNo_1">사원번호</label>
                        <input type="text" class="form-control" id="inputempNo_1"
                           name="inputempNo_1" placeholder="ex) 사원번호" required="required">
                     </div>

                     <div class="form-group">
                        <label class="font-weight-bold " for="inputemptel_1">휴대폰번호</label>
                        <input type="email" class="form-control" id="inputemptel_1"
                           aria-describedby="emailHelp" placeholder="ex) 1111-1111"
                           required="required"> <small id="emailHelp"
                           class="form-text text-muted"></small>
                     </div>

                     <h1 id="resultPw"></h1>
                  </div>


                  <div class="modal-footer">
                     <button class="btn btn-primary" id="btnPw" name="btnPw">찾기</button>
                     <button class="btn btn-secondary" type="button" id="Cancel"
                        data-dismiss="modal">Cancel</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>