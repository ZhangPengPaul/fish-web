package com.paulzhang.web.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PondVO {

	@NotBlank(message = "池塘名不能为空")
	private String name;
	@NotNull(message = "池塘类型不能为空")
	private Integer type;
	@NotNull(message = "池塘长度不能为空")
	private Float length;
	@NotNull(message = "池塘宽度不能为空")
	private Float width;
	@NotNull(message = "池塘深度不能为空")
	private Float depth;
	@NotNull(message = "池塘面积不能为空")
	private Float area;
	private String memo;
	@NotBlank(message = "池塘轮廓不能为空")
	private String outline;

}
