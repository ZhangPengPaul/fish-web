package com.paulzhang.web.service;

import com.paulzhang.web.domain.PermissionVO;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

public interface PermissionService {

	List<PermissionVO> findAll() throws InvocationTargetException, IllegalAccessException;

	int add(PermissionVO permissionVO);
}
