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
@TableName("auth_role_permission")
public class RolePermission extends Model<RolePermission> {

	@TableField(value = "ROLE_ID")
	private Long roleId;
	@TableField(value = "PERMISSION_ID")
	private Long permissionId;
}
