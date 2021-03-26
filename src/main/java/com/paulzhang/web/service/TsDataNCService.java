package com.paulzhang.web.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.domain.TsDataNCVO;
import com.paulzhang.web.domain.TsDataVO;
import com.paulzhang.web.entity.TsData;
import com.paulzhang.web.entity.TsDataNC;

import java.util.Date;
import java.util.List;

public interface TsDataNCService {

	int add(TsDataNC tsDataNC);

	IPage<TsDataNCVO> findLatestNH4NByPond(long current, long size, Long pondId);

	IPage<TsDataNCVO> findLatestCODByPond(long current, long size, Long pondId);

	List<TsDataNCVO> findBetweenDateByPond(Date start, Date end, Long pondId);
}
