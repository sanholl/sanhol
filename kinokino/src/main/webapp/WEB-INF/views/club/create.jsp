<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>소모임 생성</h1>

<form action="create" method="post">
	<div class="row">
		<label>소모임 이름</label>
		<input type="text" name="clubName">
	</div>
	<div class="row">
		<label>소모임 분류</label>
		<input type="text" name="clubCategory">
	</div>
	<div class="row">
		<button type="submit" class="btn btn-primary fill">생성하기</button>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>