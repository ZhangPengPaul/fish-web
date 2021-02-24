package com.paulzhang.web.controller;

import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.domain.PondVO;
import com.paulzhang.web.domain.TaskVO;
import com.paulzhang.web.domain.UserVO;
import com.paulzhang.web.entity.User;
import com.paulzhang.web.service.PondService;
import com.paulzhang.web.service.TaskService;
import com.paulzhang.web.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/work")
public class WorkScheduleController {

	@Resource
	private TaskService taskService;

	@Resource
	private PondService pondService;

	@Resource
	private UserService userService;

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
		List<UserVO> userVOS = userService.findByProjectId(projectId);
		ModelAndView modelAndView = new ModelAndView("work/calendar");
		modelAndView.addObject("ponds", pondVOS);
		modelAndView.addObject("tasks", taskVOS);
		modelAndView.addObject("users", userVOS);
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

	@GetMapping("/detail/{taskId}")
	@ResponseBody
	public HttpResult<TaskVO> detail(@PathVariable("taskId") Long taskId) {
		TaskVO taskVO = taskService.findById(taskId);
		return HttpResult.<TaskVO>builder()
			.code(Objects.nonNull(taskVO) ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(Objects.nonNull(taskVO) ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.data(taskVO)
			.build();
	}

	@PostMapping("/delete-task")
	@ResponseBody
	public HttpResult<Void> delete(@RequestParam("taskId") Long taskId) {
		int count = taskService.deleteById(taskId);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}

	@PostMapping("/assign-task")
	@ResponseBody
	public HttpResult<Void> assign(@RequestParam("taskId") Long taskId, @RequestParam("userId") Long userId) {
		int count = taskService.assign(taskId, userId);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}
}
