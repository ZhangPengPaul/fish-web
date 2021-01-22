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
@TableName(value = "pond")
public class Pond extends Model<Pond> {
	@TableId(type = IdType.ASSIGN_ID, value = "POND_ID")
	private Long pondId;
	@TableField(value = "NAME")
	private String name;
	@TableField(value = "TYPE")
	private Integer type;
	@TableField(value = "LENGTH")
	private Float length;
	@TableField(value = "WIDTH")
	private Float width;
	@TableField(value = "DEPTH")
	private Float depth;
	@TableField(value = "AREA")
	private Float area;
	@TableField(value = "MEMO")
	private String memo;
	@TableField(value = "OUTLINE")
	private String outline;
	@TableField(value = "CREATE_TIME")
	private Date createTime;
}
