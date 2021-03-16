package com.paulzhang.web.task;

import com.paulzhang.web.domain.YsTokenVO;
import com.paulzhang.web.integration.YsCloudService;
import com.paulzhang.web.integration.domain.YsTokenData;
import com.paulzhang.web.integration.domain.YsTokenResponse;
import com.paulzhang.web.service.YsTokenService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Objects;

@Slf4j
@Component
public class ScheduleTask {

	@Resource
	private YsCloudService ysCloudService;

	@Resource
	private YsTokenService ysTokenService;

	@Scheduled(fixedDelay = 1000 * 60 * 60 * 24 * 6)
	public void refreshYsToken() {
		log.info("start ys refresh token schedule");
		YsTokenResponse ysTokenResponse = ysCloudService.getToken();
		log.info("ys token response: {}", ysTokenResponse);
		if (Objects.nonNull(ysTokenResponse) && "200".equals(ysTokenResponse.getCode())) {
			YsTokenData ysTokenData = ysTokenResponse.getData();
			YsTokenVO tokenVO = ysTokenService.findToken();
			if (Objects.nonNull(tokenVO)) {
				tokenVO.setAccessToken(ysTokenData.getAccessToken());
				tokenVO.setExpireTime(ysTokenData.getExpireTime());
				ysTokenService.update(tokenVO);
			} else {
				tokenVO = new YsTokenVO();
				tokenVO.setAccessToken(ysTokenData.getAccessToken());
				tokenVO.setExpireTime(ysTokenData.getExpireTime());
				ysTokenService.add(tokenVO);
			}
		}
	}
}
