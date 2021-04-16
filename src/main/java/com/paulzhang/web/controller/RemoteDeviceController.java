package com.paulzhang.web.controller;

import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.service.DeviceService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.DecoderException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@Slf4j
@RestController
@RequestMapping("/remote-device")
public class RemoteDeviceController {

	@Resource
	private DeviceService deviceService;

	@GetMapping("/control")
	public HttpResult<Void> control(@RequestParam("action") String action, @RequestParam("deviceId") Long deviceId) {
		HttpResult<Void> httpResult = HttpResult.<Void>builder()
			.code(HttpResultCode.SUCCESS.getCode())
			.message(HttpResultCode.SUCCESS.getMessage())
			.build();
		try {
			deviceService.control(action, deviceId);
		} catch (DecoderException e) {
			httpResult = HttpResult.<Void>builder()
				.code(HttpResultCode.FAILED.getCode())
				.message(HttpResultCode.FAILED.getMessage())
				.build();
			log.error("device control error", e);
		}
		return httpResult;
	}
}
