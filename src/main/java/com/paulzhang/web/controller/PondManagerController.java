package com.paulzhang.web.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.common.HttpResult;
import com.paulzhang.web.common.constants.DeviceType;
import com.paulzhang.web.common.constants.HttpResultCode;
import com.paulzhang.web.common.constants.TaskStatus;
import com.paulzhang.web.domain.*;
import com.paulzhang.web.entity.User;
import com.paulzhang.web.service.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.apache.logging.log4j.util.Strings;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.*;
import java.util.stream.Collectors;

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

	@Resource
	private TsDataService tsDataService;

	@Resource
	private YsTokenService ysTokenService;

	@Resource
	private TsDataNCService tsDataNCService;

	@Resource
	private TaskService taskService;

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

		IPage<TsDataVO> tsDataVOS = tsDataService.findLatestByPond(0, 100, pondId);
		if (Objects.nonNull(tsDataVOS)) {
			List<TsDataVO> records = tsDataVOS.getRecords();
			Collections.reverse(records);
			modelAndView.addObject("tsDatas", records);
		}

		IPage<TsDataNCVO> latestNH4H = tsDataNCService.findLatestNH4NByPond(0L, 100, pondVO.getPondId());
		modelAndView.addObject("tsDataN", latestNH4H);

		IPage<TsDataNCVO> latestCOD = tsDataNCService.findLatestCODByPond(0L, 100, pondVO.getPondId());
		modelAndView.addObject("tsDataC", latestCOD);
		return modelAndView;
	}

	@GetMapping("/dashboard")
	public ModelAndView dashboard(@RequestParam(value = "pondId", required = false) Long pondId,
								  @RequestParam(value = "index", required = false, defaultValue = "0") String index,
								  @RequestParam(value = "isSelect", required = false, defaultValue = "false") String isSelect) {
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		Long projectId = user.getProjectId();

//		// todo temp project id
//		if (projectId.equals(1384027378088828930L)) {
//			projectId = 1361229838336724993L;
//		}
		List<PondVO> pondVOPage = pondService.findAllByProjectId(projectId);

		ModelAndView modelAndView = new ModelAndView("pond/dashboard");
		modelAndView.addObject("pondPage", pondVOPage);
		if (Objects.nonNull(pondVOPage)) {
			PondVO pondVO = pondVOPage.get(0);
			if (Objects.nonNull(pondId)) {
				pondVO = pondService.findById(pondId);
			}

			// todo temp


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

			// todo temp
			IPage<TsDataVO> tsDataVO = tsDataService.findLatestByPond(0L, 1L, pondVO.getPondId());
			IPage<TsDataNCVO> latestNH4H = tsDataNCService.findLatestNH4NByPond(0L, 1L, pondVO.getPondId());
			IPage<TsDataNCVO> latestCOD = tsDataNCService.findLatestCODByPond(0L, 1L, pondVO.getPondId());
			if (pondVO.getPondId() == 1433376476664778753L) {
				// 1
				tsDataVO = tsDataService.findLatestByPond(0L, 1L, 1361230754313998338L);
			} else if (pondVO.getPondId() == 1433376683557212161L) {
				// 2
				tsDataVO = tsDataService.findLatestByPond(0L, 1L, 1361231034657083394L);
			} else if (pondVO.getPondId() == 1433376877573132289L) {
				// 3
				tsDataVO = tsDataService.findLatestByPond(0L, 1L, 1361231288768991233L);
			} else if (pondVO.getPondId() == 1433377723086098433L) {
				// 4
				tsDataVO = tsDataService.findLatestByPond(0L, 1L, 1361231288768991233L);
			}
			modelAndView.addObject("tsData", tsDataVO);
			modelAndView.addObject("tsDataN", latestNH4H);
			modelAndView.addObject("tsDataC", latestCOD);


			// 生产设备列表
			List<DeviceVO> prodDevices = deviceService.findByPondAndType(pondVO.getPondId(), DeviceType.PROD.getCode());
			modelAndView.addObject("prodDevices", prodDevices);

			YsTokenVO ysTokenVO = ysTokenService.findToken();
			modelAndView.addObject("ysToken", ysTokenVO);

			List<DtuVO> dtuVOS = dtuService.findByPondId(pondVO.getPondId());
			// todo temp

			if (pondVO.getPondId() == 1433376476664778753L) {
				// 1
				dtuVOS = new ArrayList<>();
				DtuVO dtuVO1 = dtuService.findById(1376415850762248193L);
//				DtuVO dtuVO2 = dtuService.findById(1367380902871056386L);
//				DtuVO dtuVO3 = dtuService.findById(1376783192704823297L);
				dtuVOS.add(dtuVO1);
//				dtuVOS.add(dtuVO2);
//				dtuVOS.add(dtuVO3);
			} else if (pondVO.getPondId() == 1433376683557212161L) {
				// 2
				dtuVOS = new ArrayList<>();
				DtuVO dtuVO1 = dtuService.findById(1376783394522148865L);
//				DtuVO dtuVO2 = dtuService.findById(1376783698412056578L);
//				DtuVO dtuVO3 = dtuService.findById(1376783850724012034L);
				dtuVOS.add(dtuVO1);
//				dtuVOS.add(dtuVO2);
//				dtuVOS.add(dtuVO3);
			} else if (pondVO.getPondId() == 1433376877573132289L) {
				// 3
				dtuVOS = new ArrayList<>();
				DtuVO dtuVO1 = dtuService.findById(1376784035848007682L);
//				DtuVO dtuVO2 = dtuService.findById(1376784598631329794L);
//				DtuVO dtuVO3 = dtuService.findById(1376784791028248577L);
				dtuVOS.add(dtuVO1);
//				dtuVOS.add(dtuVO2);
//				dtuVOS.add(dtuVO3);
			} else if (pondVO.getPondId() == 1433377723086098433L) {
				// 4
				dtuVOS = new ArrayList<>();
				DtuVO dtuVO1 = dtuService.findById(1376784972511588354L);
//				DtuVO dtuVO2 = dtuService.findById(1376785330927448065L);
//				DtuVO dtuVO3 = dtuService.findById(1376838611380879362L);
				dtuVOS.add(dtuVO1);
//				dtuVOS.add(dtuVO2);
//				dtuVOS.add(dtuVO3);
			}
			// todo temp

			modelAndView.addObject("dtus", dtuVOS);

			List<TaskVO> taskVOS = taskService.findByPond(pondVO.getPondId());
			if (CollectionUtils.isNotEmpty(taskVOS)) {
				Map<Integer, List<TaskVO>> taskVOMap = taskVOS.stream().collect(Collectors.groupingBy(TaskVO::getStatus));
				modelAndView.addObject("assignedTasks", taskVOMap.get(TaskStatus.ASSIGNED.getCode()));
				modelAndView.addObject("doingTasks", taskVOMap.get(TaskStatus.DOING.getCode()));
				modelAndView.addObject("doneTasks", taskVOMap.get(TaskStatus.DONE.getCode()));
			}
		}
		return modelAndView;
	}
}

