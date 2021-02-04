package com.paulzhang.web.service.impl;

import com.paulzhang.web.domain.RoleVO;
import com.paulzhang.web.entity.Role;
import com.paulzhang.web.mapper.RoleMapper;
import com.paulzhang.web.service.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
public class RoleServiceImpl implements RoleService {

	@Resource
	private RoleMapper roleMapper;

	@Override
	public List<RoleVO> findAll() throws InvocationTargetException, IllegalAccessException {
		List<Role> roles = roleMapper.selectList(null);
		List<RoleVO> roleVOS = null;
		if (CollectionUtils.isNotEmpty(roles)) {
			roleVOS = new ArrayList<>(roles.size());
			for (Role role : roles) {
				RoleVO roleVO = new RoleVO();
				BeanUtils.copyProperties(roleVO, role);
				roleVOS.add(roleVO);
			}
		}
		return roleVOS;
	}

	@Override
	public int add(RoleVO roleVO) {
		int count = 0;
		if (Objects.nonNull(roleVO)) {
			Role role = new Role();
			try {
				BeanUtils.copyProperties(role, roleVO);
				count = roleMapper.insert(role);
			} catch (IllegalAccessException | InvocationTargetException e) {
				log.error("role copy error", e);
			}
		}
		return count;
	}
}
