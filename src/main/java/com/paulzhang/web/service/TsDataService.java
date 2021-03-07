package com.paulzhang.web.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.domain.TsDataVO;
import com.paulzhang.web.entity.TsData;

public interface TsDataService {

	int add(TsData tsData);

	IPage<TsDataVO> findLatestByPond(long current, long size, Long pondId);
}
