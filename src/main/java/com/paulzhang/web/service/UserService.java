package com.paulzhang.web.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.domain.UserVO;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

public interface UserService {

	IPage<UserVO> findAllByPage(long current, long size);

	int add(UserVO userVO) throws InvocationTargetException, IllegalAccessException;

	int addUserRole(Long userId, Long roleId);

	List<UserVO> findByProjectId(Long projectId);
}
