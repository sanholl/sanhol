<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="contatiner w950 m30">
	
	<div class="row center">
		<h1>소모임 목록</h1>
	</div>
	
	<div class="row right">
		<a href="create" class="link link-btn">소모임 생성</a>
	</div>
	
	<div class="row">
		<table class="table table-border">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>카테고리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="clubDto" items="${list}">
				<tr>
					<td>${clubDto.clubNo}</td>
					<td>
						<a href="detail/${clubDto.clubNo}">
							${clubDto.clubName}
						</a>
					</td>
					<td>${clubDto.clubMainCategory}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</div>
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>