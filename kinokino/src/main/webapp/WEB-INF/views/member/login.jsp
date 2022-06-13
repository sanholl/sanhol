<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="saveIdExist" value="${cookie.saveId != null}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


    <form action="login" method="post">
    <input type="hidden" name="referer" value="${referer}">
      <div class="container w300 m50">
      
        <div class="row center">
          <h1>로그인</h1>
        </div>

        <div class="row left">
          <label>아이디</label>
          <c:choose>
          	<c:when test="${saveIdExist}">
          	<input
            type="text"
            name="memberId"
            autocomplete="off"
            placeholder="아이디 혹은 이메일"
            required
            class="form-input fill"
            value="${cookie.saveId.value}"
          />
          	</c:when>
          	<c:otherwise>
          	<input
            type="text"
            name="memberId"
            autocomplete="off"
            placeholder="아이디 혹은 이메일"
            required
            class="form-input fill"
          />
          	</c:otherwise>
          </c:choose>
          
        </div>

        <div class="row left">
          <label>비밀번호</label>
          <input
            type="password"
            name="memberPw"
            autocomplete="off"
            placeholder="비밀번호"
            required
            class="form-input fill"
          />
        </div>
        <div class="row">
        	<label>
        		<c:choose>
        			<c:when test="${saveIdExist}">
        				<input type="checkbox" name="remember" checked>
        			</c:when>
        			<c:otherwise>
						<input type="checkbox" name="remember">        		
	        		</c:otherwise>
        		</c:choose>
        		아이디 저장하기
        	</label>
        </div>

        <div class="row center">
          <button type="submit" class="btn fill btn-primary">로그인</button>
        </div>

        <div class="row center">
          <a href="find_id" class="link">
          아이디가 기억나지 않아요
          </a>
        </div>

        <div class="row center">
          <a href="find_pw" class="link">
            비밀번호가 기억나지 않아요
          </a>
        </div>
        
      </div>
    </form>

<%-- 에러 표시가 있는 경우 메세지를 출력 --%>
<c:if test="${param.error != null}">
<div class="row center">
	<h3 style="color:red">로그인 정보가 일치하지 않습니다.</h3>
</div>
</c:if>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
