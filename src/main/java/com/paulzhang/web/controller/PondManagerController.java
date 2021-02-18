package com.paulzhang.web.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.CommonConstants;
import com.paulzhang.web.common.constants.DeviceType;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.domain.DeviceVO;
import com.paulzhang.web.domain.DtuVO;
import com.paulzhang.web.domain.PondVO;
import com.paulzhang.web.entity.User;
import com.paulzhang.web.service.DeviceService;
import com.paulzhang.web.service.DtuService;
import com.paulzhang.web.service.PondService;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.util.Strings;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Objects;

@Slf4j
@Controller
@RequestMapping("/pond")
public class PondManagerController {

	@Resource
	private PondService pondService;

	@Resource
	private DtuService dtuService;

	@Resource
	private DeviceService deviceService;

	@GetMapping("/list")
	public ModelAndView list() {
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		Long projectId = user.getProjectId();
		List<PondVO> pondVOPage = pondService.findAllByProjectId(projectId);
		ModelAndView modelAndView = new ModelAndView("pond/list");
		modelAndView.addObject("pondPage", pondVOPage);
		return modelAndView;
	}

	@GetMapping("/config/{pond-id}")
	public ModelAndView config(@PathVariable("pond-id") Long pondId) {
		// 池塘信息
		PondVO pondVO = pondService.findById(pondId);
		// DTU列表
		List<DtuVO> dtuVOList = dtuService.findByPondId(pondId);
		// 生产设备列表
		List<DeviceVO> prodDevices = deviceService.findByPondAndType(pondId, DeviceType.PROD.getCode());
		// 检测设备列表
		List<DeviceVO> sensorDevices = deviceService.findByPondAndType(pondId, DeviceType.SENSOR.getCode());
		ModelAndView modelAndView = new ModelAndView("pond/config");
		modelAndView.addObject("pondDetail", pondVO);
		modelAndView.addObject("dtuList", dtuVOList);
		modelAndView.addObject("prodDevices", prodDevices);
		modelAndView.addObject("sensorDevices", sensorDevices);
		return modelAndView;
	}

	@PostMapping("/add")
	@ResponseBody
	public HttpResult<Void> add(@Validated @RequestBody PondVO pondVO) throws InvocationTargetException, IllegalAccessException {
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		Long projectId = user.getProjectId();
		pondVO.setProjectId(projectId);
		int count = pondService.add(pondVO);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}

	@GetMapping("/analyse/{pond-id}")
	public ModelAndView analyse(@PathVariable("pond-id") Long pondId) {
		// 池塘信息
		PondVO pondVO = pondService.findById(pondId);
		// 生产设备列表
		List<DeviceVO> prodDevices = deviceService.findByPondAndType(pondId, DeviceType.PROD.getCode());
		ModelAndView modelAndView = new ModelAndView("pond/analyse");
		modelAndView.addObject("pondDetail", pondVO);
		modelAndView.addObject("prodDevices", prodDevices);
		return modelAndView;
	}

	@GetMapping("/dashboard")
	public ModelAndView dashboard(@RequestParam(value = "pondId", required = false) Long pondId,
								  @RequestParam(value = "index", required = false, defaultValue = "0") String index,
								  @RequestParam(value = "isSelect", required = false, defaultValue = "false") String isSelect) {
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		Long projectId = user.getProjectId();
		List<PondVO> pondVOPage = pondService.findAllByProjectId(projectId);
		ModelAndView modelAndView = new ModelAndView("pond/dashboard");
		modelAndView.addObject("pondPage", pondVOPage);
		PondVO pondVO = pondVOPage.get(0);
		if (Objects.nonNull(pondId)) {
			pondVO = pondService.findById(pondId);
		}
		modelAndView.addObject("pondDetail", pondVO);
		int intIndex = Integer.parseInt(index);
		intIndex++;
		if (intIndex >= pondVOPage.size()) {
			intIndex = 0;
		}
		modelAndView.addObject("index", intIndex);
		boolean bolSelect = false;
		if (Strings.isNotBlank(isSelect)) {
			bolSelect = Boolean.parseBoolean(isSelect);
		}
		modelAndView.addObject("isSelect", bolSelect);
		return modelAndView;
	}
}

