package com.paulzhang.web.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class YsTokenVO {

	private Integer tokenId;
	private String accessToken;
	private Long expireTime;
}
