package com.paulzhang.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.paulzhang.web.domain.PondVO;
import com.paulzhang.web.entity.Pond;
import com.paulzhang.web.mapper.PondMapper;
import com.paulzhang.web.service.PondService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
public class PondServiceImpl implements PondService {

	@Resource
	private PondMapper pondMapper;

	@Override
	public int add(PondVO pondVO) throws InvocationTargetException, IllegalAccessException {
		int count = 0;
		if (Objects.nonNull(pondVO)) {
			Pond pond = new Pond();
			BeanUtils.copyProperties(pond, pondVO);
			pond.setCreateTime(new Date());
			count = pondMapper.insert(pond);
		}

		return count;
	}

	@Override
	public IPage<PondVO> findAllByPage(long current, long size) {
		QueryWrapper<Pond> queryWrapper = new QueryWrapper<>();
		queryWrapper.orderByDesc("CREATE_TIME");
		IPage<Pond> page = new Page<>();
		page.setCurrent(current);
		page.setSize(size);
		IPage<Pond> pondPage = pondMapper.selectPage(page, queryWrapper);
		IPage<PondVO> pondVOS = null;
		List<PondVO> pondVOList;
		if (pondPage.getTotal() > 0) {
			pondVOS = new Page<>();
			List<Pond> pondList = pondPage.getRecords();
			pondVOList = new ArrayList<>(pondList.size());
			List<PondVO> finalPondVOList = pondVOList;
			pondList.forEach(pond -> {
				PondVO pondVO = new PondVO();
				try {
					BeanUtils.copyProperties(pondVO, pond);
					finalPondVOList.add(pondVO);
				} catch (IllegalAccessException | InvocationTargetException e) {
					log.error("pond copy error", e);
				}
			});
			pondVOS.setSize(pondPage.getSize());
			pondVOS.setCurrent(pondPage.getCurrent());
			pondVOS.setPages(pondPage.getPages());
			pondVOS.setRecords(finalPondVOList);
			pondVOS.setTotal(pondPage.getTotal());
		}
		return pondVOS;
	}

	@Override
	public PondVO findById(Long pondId) {
		Pond pond = pondMapper.selectById(pondId);
		PondVO pondVO = null;
		if (Objects.nonNull(pond)) {
			pondVO = new PondVO();
			try {
				BeanUtils.copyProperties(pondVO, pond);
			} catch (IllegalAccessException | InvocationTargetException e) {
				log.error("pond copy error", e);
			}
		}
		return pondVO;
	}
}
