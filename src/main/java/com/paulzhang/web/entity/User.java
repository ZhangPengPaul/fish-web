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
@TableName("auth_user")
public class User extends Model<User> {

	@TableId(type = IdType.ASSIGN_ID, value = "USER_ID")
	private Long userId;
	@TableField(value = "USERNAME")
	private String username;
	@TableField(value = "PASSWORD")
	private String password;
	@TableField(value = "PASSWORD_SALT")
	private String passwordSalt;
	@TableField(value = "CREATE_TIME")
	private Date createTime;
	@TableField(value = "PROJECT_ID")
	private Long projectId;
}
