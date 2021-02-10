package com.paulzhang.web.controller;

import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.domain.TaskVO;
import com.paulzhang.web.entity.Pond;
import com.paulzhang.web.service.PondService;
import com.paulzhang.web.service.TaskService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
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

		ModelAndView modelAndView = new ModelAndView("/work/calendar");
		return null;
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
}
