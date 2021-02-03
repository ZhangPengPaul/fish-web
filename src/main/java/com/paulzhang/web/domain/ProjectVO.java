package com.paulzhang.web.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProjectVO {

	private Long projectId;
	@NotBlank(message = "项目名称不能为空")
	private String name;
	@NotBlank(message = "项目地址不能为空")
	private String address;
	private String memo;
	private Date createTime;
}
