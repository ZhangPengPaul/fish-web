package com.paulzhang.web.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.domain.TsDataVO;
import com.paulzhang.web.entity.TsData;

import java.util.Date;
import java.util.List;

public interface TsDataService {

	int add(TsData tsData);

	IPage<TsDataVO> findLatestByPond(long current, long size, Long pondId);

	List<TsDataVO> findBetweenDateByPond(Date start, Date end, Long pondId);
}
