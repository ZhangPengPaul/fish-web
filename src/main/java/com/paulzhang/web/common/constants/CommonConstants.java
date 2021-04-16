package com.paulzhang.web.common.constants;

public final class CommonConstants {

	public static final Long DEFAULT_PAGE_SIZE = 20L;

	public static final Long DEFAULT_PAGE_CURRENT = 0L;

	public interface CacheChannelKeys {
		String CHANNEL = "netty:channel:";
		String CHANNEL_ID = "netty:channelId:";
	}
}
