package com.paulzhang.web.common.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum DtuType {

	CONTROL(1, "控制设备"),
	SENSOR_3(2, "三项传感器"),
	SENSOR_2(3, "两项传感器");

	private final Integer code;
	private final String message;
}
