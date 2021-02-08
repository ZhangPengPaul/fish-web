package com.paulzhang.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.paulzhang.web.domain.RolePermissionVO;
import com.paulzhang.web.domain.RoleVO;
import com.paulzhang.web.entity.Role;
import com.paulzhang.web.entity.RolePermission;
import com.paulzhang.web.mapper.RoleMapper;
import com.paulzhang.web.mapper.RolePermissionMapper;
import com.paulzhang.web.service.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Resource
	private RolePermissionMapper rolePermissionMapper;

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

	@Override
	public RoleVO findById(Long roleId) {
		Role role = roleMapper.selectById(roleId);
		RoleVO roleVO = null;
		if (Objects.nonNull(role)) {
			roleVO = new RoleVO();
			try {
				BeanUtils.copyProperties(roleVO, role);
			} catch (IllegalAccessException | InvocationTargetException e) {
				log.error("role copy error", e);
			}
		}
		return roleVO;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int addPermissions(Long roleId, List<Long> permissionIds) {
		QueryWrapper<RolePermission> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("ROLE_ID", roleId);
		rolePermissionMapper.delete(queryWrapper);

		int count = 0;
		if (CollectionUtils.isNotEmpty(permissionIds)) {
			for (Long permissionId : permissionIds) {
				RolePermission rolePermission = new RolePermission();
				rolePermission.setPermissionId(permissionId);
				rolePermission.setRoleId(roleId);
				count += rolePermissionMapper.insert(rolePermission);
			}
		}
		return count;
	}

	@Override
	public List<RolePermissionVO> findRolePermissions(Long roleId) {
		QueryWrapper<RolePermission> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("ROLE_ID", roleId);
		List<RolePermission> rolePermissions = rolePermissionMapper.selectList(queryWrapper);
		List<RolePermissionVO> rolePermissionVOS = null;
		if (CollectionUtils.isNotEmpty(rolePermissions)) {
			rolePermissionVOS = new ArrayList<>(rolePermissions.size());
			for (RolePermission rolePermission : rolePermissions) {
				RolePermissionVO rolePermissionVO = new RolePermissionVO();
				try {
					BeanUtils.copyProperties(rolePermissionVO, rolePermission);
					rolePermissionVOS.add(rolePermissionVO);
				} catch (IllegalAccessException | InvocationTargetException e) {
					log.error("role-permission copy error", e);
				}

			}
		}
		return rolePermissionVOS;
	}
}
