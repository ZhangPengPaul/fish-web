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
@TableName("device")
public class Device extends Model<Device> {

	@TableId(type = IdType.ASSIGN_ID, value = "DEVICE_ID")
	private Long deviceId;
	@TableField(value = "POND_ID")
	private Long pondId;
	@TableField(value = "NAME")
	private String name;
	@TableField(value = "TYPE")
	private Integer type;
	@TableField(value = "DTU_ID")
	private Long dtuId;
	@TableField(value = "DTU_CHANNEL")
	private String dtuChannel;
	@TableField(value = "MEMO")
	private String memo;
	@TableField(value = "CREATE_TIME")
	private Date createTime;
}
