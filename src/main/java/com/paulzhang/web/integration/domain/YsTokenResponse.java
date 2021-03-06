package com.paulzhang.web.integration.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class YsTokenResponse {

	private String code;
	private String msg;
	private YsTokenData data;
}
