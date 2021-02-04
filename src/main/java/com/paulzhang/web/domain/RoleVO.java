package com.paulzhang.web.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RoleVO {
	private Long roleId;
	private String name;
	private String memo;
	private Date createTime;
}
