package com.paulzhang.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.paulzhang.web.domain.ProjectVO;
import com.paulzhang.web.domain.TsDataVO;
import com.paulzhang.web.entity.Project;
import com.paulzhang.web.entity.TsData;
import com.paulzhang.web.mapper.TsDataMapper;
import com.paulzhang.web.service.TsDataService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service("tsDataService")
public class TsDataServiceImpl implements TsDataService {

	@Resource
	private TsDataMapper tsDataMapper;

	@Override
	public int add(TsData tsData) {
		return tsDataMapper.insert(tsData);
	}

	@Override
	public IPage<TsDataVO> findLatestByPond(long current, long size, Long pondId) {
		QueryWrapper<TsData> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("POND_ID", pondId)
			.orderByDesc("TIMESTAMP");

		IPage<TsData> page = new Page<>();
		page.setCurrent(current);
		page.setSize(size);

		IPage<TsData> tsDataIPage = tsDataMapper.selectPage(page, queryWrapper);
		IPage<TsDataVO> tsDataVOs = null;
		List<TsDataVO> tsDataVOList;
		if (tsDataIPage.getTotal() > 0) {
			tsDataVOs = new Page<>();
			List<TsData> tsDataList = tsDataIPage.getRecords();
			tsDataVOList = new ArrayList<>(tsDataList.size());
			for (TsData tsData : tsDataList) {
				TsDataVO tsDataVO = new TsDataVO();
				try {
					BeanUtils.copyProperties(tsDataVO, tsData);
					tsDataVOList.add(tsDataVO);
				} catch (IllegalAccessException | InvocationTargetException e) {
					log.error("tsData copy error", e);
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
}
