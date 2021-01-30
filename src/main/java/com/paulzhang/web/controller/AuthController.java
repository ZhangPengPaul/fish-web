package com.paulzhang.web.controller;

import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.service.AuthService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Resource
	private AuthService authService;

	@GetMapping("/sign-in")
	public ModelAndView signIn() {
		return new ModelAndView("login");
	}

	@PostMapping("/login")
	@ResponseBody
	public HttpResult<Void> login(@RequestParam("username") String username, @RequestParam("password") String password) {
		authService.login(username, password);
		return HttpResult.<Void>builder().code(HttpResultCode.SUCCESS.getCode())
			.message(HttpResultCode.SUCCESS.getMessage())
			.build();
	}

}
