package com.paulzhang.web.common.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

import java.util.Objects;

@Getter
@AllArgsConstructor
public enum DtuType {

	CONTROL(1, "控制设备"),
	SENSOR_3(2, "三项传感器"),
	SENSOR_2(3, "两项传感器");

	private final Integer code;
	private final String message;

	/**
	 * 通过value取枚举
	 *
	 * @param value
	 * @return
	 */
	public static DtuType getTypeByValue(Integer value) {
		for (DtuType enums : DtuType.values()) {
			if (enums.getCode().equals(value)) {
				return enums;
			}
		}
		return null;
	}
}
