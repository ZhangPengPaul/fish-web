package com.paulzhang.web.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.CommonConstants;
import com.paulzhang.web.common.constants.DeviceType;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.domain.DeviceVO;
import com.paulzhang.web.domain.DtuVO;
import com.paulzhang.web.domain.PondVO;
import com.paulzhang.web.service.DeviceService;
import com.paulzhang.web.service.DtuService;
import com.paulzhang.web.service.PondService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Objects;

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
	public ModelAndView list(@RequestParam(value = "current", required = false) Long current, @RequestParam(value = "size", required = false) Long size) {
		current = Objects.isNull(current) ? CommonConstants.DEFAULT_PAGE_CURRENT : current;
		size = Objects.isNull(size) ? CommonConstants.DEFAULT_PAGE_SIZE : size;
		IPage<PondVO> pondVOPage = pondService.findAllByPage(current, size);
		return new ModelAndView("/pond/list", "pondPage", pondVOPage);
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
		ModelAndView modelAndView = new ModelAndView("/pond/config");
		modelAndView.addObject("pondDetail", pondVO);
		modelAndView.addObject("dtuList", dtuVOList);
		modelAndView.addObject("prodDevices", prodDevices);
		modelAndView.addObject("sensorDevices", sensorDevices);
		return modelAndView;
	}

	@PostMapping("/add")
	@ResponseBody
	public HttpResult<Void> add(@Validated @RequestBody PondVO pondVO) throws InvocationTargetException, IllegalAccessException {
		int count = pondService.add(pondVO);
		return HttpResult.<Void>builder()
			.code(count > 0 ? HttpResultCode.SUCCESS.getCode() : HttpResultCode.FAILED.getCode())
			.message(count > 0 ? HttpResultCode.SUCCESS.getMessage() : HttpResultCode.FAILED.getMessage())
			.build();
	}
}

