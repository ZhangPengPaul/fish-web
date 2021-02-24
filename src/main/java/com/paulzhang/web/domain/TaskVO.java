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
	private String taskId;
	private String title;
	private String memo;
	private Integer type;
	private Date startTime;
	private Date endTime;
	private Date createTime;
	private Long userId;
	private Integer status;
	private PondVO pond;
	private Long pondId;
}
