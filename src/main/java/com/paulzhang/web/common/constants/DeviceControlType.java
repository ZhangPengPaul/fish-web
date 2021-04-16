package com.paulzhang.web.common.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum DeviceControlType {

	ON(1, "开"),
	OFF(2, "关");

	private final Integer code;
	private final String message;

	/**
	 * 通过value取枚举
	 *
	 * @param value
	 * @return
	 */
	public static DeviceControlType getTypeByValue(Integer value) {
		for (DeviceControlType enums : DeviceControlType.values()) {
			if (enums.getCode().equals(value)) {
				return enums;
			}
		}
		return null;
	}
}
