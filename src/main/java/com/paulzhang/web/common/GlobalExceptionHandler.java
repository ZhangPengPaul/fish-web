package com.paulzhang.web.common;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

	/**
	 * 处理Validated校验异常
	 * <p>
	 * 注: 常见的ConstraintViolationException异常， 也属于ValidationException异常
	 *
	 * @param e 捕获到的异常
	 * @return 返回给前端的data
	 */
	@ResponseStatus(code = HttpStatus.BAD_REQUEST)
	@ExceptionHandler(value = {BindException.class, ValidationException.class, MethodArgumentNotValidException.class})
	public HttpResult<Void> handleParameterVerificationException(Exception e) {
		log.error("handleParameterVerificationException has been invoked", e);
		HttpResult.HttpResultBuilder<Void> resultBuilder = HttpResult.builder();
		resultBuilder.code(500);
		String msg = null;
		/// BindException
		if (e instanceof BindException) {
			// getFieldError获取的是第一个不合法的参数(P.S.如果有多个参数不合法的话)
			FieldError fieldError = ((BindException) e).getFieldError();
			if (fieldError != null) {
				msg = fieldError.getDefaultMessage();
			}
			/// MethodArgumentNotValidException
		} else if (e instanceof ConstraintViolationException) {
			/*
			 * ConstraintViolationException的e.getMessage()形如
			 *     {方法名}.{参数名}: {message}
			 *  这里只需要取后面的message即可
			 */
			msg = e.getMessage();
			if (msg != null) {
				int lastIndex = msg.lastIndexOf(':');
				if (lastIndex >= 0) {
					msg = msg.substring(lastIndex + 1).trim();
				}
			}
			/// ValidationException 的其它子类异常
		} else {
			msg = "处理参数时异常";
		}
		resultBuilder.message(msg);
		return resultBuilder.build();
	}
}
