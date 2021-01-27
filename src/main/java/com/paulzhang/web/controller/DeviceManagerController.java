package com.paulzhang.web.controller;

import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.domain.DeviceVO;
import com.paulzhang.web.domain.DtuVO;
import com.paulzhang.web.service.DeviceService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;

@Controller
@RequestMapping("/device")
public class DeviceManagerController {

	@Resource
	private DeviceService deviceService;

	@PostMapping("/add")
	@ResponseBody
	public HttpResult<Void> addPondDevice(@Validated @RequestBody DeviceVO deviceVO) throws InvocationTargetException, IllegalAccessException {
		int count = deviceService.add(deviceVO);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}

	@PostMapping("/delete")
	@ResponseBody
	public HttpResult<Void> deletePondDevice(@RequestParam("deviceId") Long deviceId, @RequestParam("pondId") Long pondId) {
		int count = deviceService.deleteByPondId(deviceId, pondId);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}
}
