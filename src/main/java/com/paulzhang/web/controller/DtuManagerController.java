package com.paulzhang.web.controller;

import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.domain.DtuVO;
import com.paulzhang.web.service.DtuService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;

@Controller
@RequestMapping("/dtu")
public class DtuManagerController {

	@Resource
	private DtuService dtuService;

	@PostMapping("/add")
	@ResponseBody
	public HttpResult<Void> addPondDTU(@Validated @RequestBody DtuVO dtuVO) throws InvocationTargetException, IllegalAccessException {
		int count = dtuService.add(dtuVO);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}

	@PostMapping("/delete")
	@ResponseBody
	public HttpResult<Void> deletePondDtu(@RequestParam("dtuId") Long dtuId, @RequestParam("pondId") Long pondId) {
		int count = dtuService.deleteByPondId(dtuId, pondId);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}
}
