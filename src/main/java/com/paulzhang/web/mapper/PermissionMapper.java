package com.paulzhang.web.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.paulzhang.web.entity.Permission;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PermissionMapper extends BaseMapper<Permission> {

	@Select("SELECT p.* FROM auth_permission p, auth_role_permission ar, auth_role r\n" +
		"WHERE ar.ROLE_ID = r.ROLE_ID\n" +
		"AND ar.PERMISSION_ID = p.PERMISSION_ID\n" +
		"AND r.ROLE_ID = #{roleId}")
	List<Permission> selectByRoleId(Long roleId);
}
