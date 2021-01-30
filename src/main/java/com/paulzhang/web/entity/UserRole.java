package com.paulzhang.web.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.*;

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("auth_user_role")
public class UserRole extends Model<UserRole> {

	@TableField(value = "USER_ID")
	private Long userId;
	@TableField(value = "ROLE_ID")
	private Long roleId;
}
