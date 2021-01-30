package com.paulzhang.web.common.config;

import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.HttpResultCode;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@ControllerAdvice
public class ControllerExceptionAdvice {

	@ExceptionHandler(value = Throwable.class)
	@ResponseBody
	public HttpResult<Void> throwable(Throwable throwable, HttpServletRequest request) {
		String errorMessage = throwable.getMessage();
		return HttpResult.<Void>builder().code(HttpResultCode.FAILED.getCode())
			.message(errorMessage).build();
	}

	@ExceptionHandler(value = UnknownAccountException.class)
	@ResponseBody
	public HttpResult<Void> unauthorizedException(UnknownAccountException i) {
		return HttpResult.<Void>builder().code(500).message("用户不存在")
			.build();
	}

	@ExceptionHandler(value = IncorrectCredentialsException.class)
	@ResponseBody
	public HttpResult<Void> unauthorizedException(IncorrectCredentialsException i) {
		return HttpResult.<Void>builder().code(500).message("用户名/密码错误,认证失败")
			.build();
	}


}
