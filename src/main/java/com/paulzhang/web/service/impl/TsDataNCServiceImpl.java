package com.paulzhang.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.paulzhang.web.domain.TsDataNCVO;
import com.paulzhang.web.domain.TsDataVO;
import com.paulzhang.web.entity.TsData;
import com.paulzhang.web.entity.TsDataNC;
import com.paulzhang.web.mapper.TsDataNCMapper;
import com.paulzhang.web.service.TsDataNCService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Service("tsDataNCService")
public class TsDataNCServiceImpl implements TsDataNCService {

	@Resource
	private TsDataNCMapper tsDataNCMapper;

	@Override
	public int add(TsDataNC tsDataNC) {
		return tsDataNCMapper.insert(tsDataNC);
	}

	@Override
	public IPage<TsDataNCVO> findLatestByPond(long current, long size, Long pondId) {
		QueryWrapper<TsDataNC> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("POND_ID", pondId)
			.orderByDesc("TIMESTAMP");

		IPage<TsDataNC> page = new Page<>();
		page.setCurrent(current);
		page.setSize(size);

		IPage<TsDataNC> tsDataIPage = tsDataNCMapper.selectPage(page, queryWrapper);
		IPage<TsDataNCVO> tsDataVOs = null;
		List<TsDataNCVO> tsDataVOList;
		if (tsDataIPage.getTotal() > 0) {
			tsDataVOs = new Page<>();
			List<TsDataNC> tsDataList = tsDataIPage.getRecords();
			tsDataVOList = new ArrayList<>(tsDataList.size());
			for (TsDataNC tsData : tsDataList) {
				TsDataNCVO tsDataVO = new TsDataNCVO();
				try {
					BeanUtils.copyProperties(tsDataVO, tsData);
					tsDataVOList.add(tsDataVO);
				} catch (IllegalAccessException | InvocationTargetException e) {
					log.error("tsDataNC copy error", e);
				}
			}
			tsDataVOs.setSize(tsDataIPage.getSize());
			tsDataVOs.setCurrent(tsDataIPage.getCurrent());
			tsDataVOs.setPages(tsDataIPage.getPages());
			tsDataVOs.setRecords(tsDataVOList);
			tsDataVOs.setTotal(tsDataIPage.getTotal());
		}
		return tsDataVOs;
	}

	@Override
	public List<TsDataNCVO> findBetweenDateByPond(Date start, Date end, Long pondId) {
		QueryWrapper<TsDataNC> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("POND_ID", pondId)
			.between("TIMESTAMP", start, end);
		List<TsDataNC> tsDataList = tsDataNCMapper.selectList(queryWrapper);
		List<TsDataNCVO> tsDataVOS = null;
		if (CollectionUtils.isNotEmpty(tsDataList)) {
			tsDataVOS = new ArrayList<>(tsDataList.size());
			for (TsDataNC tsData : tsDataList) {
				TsDataNCVO tsDataVO = new TsDataNCVO();
				try {
					BeanUtils.copyProperties(tsDataVO, tsData);
					tsDataVOS.add(tsDataVO);
				} catch (IllegalAccessException | InvocationTargetException e) {
					log.error("tsDataNC copy error", e);
				}
			}
		}
		return tsDataVOS;
	}
}
