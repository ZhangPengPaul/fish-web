package com.paulzhang.web.common;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class HttpResult<T> {

	private Integer code;
	private String message;
	private T data;
}
