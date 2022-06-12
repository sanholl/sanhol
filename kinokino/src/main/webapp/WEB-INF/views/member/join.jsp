<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>    

    <div class="container w400">
      <div class="row center">
        <h1>회원가입</h1>
      </div>

      <form action="join" method="post">
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

        <div class="row">
          <button type="submit" class="btn btn-primary fill">가입하기</button>
        </div>
      </form>
    </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>   