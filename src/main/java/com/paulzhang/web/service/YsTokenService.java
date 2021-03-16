package com.paulzhang.web.service;

import com.paulzhang.web.domain.YsTokenVO;

public interface YsTokenService {

	int add(YsTokenVO ysTokenVO);

	YsTokenVO findToken();

	int update(YsTokenVO ysTokenVO);
}
