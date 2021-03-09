package com.paulzhang.web.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.domain.PondVO;
import com.paulzhang.web.domain.TsDataVO;
import com.paulzhang.web.entity.User;
import com.paulzhang.web.service.PondService;
import com.paulzhang.web.service.TsDataService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Date;
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

	@GetMapping("/list")
	public ModelAndView list() {
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		Long projectId = user.getProjectId();
		List<PondVO> pondVOPage = pondService.findAllByProjectId(projectId);
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
		return modelAndView;
	}

}
