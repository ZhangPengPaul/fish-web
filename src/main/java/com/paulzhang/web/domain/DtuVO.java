package com.paulzhang.web.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DtuVO {

	private Long dtuId;
	private Long pondId;
	@NotBlank(message = "DTU编号不能为空")
	private String code;
	private String memo;
}
