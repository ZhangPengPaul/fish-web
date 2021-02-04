package com.paulzhang.web.controller;

import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.domain.PermissionVO;
import com.paulzhang.web.service.PermissionService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {

	@Resource
	private PermissionService permissionService;

	@GetMapping("/list")
	public ModelAndView list() throws InvocationTargetException, IllegalAccessException {
		List<PermissionVO> permissionVOList = permissionService.findAll();

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/permission/list");
		modelAndView.addObject("permissions", permissionVOList);
		return modelAndView;
	}

	@PostMapping("/add")
	@ResponseBody
	public HttpResult<Void> add(@Validated @RequestBody PermissionVO permissionVO) {
		int count = permissionService.add(permissionVO);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}
}
