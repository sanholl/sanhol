<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
	.message-wrapper > .message {
		display:flex;
	}
	.message-wrapper > .message.admin {
		color:red
	}
	.message-wrapper > .message > .user {
		padding:0.25em;	
		min-width: 100px;
	}
	.message-wrapper > .message > .text{
		padding:0.25em;
		flex-grow:1;	
	}
	.message-wrapper > .message > .time{
		padding:0.25em;	
	}
</style>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script>
<script>
	$(function() {
		disconnectOperation();//최초 상태 설정

		// 주소 자동 계산
		// - 표준 웹소켓 API는 주소를 ws:// 부터 작성해야 하므로 불필요한 host, port 등을 작성해야 한다.
		// - 웹소켓은 지원하는 브라우저가 적다(구버전 브라우저에서는 안됨)
		// - 이를 해결하기 위해 sockjs를 사용한다.
		var uri = "${pageContext.request.contextPath}/ws/channel";

		//접속 - 자바스크립트 표준 API 사용
		socket = new SockJS(uri);

		socket.onopen = function(e) {
			connectOperation();
			
			// 접속하자마자 나의 채널명을 서버로 전송해야한다(입장메세지)
			var message = {
				type: 1,
				name:"${channelName}",
			};
			var json = JSON.stringify(message);
			socket.send(json);
			
		};
		socket.onclose = function(e) {
			// console.log(arguments);
			disconnectOperation();
		};
		socket.onerror = function() {
			// console.log(arguments);
			alert("서버와의 연결 오류가 발생하였습니다.");
			disconnectOperation();
		};
		socket.onmessage = function(e) {
			// tip. 콘솔화면에 그냥 검은글자로 나오면 Stirng이다.
			// console.log(e.data);
			var data = JSON.parse(e.data); // json을 객체로 복구
			// var timeObject = new Date(data.time); // 날짜 객체로 변환(자바스크립트 표준 API)
			var timeObject = moment(data.time).format("YYYY-MM-DD hh:mm:ss"); // 날짜 객체로 변환(moment js)
			
			var div = $("<div>").addClass("message");
			if(data.auth == "관리자"){
				div.addClass("admin");
			}
			
			var span1 = $("<span>").addClass("user").text(data.memberId);
			var span2 = $("<span>").addClass("text").text(data.text);
			var span3 = $("<span>").addClass("time").text(timeObject);
			
			div.append(span1).append(span2).append(span3);
			$(".message-wrapper").append(div);
		};

		$(".btn-send").click(function() {
			// 채팅메세지를 보내야 한다.
			var text = $(".send-input").val();
			if (!text) return;
			
			var message = {
					type:2,
					name:"${channelName}",
					message:text
			};

			var json = JSON.stringify(message);
			socket.send(json); // 전송 명령 

			$(".send-input").val(""); // 초기화
		});

		function connectOperation() {//연결되면 처리할 화면 작업을 구현
			$(".send-input").prop("disabled", false); // 입력창 활성화 
			$(".btn-send").prop("disabled", false); // 전송버튼 활성화
		}
		function disconnectOperation() {//연결 종료되면 처리할 화면 작업을 구현
			$(".send-input").prop("disabled", true); // 입력창 비활성화 
			$(".btn-send").prop("disabled", true); // 전송버튼 비활성화
		}
	});
</script>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w600">
	
	<div class="row center">
		<h1>${clubDto.clubNo}번 소모임</h1>
	</div>
	
	<!-- 채팅 -->
	
	<h3>사용자 : ${login}</h3>
	<h3>로그인 상태 : ${login != null}</h3>
	<div class="row center">
		<input type="text" class="send-input">
		<button class="btn-send">전송</button>
	</div>

	<!-- 메세지 출력 공간 -->
	<div class="message-wrapper"></div>
	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
