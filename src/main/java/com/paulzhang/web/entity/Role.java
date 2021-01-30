package com.paulzhang.web.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.*;

import java.util.Date;

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("auth_role")
public class Role extends Model<Role> {

	@TableId(type = IdType.ASSIGN_ID, value = "ROLE_ID")
	private Long roleId;
	@TableField(value = "NAME")
	private String name;
	@TableField(value = "MEMO")
	private String memo;
	@TableField(value = "CREATE_TIME")
	private Date createTime;
}
