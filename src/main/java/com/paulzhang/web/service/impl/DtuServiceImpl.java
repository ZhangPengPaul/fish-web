package com.paulzhang.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.paulzhang.web.domain.DeviceVO;
import com.paulzhang.web.domain.DtuVO;
import com.paulzhang.web.entity.Dtu;
import com.paulzhang.web.entity.Pond;
import com.paulzhang.web.mapper.DtuMapper;
import com.paulzhang.web.service.DeviceService;
import com.paulzhang.web.service.DtuService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
public class DtuServiceImpl implements DtuService {
	@Resource
	private DtuMapper dtuMapper;

	@Resource
	private DeviceService deviceService;

	@Override
	public int add(DtuVO dtuVO) throws InvocationTargetException, IllegalAccessException {
		int count = 0;
		if (Objects.nonNull(dtuVO)) {
			DtuVO existsDtu = this.findByCode(dtuVO.getCode());
			if (Objects.isNull(existsDtu)) {
				Dtu dtu = new Dtu();
				BeanUtils.copyProperties(dtu, dtuVO);
				dtu.setCreateTime(new Date());
				count = dtuMapper.insert(dtu);
			}
		}

		return count;
	}

	@Override
	public DtuVO findByCode(String code) {
		QueryWrapper<Dtu> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("CODE", code);
		Dtu dtu = dtuMapper.selectOne(queryWrapper);
		DtuVO dtuVO = null;
		if (Objects.nonNull(dtu)) {
			dtuVO = new DtuVO();
			try {
				BeanUtils.copyProperties(dtuVO, dtu);
			} catch (IllegalAccessException | InvocationTargetException e) {
				log.error("copy dtu error", e);
			}
		}
		return dtuVO;
	}

	@Override
	public List<DtuVO> findByPondId(Long pondId) {
		QueryWrapper<Dtu> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("POND_ID", pondId);
		List<Dtu> dtus = dtuMapper.selectList(queryWrapper);
		DtuVO dtuVO;
		List<DtuVO> dtuVOS = null;
		if (CollectionUtils.isNotEmpty(dtus)) {
			dtuVOS = new ArrayList<>(dtus.size());
			for (Dtu dtu : dtus) {
				dtuVO = new DtuVO();
				try {
					BeanUtils.copyProperties(dtuVO, dtu);
					dtuVOS.add(dtuVO);
				} catch (IllegalAccessException | InvocationTargetException e) {
					e.printStackTrace();
				}
			}
		}
		return dtuVOS;
	}

	@Override
	public int deleteByPondId(Long dtuId, Long pondId) {
		int count = 0;
		List<DeviceVO> deviceVOS = deviceService.findByDtuId(dtuId);
		if (CollectionUtils.isEmpty(deviceVOS)) {
			QueryWrapper<Dtu> queryWrapper = new QueryWrapper<>();
			queryWrapper.eq("DTU_ID", dtuId).eq("POND_ID", pondId);
			count = dtuMapper.delete(queryWrapper);
		}

		return count;
	}

	@Override
	public List<DtuVO> findAll() {
		List<Dtu> dtus = dtuMapper.selectList(null);
		List<DtuVO> dtuVOS = null;
		if (CollectionUtils.isNotEmpty(dtus)) {
			dtuVOS = new ArrayList<>(dtus.size());
			for (Dtu dtu : dtus) {
				DtuVO dtuVO = new DtuVO();
				try {
					BeanUtils.copyProperties(dtuVO, dtu);
					dtuVOS.add(dtuVO);
				} catch (IllegalAccessException | InvocationTargetException e) {
					e.printStackTrace();
				}
			}
		}
		return dtuVOS;
	}
}
