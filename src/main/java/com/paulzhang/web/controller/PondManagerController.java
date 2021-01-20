package com.paulzhang.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pond")
public class PondManagerController {

    @GetMapping("/list")
    public ModelAndView list() {
        return new ModelAndView("/pond/list");
    }
}
