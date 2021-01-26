package com.paulzhang.web.common.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum DeviceType {

	PROD(1, "生产设备"),
	SENSOR(2, "监测设备");

	private final Integer code;
	private final String message;
}
