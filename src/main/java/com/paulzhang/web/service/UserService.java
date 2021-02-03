package com.paulzhang.web.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.domain.UserVO;

public interface UserService {

	IPage<UserVO> findAllByPage(long current, long size);
}
