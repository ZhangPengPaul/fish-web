package com.paulzhang.web.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.common.constants.DeviceType;
import com.paulzhang.web.domain.DeviceVO;
import com.paulzhang.web.domain.PondVO;
import com.paulzhang.web.domain.TsDataVO;
import com.paulzhang.web.domain.YsTokenVO;
import com.paulzhang.web.entity.User;
import com.paulzhang.web.service.DeviceService;
import com.paulzhang.web.service.PondService;
import com.paulzhang.web.service.TsDataService;
import com.paulzhang.web.service.YsTokenService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mobile/pond")
public class MobilePondController {

	@Resource
	private PondService pondService;

	@Resource
	private TsDataService tsDataService;

	@Resource
	private YsTokenService ysTokenService;

	@Resource
	private DeviceService deviceService;

	@GetMapping("/list")
	public ModelAndView list() {
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		Long projectId = user.getProjectId();

		if (projectId.equals(1384027378088828930L)) {
			projectId = 1361229838336724993L;
		}

		List<PondVO> pondVOPage = pondService.findAllByProjectId(projectId);

		if (projectId.equals(1384027378088828930L)) {
			pondVOPage = pondVOPage.subList(0, 3);
		}

		ModelAndView modelAndView = new ModelAndView("pond/mobile/list");
		modelAndView.addObject("pondPage", pondVOPage);

		Map<Long, IPage<TsDataVO>> map = new HashMap<>();
		for (PondVO pondVO : pondVOPage) {
			IPage<TsDataVO> tsDataVO = tsDataService.findLatestByPond(0, 1, pondVO.getPondId());
			map.put(pondVO.getPondId(), tsDataVO);
		}

		modelAndView.addObject("tsDataMap", map);
		return modelAndView;
	}

	@GetMapping("/detail/{pondId}")
	public ModelAndView detail(@PathVariable("pondId") Long pondId) {
		PondVO pondVO = pondService.findById(pondId);
		ModelAndView modelAndView = new ModelAndView("pond/mobile/detail");
		modelAndView.addObject("pond", pondVO);

		IPage<TsDataVO> tsDataVOIPage = tsDataService.findLatestByPond(0, 1, pondId);
		modelAndView.addObject("tsData", tsDataVOIPage);

		IPage<TsDataVO> tsDataVOS = tsDataService.findLatestByPond(0, 100, pondId);
		modelAndView.addObject("tsDatas", tsDataVOS);

		YsTokenVO ysTokenVO = ysTokenService.findToken();
		modelAndView.addObject("ysToken", ysTokenVO);

		// 生产设备列表
		List<DeviceVO> prodDevices = deviceService.findByPondAndType(pondId, DeviceType.PROD.getCode());
		modelAndView.addObject("prodDevices", prodDevices);
		return modelAndView;
	}

}
