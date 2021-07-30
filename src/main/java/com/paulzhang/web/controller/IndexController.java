package com.paulzhang.web.controller;

import com.paulzhang.web.domain.PondVO;
import com.paulzhang.web.entity.User;
import com.paulzhang.web.service.PondService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class IndexController {

	@Resource
	private PondService pondService;

	@GetMapping("/")
	public ModelAndView dashboard() {
		return new ModelAndView("redirect:/pond/dashboard");
	}

	@GetMapping("/project/dashboard")
	public ModelAndView projectDashboard() {
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		Long projectId = user.getProjectId();
		List<PondVO> pondVOPage = pondService.findAllByProjectId(projectId);
		ModelAndView modelAndView = new ModelAndView("project/dashboard");
		modelAndView.addObject("pondPage", pondVOPage);
		return modelAndView;
	}

}
