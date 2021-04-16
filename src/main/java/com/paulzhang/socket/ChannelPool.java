package com.paulzhang.socket;

import com.github.benmanes.caffeine.cache.Cache;
import com.paulzhang.util.SpringUtil;
import com.paulzhang.web.common.constants.CommonConstants;
import io.netty.channel.Channel;
import io.netty.channel.ChannelId;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.util.concurrent.GlobalEventExecutor;
import lombok.extern.slf4j.Slf4j;

import java.util.Objects;

@Slf4j
public class ChannelPool {

	private static Cache<String, Object> caffeineCache;

	static {
		caffeineCache = SpringUtil.getBean(Cache.class);
	}

	private ChannelPool() {

	}

	static ChannelGroup channels = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);

	static void addChannel(Channel channel) {
		channels.add(channel);
		// cache channel id
		caffeineCache.put(CommonConstants.CacheChannelKeys.CHANNEL_ID + channel.id().asShortText(), channel.id());
	}

	static void removeChannel(Channel channel) {
		channels.remove(channel);
		caffeineCache.asMap().remove(CommonConstants.CacheChannelKeys.CHANNEL_ID + channel.id().asShortText());
	}

	static Channel getChannel(String id) {
		ChannelId channelId = (ChannelId) caffeineCache.getIfPresent(CommonConstants.CacheChannelKeys.CHANNEL_ID + id);
		if (Objects.isNull(channelId)) {
			log.error("netty channel [{}] illegality.", id);
			return null;
		}
		return channels.find(channelId);
	}
}
