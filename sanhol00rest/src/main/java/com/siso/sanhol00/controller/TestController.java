package com.siso.sanhol00.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import springfox.documentation.annotations.ApiIgnore;

@Api(tags = {"테스트용 컨트롤러"}) // 설명을 추가
//@ApiIgnore // 무시하겠다는 의미
@RestController // @Controller + @ResponseBody : 비동기를 처리하기에 딱 안성맞춤인 컨트롤러다.  
public class TestController {
	
	@ApiOperation(value="홈") // 작업 내용
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@ApiOperation(value="테스트")
	@ApiResponses(value = {
			@ApiResponse(code=500, message="에러났댜~")
	}) // 발생하는 페이지에 따른 메세지 설정
	@GetMapping("/test")
	public String test() {
		return "test";
	}
	
	@GetMapping("/param")
	public String param(@RequestParam String id) {
		return "hello"+id;
	}
}
