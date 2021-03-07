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
public class TsDataVO {

	private Long dataId;
	private float temp;
	private float oxygen;
	private float ph;
	private Long pondId;
	private Date timestamp;
}
