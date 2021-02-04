package com.paulzhang.web.service.impl;

import com.paulzhang.web.domain.PermissionVO;
import com.paulzhang.web.entity.Permission;
import com.paulzhang.web.mapper.PermissionMapper;
import com.paulzhang.web.service.PermissionService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
public class PermissionServiceImpl implements PermissionService {

	@Resource
	private PermissionMapper permissionMapper;

	@Override
	public List<PermissionVO> findAll() throws InvocationTargetException, IllegalAccessException {
		List<Permission> permissionList = permissionMapper.selectList(null);
		List<PermissionVO> permissionVOS = null;
		if (CollectionUtils.isNotEmpty(permissionList)) {
			permissionVOS = new ArrayList<>(permissionList.size());
			for (Permission permission : permissionList) {
				PermissionVO permissionVO = new PermissionVO();
				BeanUtils.copyProperties(permissionVO, permission);
				permissionVOS.add(permissionVO);
			}
		}
		return permissionVOS;
	}

	@Override
	public int add(PermissionVO permissionVO) {
		int count = 0;
		if (Objects.nonNull(permissionVO)) {
			Permission permission = new Permission();
			try {
				BeanUtils.copyProperties(permission, permissionVO);
				permission.setCreateTime(new Date());
				count = permissionMapper.insert(permission);
			} catch (IllegalAccessException | InvocationTargetException e) {
				log.error("permission copy error", e);
			}

		}
		return count;
	}
}
