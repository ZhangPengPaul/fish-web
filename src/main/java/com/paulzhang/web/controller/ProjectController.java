package com.paulzhang.web.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.CommonConstants;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.domain.PondVO;
import com.paulzhang.web.domain.ProjectVO;
import com.paulzhang.web.entity.Project;
import com.paulzhang.web.service.ProjectService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.Objects;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Resource
	private ProjectService projectService;

	@GetMapping("/list")
	public ModelAndView list(@RequestParam(value = "current", required = false) Long current, @RequestParam(value = "size", required = false) Long size) {
		current = Objects.isNull(current) ? CommonConstants.DEFAULT_PAGE_CURRENT : current;
		size = Objects.isNull(size) ? CommonConstants.DEFAULT_PAGE_SIZE : size;
		IPage<ProjectVO> projectVOPage = projectService.findAllByPage(current, size);
		return new ModelAndView("/project/list", "projectPage", projectVOPage);
	}

	@PostMapping("/add")
	@ResponseBody
	public HttpResult<Void> add(@Validated @RequestBody ProjectVO projectVO) throws InvocationTargetException, IllegalAccessException {
		int count = projectService.add(projectVO);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}
}
