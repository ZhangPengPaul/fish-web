package com.paulzhang.web.controller;

import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.domain.PermissionVO;
import com.paulzhang.web.domain.RolePermissionVO;
import com.paulzhang.web.domain.RoleVO;
import com.paulzhang.web.service.PermissionService;
import com.paulzhang.web.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

	@Resource
	private RoleService roleService;

	@Resource
	private PermissionService permissionService;

	@GetMapping("/list")
	public ModelAndView list() throws InvocationTargetException, IllegalAccessException {
		List<RoleVO> roleVOList = roleService.findAll();

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/role/list");
		modelAndView.addObject("roles", roleVOList);
		return modelAndView;
	}

	@PostMapping("/add")
	@ResponseBody
	public HttpResult<Void> add(@Validated @RequestBody RoleVO roleVO) {
		int count = roleService.add(roleVO);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}

	@GetMapping("/config/{role-id}")
	public ModelAndView config(@PathVariable("role-id") Long roleId) throws InvocationTargetException, IllegalAccessException {
		RoleVO roleVO = roleService.findById(roleId);
		List<PermissionVO> permissionVOS = permissionService.findAll();
		List<RolePermissionVO> rolePermissionVOS = roleService.findRolePermissions(roleId);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/role/config");
		modelAndView.addObject("role", roleVO);
		modelAndView.addObject("permissions", permissionVOS);
		modelAndView.addObject("rolePermissions", rolePermissionVOS);
		return modelAndView;
	}

	@PostMapping("/add-permission")
	@ResponseBody
	public HttpResult<Void> addRolePermission(@RequestBody List<Long> permissionIds, @RequestParam("roleId") Long roleId) {
		int count = roleService.addPermissions(roleId, permissionIds);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}
}
