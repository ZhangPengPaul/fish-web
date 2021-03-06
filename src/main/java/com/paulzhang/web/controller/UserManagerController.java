package com.paulzhang.web.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.CommonConstants;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.domain.ProjectVO;
import com.paulzhang.web.domain.RoleVO;
import com.paulzhang.web.domain.UserVO;
import com.paulzhang.web.service.ProjectService;
import com.paulzhang.web.service.RoleService;
import com.paulzhang.web.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/user")
public class UserManagerController {

	@Resource
	private UserService userService;

	@Resource
	private ProjectService projectService;

	@Resource
	private RoleService roleService;

	@GetMapping("/list")
	public ModelAndView list(@RequestParam(value = "current", required = false) Long current, @RequestParam(value = "size", required = false) Long size) throws InvocationTargetException, IllegalAccessException {
		current = Objects.isNull(current) ? CommonConstants.DEFAULT_PAGE_CURRENT : current;
		size = Objects.isNull(size) ? CommonConstants.DEFAULT_PAGE_SIZE : size;
		IPage<UserVO> userVOPage = userService.findAllByPage(current, size);

		List<ProjectVO> projectVOList = projectService.findAll();
		List<RoleVO> roleVOS = roleService.findAll();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/list");
		modelAndView.addObject("userPage", userVOPage);
		modelAndView.addObject("projects", projectVOList);
		modelAndView.addObject("roles", roleVOS);
		return modelAndView;
	}

	@PostMapping("/add")
	@ResponseBody
	public HttpResult<Void> add(@Validated @RequestBody UserVO userVO) throws InvocationTargetException, IllegalAccessException {
		int count = userService.add(userVO);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}

	@PostMapping("/config-role")
	@ResponseBody
	public HttpResult<Void> configRole(@RequestParam("userId") Long userId, @RequestParam("roleId") Long roleId) {
		int count = userService.addUserRole(userId, roleId);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}
}
