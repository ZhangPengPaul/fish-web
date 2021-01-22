package com.paulzhang.web.service.impl;

import com.paulzhang.web.domain.PondVO;
import com.paulzhang.web.entity.Pond;
import com.paulzhang.web.mapper.PondMapper;
import com.paulzhang.web.service.PondService;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Objects;

@Service
public class PondServiceImpl implements PondService {

	@Resource
	private PondMapper pondMapper;

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
}
