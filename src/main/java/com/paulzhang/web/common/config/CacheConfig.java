package com.paulzhang.web.common.config;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CacheConfig {

	@Bean
	public Cache<String, Object> caffeineCache() {
		return Caffeine.newBuilder()
			.initialCapacity(100)
			.maximumSize(1000)
			.build();

	}
}
