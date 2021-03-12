package com.paulzhang.web.controller;

import com.paulzhang.web.common.HttpResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/remote-device")
public class RemoteDeviceController {

	@GetMapping("/control")
	public HttpResult<Void> control() {

		return null;
	}
}
