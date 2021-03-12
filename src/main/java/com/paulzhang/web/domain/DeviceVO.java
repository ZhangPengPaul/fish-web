package com.paulzhang.web.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DeviceVO {

	private Long deviceId;
	@NotNull(message = "池塘编号不能为空")
	private Long pondId;
	@NotBlank(message = "设备名称不能为空")
	private String name;
	@NotNull(message = "设备类型不能为空")
	private Integer type;
	@NotNull(message = "DTU编号不能为空")
	private Long dtuId;
	@NotNull(message = "DTU通道不能为空")
	private String dtuChannel;
	private String memo;
	private Date createTime;
}
