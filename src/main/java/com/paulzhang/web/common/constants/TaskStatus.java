package com.paulzhang.web.common.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum TaskStatus {

	NOT_ASSIGN(1, "未发布"),
	ASSIGNED(2, "已发布"),
	DOING(3, "进行中"),
	DONE(4, "已完成");

	private final Integer code;
	private final String message;
}
