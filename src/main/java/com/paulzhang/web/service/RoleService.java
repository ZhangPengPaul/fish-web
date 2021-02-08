package com.paulzhang.web.service;

import com.paulzhang.web.domain.RolePermissionVO;
import com.paulzhang.web.domain.RoleVO;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

public interface RoleService {

	List<RoleVO> findAll() throws InvocationTargetException, IllegalAccessException;

	int add(RoleVO roleVO);

	RoleVO findById(Long roleId);

	int addPermissions(Long roleId, List<Long> permissionIds);

	List<RolePermissionVO> findRolePermissions(Long roleId);
}
