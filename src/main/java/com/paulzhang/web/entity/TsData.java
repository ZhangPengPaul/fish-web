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
@TableName("ts_data")
public class TsData extends Model<TsData> {

	@TableId(type = IdType.ASSIGN_ID, value = "DATA_ID")
	private Long dataId;
	@TableField(value = "TEMP")
	private float temp = 0.0F;
	@TableField(value = "OXYGEN")
	private float oxygen = 0.0F;
	@TableField(value = "PH")
	private float ph = 0.0F;
	@TableField(value = "POND_ID")
	private Long pondId;
	@TableField(value = "TIMESTAMP")
	private Date timestamp;
}
