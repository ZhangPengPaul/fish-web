package com.paulzhang.web.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.paulzhang.web.entity.Role;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RoleMapper extends BaseMapper<Role> {

	@Select("SELECT r.* FROM auth_user u,auth_user_role ur,auth_role r\n" +
		"WHERE ur.ROLE_ID = r.ROLE_ID\n" +
		"AND ur.USER_ID = u.USER_ID\n" +
		"AND u.USER_ID = #{userId}")
	List<Role> selectByUserId(Long userId);
}
