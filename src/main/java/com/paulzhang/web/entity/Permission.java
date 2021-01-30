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
@TableName("auth_permission")
public class Permission extends Model<Permission> {

	@TableId(type = IdType.ASSIGN_ID,value = "PERMISSION_ID")
	private Long permissionId;
	@TableField(value = "NAME")
	private String name;
	@TableField(value = "URL")
	private String url;
	@TableField(value = "MEMO")
	private String memo;
	@TableField(value = "CREATE_TIME")
	private Date createTime;
}
