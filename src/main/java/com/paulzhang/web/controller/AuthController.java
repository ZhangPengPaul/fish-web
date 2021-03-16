package com.paulzhang.web.controller;

import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.domain.ProjectVO;
import com.paulzhang.web.entity.User;
import com.paulzhang.web.service.AuthService;
import com.paulzhang.web.service.ProjectService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Resource
	private AuthService authService;

	@Resource
	private ProjectService projectService;

	@GetMapping("/sign-in")
	public ModelAndView signIn() {
		return new ModelAndView("login");
	}

	@PostMapping("/login")
	@ResponseBody
	public HttpResult<Void> login(@RequestParam("username") String username, @RequestParam("password") String password,
								  HttpServletRequest request) {
		authService.login(username, password);
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		Long projectId = user.getProjectId();
		ProjectVO projectVO = projectService.findById(projectId);
		request.getSession().setAttribute("project", projectVO);
		return HttpResult.<Void>builder().code(HttpResultCode.SUCCESS.getCode())
			.message(HttpResultCode.SUCCESS.getMessage())
			.build();
	}

}
