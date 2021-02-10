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
public class TaskVO {
	private Long taskId;
	private String title;
	private Long pondId;
	private String memo;
	private Integer type;
	private Date startTime;
	private Date endTime;
	private Date createTime;
}
