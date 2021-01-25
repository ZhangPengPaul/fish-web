package com.paulzhang.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.paulzhang.web.domain.DtuVO;
import com.paulzhang.web.entity.Dtu;
import com.paulzhang.web.entity.Pond;
import com.paulzhang.web.mapper.DtuMapper;
import com.paulzhang.web.service.DtuService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Objects;

@Slf4j
@Service
public class DtuServiceImpl implements DtuService {
	@Resource
	private DtuMapper dtuMapper;

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
}
