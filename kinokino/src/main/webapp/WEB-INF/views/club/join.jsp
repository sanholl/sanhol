<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


    <div class="container w500">
      <div class="row center">
        <h1>소모임 회원가입</h1>
      </div>
      
      <form action="join" method="post">
      <input type="hidden" name="clubMemberNo" value="${login}">
      <input type="hidden" name="clubNo" value="${clubDto.clubNo}">
      <div class="container w500 m30 page">
      
      <div class="row m30">
      	<h3>*소모임 설명</h3>
      </div>
      <div class="row">
      	<span>소모임 이름 : ${clubDto.clubName}</span>
      </div>
      <div class="row">
      	<span>어떤 소모임인가? : ${clubDto.clubSummary}</span>
      </div>
      <div class="row m30">
      	<h3>*가입질문</h3>
      </div>
      <c:if test="${clubDto.clubJoinQuestion1 != null}">
      	<div class="row m30">
	      <label>Q1.${clubDto.clubJoinQuestion1}</label>
	      <input type="text" name="clubMemberAnswer1" class="form-input fill">
	     </div>
      </c:if>
      <c:if test="${clubDto.clubJoinQuestion2 != null}">
      	<div class="row m30">
	      <label>Q2.${clubDto.clubJoinQuestion2}</label>
	      <input type="text" name="clubMemberAnswer2" class="form-input fill">
	     </div>
      </c:if>
      <c:if test="${clubDto.clubJoinQuestion3 != null}">
      	<div class="row m30">
	      <label>Q3.${clubDto.clubJoinQuestion3}</label>
	      <input type="text" name="clubMemberAnswer3" class="form-input fill">
	     </div>
      </c:if>
      </div>
      <div class="row">
      	<button type="submit" class="btn fill">가입하기</button>
      </div>
      </form>
    </div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>