package com.paulzhang.web.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.CommonConstants;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.domain.PondVO;
import com.paulzhang.web.service.PondService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.Objects;

@Controller
@RequestMapping("/pond")
public class PondManagerController {

	@Resource
	private PondService pondService;

	@GetMapping("/list")
	public ModelAndView list(@RequestParam(value = "current", required = false) Long current, @RequestParam(value = "size", required = false) Long size) {
		current = Objects.isNull(current) ? CommonConstants.DEFAULT_PAGE_CURRENT : current;
		size = Objects.isNull(size) ? CommonConstants.DEFAULT_PAGE_SIZE : size;
		IPage<PondVO> pondVOPage = pondService.findAllByPage(current, size);
		return new ModelAndView("/pond/list", "pondPage", pondVOPage);
	}

	@GetMapping("/config/{pond-id}")
	public ModelAndView config(@PathVariable("pond-id") Long pondId) {
		PondVO pondVO = pondService.findById(pondId);
		return new ModelAndView("/pond/config", "pondDetail", pondVO);
	}

	@PostMapping("/add")
	@ResponseBody
	public HttpResult<Void> add(@Validated @RequestBody PondVO pondVO) throws InvocationTargetException, IllegalAccessException {
		int count = pondService.add(pondVO);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}
}

