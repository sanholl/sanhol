<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>소모임 생성</h1>

<form action="create" method="post">
	<input type="hidden" name="clubLeader" value="${login}">
	<div class="row">
		<label>소모임 이름</label>
		<input type="text" name="clubName">
	</div>
	<div class="row">
		<label>소모임 설명</label>
		<textarea rows="10" cols="10" name="clubSummary"></textarea>
	</div>
	<div class="row">
		<label>소모임 대분류</label>
		<select name="clubMainCategory">
			<option>아웃도어/여행</option>
			<option>문화/공연/축제</option>
			<option>사교/인맥</option>
			<option>야구관람</option>
			<option>게임/오락</option>
			<option>자유주제</option>
			<option>운동/스포츠</option>
		</select>
	</div>
	<div class="row">
		<label>소모임 소분류</label>
		<input type="text" name="clubSubCategory"> <!-- 대분류에서 선택한 하위항목에 맞는 목록이 보여지게 js사용하면 될듯 -->
	</div>
	<div class="row">
		<label>소모임 지역</label>
		<input type="text" name="clubPlace">
	</div>
	<div class="row">
		<label>소모임 질문1</label>
		<input type="text" name="clubJoinQuestion1">
	</div>
	<div class="row">
		<label>소모임 질문2</label>
		<input type="text" name="clubJoinQuestion2">
	</div>
	<div class="row">
		<label>소모임 질문3</label>
		<input type="text" name="clubJoinQuestion3">
	</div>
	<div class="row">
		<button type="submit" class="btn btn-primary fill">생성하기</button>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>