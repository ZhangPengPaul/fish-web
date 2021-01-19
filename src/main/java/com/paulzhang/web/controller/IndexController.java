package com.paulzhang.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/index")
public class IndexController {

    @GetMapping("/dashboard")
    public ModelAndView dashboard() {
        return new ModelAndView("dashboard");
    }
}
