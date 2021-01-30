package com.paulzhang.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.paulzhang.web.entity.Permission;
import com.paulzhang.web.entity.Role;
import com.paulzhang.web.entity.User;
import com.paulzhang.web.mapper.PermissionMapper;
import com.paulzhang.web.mapper.RoleMapper;
import com.paulzhang.web.mapper.UserMapper;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

@Service
public class UserAuthRealm extends AuthorizingRealm {

	@Resource
	private RoleMapper roleMapper;
	@Resource
	private PermissionMapper permissionMapper;
	@Resource
	private UserMapper userMapper;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		User user = (User) principalCollection.getPrimaryPrincipal();
		List<Role> roleList = roleMapper.selectByUserId(user.getUserId());
		for (Role role : roleList) {
			authorizationInfo.addRole(role.getName());
			List<Permission> permissionList = permissionMapper.selectByRoleId(role.getRoleId());
			for (Permission permission : permissionList) {
				authorizationInfo.addStringPermission(permission.getName());
			}
		}
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
		String username = (String) authenticationToken.getPrincipal();
		QueryWrapper<User> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("USERNAME", username);
		User user = userMapper.selectOne(queryWrapper);
		if (Objects.isNull(user)) {
			return null;
		}
		String credentials = user.getPasswordSalt() + user.getUsername() + user.getPasswordSalt();
		return new SimpleAuthenticationInfo(user, user.getPassword(), ByteSource.Util.bytes(credentials), getName());
	}

	@PostConstruct
	public void setHashedCredentialsMatcher() {
		this.setCredentialsMatcher(hashedCredentialsMatcher());
	}

	public HashedCredentialsMatcher hashedCredentialsMatcher() {
		HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
		hashedCredentialsMatcher.setHashAlgorithmName("md5");
		hashedCredentialsMatcher.setHashIterations(1024);
		return hashedCredentialsMatcher;
	}
}
