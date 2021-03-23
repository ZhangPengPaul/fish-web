package com.paulzhang.web.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TsDataNCVO {

	private Long dataId;
	private float nh4h;
	private float cod;
	private Long pondId;
	private Date timestamp;
}
