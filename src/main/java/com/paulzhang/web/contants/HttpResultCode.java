package com.paulzhang.web.contants;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum HttpResultCode {

	SUCCESS(200, "success"),

	FAILED(500, "failed");

	private final Integer code;
	private final String message;
}
