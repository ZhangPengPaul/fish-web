package com.paulzhang.web;

import com.paulzhang.socket.NettyServer;
import com.paulzhang.util.SpringUtil;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.net.InetSocketAddress;

@SpringBootApplication
@MapperScan("com.paulzhang.web.mapper")
public class WebApplication {


	private static String nettyIp;
	private static int nettyPort;

	@Value("${netty.host}")
	public void setNettyIp(String nettyIp) {
		WebApplication.nettyIp = nettyIp;
	}

	@Value("${netty.port}")
	public void setNettyPort(int nettyPort) {
		WebApplication.nettyPort = nettyPort;
	}

	public static void main(String[] args) {
		SpringApplication.run(WebApplication.class, args);

		//启动服务端
		NettyServer nettyServer = new NettyServer();
		nettyServer.start(new InetSocketAddress(nettyIp, nettyPort));
	}

	@Bean
	public SpringUtil getSpringUtil() {
		return new SpringUtil();
	}

}
