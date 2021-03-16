package com.paulzhang.web.integration;

import com.paulzhang.web.integration.domain.YsTokenResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Service
public class YsCloudService {

	@Value("${ys.appKey}")
	private String appKey;

	@Value("${ys.secret}")
	private String secret;

	@Value("${ys.token.url}")
	private String tokenUrl;

	@Resource
	private RestTemplate restTemplate;

	public YsTokenResponse getToken() {
		ResponseEntity<YsTokenResponse> responseEntity = restTemplate.postForEntity(tokenUrl, null, YsTokenResponse.class, appKey, secret);

		YsTokenResponse ysTokenResponse = null;
		if (responseEntity.getStatusCode().is2xxSuccessful()) {
			ysTokenResponse = responseEntity.getBody();
		}

		return ysTokenResponse;
	}
}
