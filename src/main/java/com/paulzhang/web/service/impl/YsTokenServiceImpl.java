package com.paulzhang.web.service.impl;

import com.paulzhang.web.domain.YsTokenVO;
import com.paulzhang.web.entity.YsToken;
import com.paulzhang.web.mapper.YsTokenMapper;
import com.paulzhang.web.service.YsTokenService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
public class YsTokenServiceImpl implements YsTokenService {

	@Resource
	private YsTokenMapper ysTokenMapper;

	@Override
	public int add(YsTokenVO ysTokenVO) {
		int count = 0;
		if (Objects.nonNull(ysTokenVO)) {
			YsToken ysToken = new YsToken();
			try {
				BeanUtils.copyProperties(ysToken, ysTokenVO);
				count = ysTokenMapper.insert(ysToken);
			} catch (IllegalAccessException | InvocationTargetException e) {
				log.error("ys token copy error", e);
			}

		}
		return count;
	}

	@Override
	public YsTokenVO findToken() {
		List<YsToken> tokenList = ysTokenMapper.selectList(null);
		YsTokenVO tokenVO = null;
		if (CollectionUtils.isNotEmpty(tokenList)) {
			tokenVO = new YsTokenVO();
			YsToken token = tokenList.get(0);
			try {
				BeanUtils.copyProperties(tokenVO, token);
			} catch (IllegalAccessException | InvocationTargetException e) {
				log.error("ys token copy error", e);
			}
		}
		return tokenVO;
	}

	@Override
	public int update(YsTokenVO ysTokenVO) {
		int count = 0;
		YsToken token = new YsToken();
		try {
			BeanUtils.copyProperties(token, ysTokenVO);
			count = ysTokenMapper.updateById(token);
		} catch (IllegalAccessException | InvocationTargetException e) {
			log.error("ys token copy error", e);
		}
		return count;
	}
}
