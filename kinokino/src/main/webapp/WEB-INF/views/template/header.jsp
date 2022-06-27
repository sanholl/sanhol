<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="memberNo" value="${login}"></c:set>
<c:set var="isLogin" value="${memberNo != null}"></c:set>
<c:set var="isAdmin" value="${auth == '관리자'}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습용 홈페이지</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


<link rel="stylesheet" type="text/css" href="${root}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/layout.css">
<link rel="stylesheet" type="text/css" href="${root}/css/commons.css">


</head>
<body>
	<main>

		<!-- 헤더(header) -->
		<h4>로그인세션:${login}</h4>
		<header>
			<h1>
				<a class="link" href="${root}">소모임 연습용 홈페이지</a>
			</h1>
		</header>

		<!-- 메뉴(nav, navbar) -->
		<nav>
			<!-- 디자인이 이루어지도록 ul로 메뉴를 구현 -->
			<ul class="menu">
				<li>
					<a class="link" href="${root}">홈으로</a>
				</li>
				<li>
					<a class="link" href="${root}/board/list">게시판</a>
					<ul>
						<li>
							<a href="${root}/board/list">목록가기</a>
						</li>
						<li>
							<a href="${root}/board/write">등록하기</a>
						</li>
					</ul>
				</li>
				<li>
					<a class="link" href="${root}/club/">소모임</a>
				</li>
				<!-- 우측 메뉴 : 회원용 -->
				<%-- 로그인 상태에 따라 다른 메뉴를 출력 --%>
				<c:choose>
					<c:when test="${isLogin}">
						<li class="right-menu">
							<a class="link" href="${root}/member/mypage">회원메뉴</a>
							<ul>
								<li class="right-menu">
								<a class="link" href="${root}/member/mypage">내정보</a>
								<ul>
									<li>
										<a class="link" href="${root}/member/password">비밀번호변경</a>
										<a class="link" href="${root}/member/information">내정보변경</a>
									</li>
								</ul>
								</li>
								<li class="right-menu"><a class="link"
									href="${root}/member/logout">로그아웃</a>
								</li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
					<li class="right-menu">
						<a class="link" href="${root}/member/login">로그인
						</a>
					<ul>
						<li class="right-menu">
							<a class="link" href="${root}/member/join">회원가입
							</a>
						</li>
					</ul>
						</li>
					</c:otherwise>
				</c:choose>
				
				<%-- 관리자라면 관리 메뉴를 출력 --%>
				<c:if test="${isAdmin}">
					<li class="right-menu">
						<a class="link" href="${root}/admin/list">회원관리
						</a>
					<ul>
						<li class="right-menu">
							<a class="link" href="${root}/admin/statistics">사이트관리
							</a>
						</li>
					</ul>
						</li>
				</c:if>
				
				</ul>
		</nav>

		<section>
			<article>