package com.paulzhang.web.controller;

import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.domain.PondVO;
import com.paulzhang.web.domain.TaskVO;
import com.paulzhang.web.entity.User;
import com.paulzhang.web.service.PondService;
import com.paulzhang.web.service.TaskService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/work")
public class WorkScheduleController {

	@Resource
	private TaskService taskService;

	@Resource
	private PondService pondService;

	@GetMapping("/calendar")
	public ModelAndView calendar() {
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		Long projectId = user.getProjectId();
		List<PondVO> pondVOS = pondService.findAllByProjectId(projectId);
		List<Long> pondIds = new ArrayList<>();
		for (PondVO pondVO : pondVOS) {
			pondIds.add(pondVO.getPondId());
		}
		List<TaskVO> taskVOS = taskService.findByPonds(pondIds);
		ModelAndView modelAndView = new ModelAndView("work/calendar");
		modelAndView.addObject("ponds", pondVOS);
		modelAndView.addObject("tasks", taskVOS);
		return modelAndView;
	}

	@PostMapping("/add-task")
	@ResponseBody
	public HttpResult<Void> add(@Validated @RequestBody TaskVO taskVO) {
		int count = taskService.add(taskVO);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}

	@GetMapping("/logs")
	public ModelAndView workLogs() {
		return new ModelAndView("work/logs");
	}
}
