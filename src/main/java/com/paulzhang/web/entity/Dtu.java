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
@TableName("dtu")
public class Dtu extends Model<Dtu> {

	@TableId(type = IdType.ASSIGN_ID, value = "DTU_ID")
	private Long dtuId;
	@TableField(value = "POND_ID")
	private Long pondId;
	@TableField(value = "CODE")
	private String code;
	@TableField(value = "MEMO")
	private String memo;
	@TableField(value = "CREATE_TIME")
	private Date createTime;

}
