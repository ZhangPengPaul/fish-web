package com.paulzhang.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @GetMapping("/sign-in")
    public ModelAndView signIn() {
        return new ModelAndView("login");
    }

    @PostMapping("/login")
    public ModelAndView login() {
        return new ModelAndView("redirect:/index/dashboard");
    }
}
