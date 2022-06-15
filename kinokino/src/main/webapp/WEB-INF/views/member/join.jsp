<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		// 현재 페이지 
		var index = 0;
		
		// 처음 페이지를 제외하고 모두 숨김 처리
		move(index);
		
		// 다음 버튼을 누르면 다음 페이지가 나오도록 구현
		$(".btn-next").not(":last").click(function(){
			move(++index);
		});
		// 이전 버튼을 누르면 이전 페이지가 나오도록 구현
		$(".btn-prev").not(":first").click(function(){
			move(--index);
		});
		
		// 질문버튼 클릭시 색깔변하게
		$(".btn-answer1").click(function(){
			$(this).css("background-color", "blue");
			$(this).css("color", "white");
			$(this).parent("div").parent("div").find(".btn-answer2").css("background-color", "white");
			$(this).parent("div").parent("div").find(".btn-answer2").css("color","gray");
		});
		$(".btn-answer2").click(function(){
			$(this).css("background-color", "blue");
			$(this).css("color", "white");
			$(this).parent("div").parent("div").find(".btn-answer1").css("background-color", "white");
			$(this).parent("div").parent("div").find(".btn-answer1").css("color","gray");
		});
		
		function move(index){
			$(".page").hide();
			$(".page").eq(index).show();
		}
	});
</script>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>    

    <div class="container w500">
      <div class="row center">
        <h1>회원가입</h1>
      </div>
      
      <form action="join" method="post">
      <div class="container w500 m30 page">
        <div class="row">
          <label>아이디</label>
          <input
            type="text"
            name="memberId"
            placeholder="영어소문자, 숫자 8~20자"
            autocomplete="off"
            required
            class="form-input fill"
          />
        </div>

        <div class="row">
          <label>비밀번호</label>
          <input
            type="password"
            name="memberPassword"
            autocomplete="off"
            placeholder="영어,숫자,특수문자 8~16자리"
            required
            class="form-input fill"
          />
        </div>

        <div class="row">
          <label>전화번호</label>
          <input
            type="tel"
            name="memberPhone"
            autocomplete="off"
            placeholder="- 제외하고 입력"
            required
            class="form-input fill"
          />
        </div>
        
        <div class="row">
          <label>이메일</label>
          <input type="email" name="memberEmail" autocomplete="off" required class="form-input fill">
        </div>
        
        <div class="row center">
	       	<button type="button" class="btn btn-prev">이전</button>
	       	<button type="button" class="btn btn-next">다음</button>
        </div>
      </div>
      
      <div class="container w500 m30 page">
      	
      	<c:forEach var="mbtiSurveyDto" items="${list}">
	      	<c:if test="${mbtiSurveyDto.surveyNo < 4}">
		      	<div class="row center m50">
		      		<div class="row m30">
			      		<span>Q${mbtiSurveyDto.surveyNo}.${mbtiSurveyDto.surveyQuestion}</span>
			      	</div>
			      	<div class="row">
			      		<button value="E" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
			      	</div>
			      	<div class="row">
			      		<button value="I" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
			      	</div>
		      	</div>
	      	</c:if>
      	</c:forEach>
      	
      	
      	
        <div class="row center">
	       	<button type="button" class="btn btn-prev">이전</button>
	       	<button type="button" class="btn btn-next">다음</button>
        </div>
      </div>
       
       <div class="container w500 m30 page">
       	<input type="hidden" name="memberMbti" class="mbti-result">
        <div class="row">
          <button type="submit" class="btn btn-primary fill">가입하기</button>
        </div>
        
        <div class="row center">
	       	<button type="button" class="btn btn-prev">이전</button>
	       	<button type="button" class="btn btn-next">다음</button>
        </div>
       </div>
        
      </form>
    </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>   