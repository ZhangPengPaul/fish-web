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
@TableName("task")
public class Task extends Model<Task> {

	@TableId(type = IdType.ASSIGN_ID, value = "TASK_ID")
	private Long taskId;
	@TableField(value = "TITLE")
	private String title;
	@TableField(value = "POND_ID")
	private Long pondId;
	@TableField(value = "MEMO")
	private String memo;
	@TableField(value = "TYPE")
	private Integer type;
	@TableField(value = "START_TIME")
	private Date startTime;
	@TableField(value = "END_TIME")
	private Date endTime;
	@TableField(value = "CREATE_TIME")
	private Date createTime;
	@TableField(value = "USER_ID")
	private Long userId;
	@TableField(value = "STATUS")
	private Integer status;
}
