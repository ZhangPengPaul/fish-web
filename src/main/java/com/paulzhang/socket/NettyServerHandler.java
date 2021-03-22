package com.paulzhang.socket;

import com.paulzhang.util.SpringUtil;
import com.paulzhang.web.common.constants.DtuType;
import com.paulzhang.web.domain.DtuVO;
import com.paulzhang.web.entity.TsData;
import com.paulzhang.web.service.DtuService;
import com.paulzhang.web.service.TsDataService;
import com.paulzhang.web.service.impl.DtuServiceImpl;
import com.paulzhang.web.service.impl.TsDataServiceImpl;
import io.netty.buffer.Unpooled;
import io.netty.channel.Channel;
import io.netty.channel.ChannelFutureListener;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.collections.CollectionUtils;
import org.apache.logging.log4j.util.Strings;

import java.nio.IntBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.TimeUnit;

@Slf4j
public class NettyServerHandler extends ChannelInboundHandlerAdapter {

	private static TsDataService tsDataService;
	private static DtuService dtuService;

	static {
		tsDataService = SpringUtil.getBean(TsDataServiceImpl.class);
		dtuService = SpringUtil.getBean(DtuServiceImpl.class);
	}

	private final ThreadLocal<String> threadLocal = new ThreadLocal<>();

	/**
	 * 客户端连接会触发
	 */
	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		log.info("Channel active......");
	}

	/**
	 * 客户端发消息会触发
	 */
	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		log.info("==============================receive msg======================================");
		String dtuCode = threadLocal.get();
		log.info("thread local dtu code:{}", dtuCode);
		byte[] bytes = (byte[]) msg;
		log.info("msg length: {}", bytes.length);
		if (Strings.isBlank(dtuCode)) {
			if (bytes.length == 6) {
				dtuCode = new String(bytes, StandardCharsets.UTF_8);
				threadLocal.set(dtuCode);
			}
		}
		log.info("receive dtu code:{}", dtuCode);
		List<DtuVO> dtuVOS = dtuService.findAll();
		List<String> dtuList;
		if (CollectionUtils.isNotEmpty(dtuVOS)) {
			dtuList = new ArrayList<>(dtuVOS.size());
			for (DtuVO dtuVO : dtuVOS) {
				dtuList.add(dtuVO.getCode());
			}
			String strMsg = new String(bytes, StandardCharsets.UTF_8);

			DtuVO dtuVO = dtuService.findByCode(dtuCode);
			if (Objects.isNull(dtuVO)) {
				return;
			}

			Integer dtuType = dtuVO.getDtuType();
			byte[] commond = getCommandByDtuType(dtuType);
			if (Objects.isNull(commond)) {
				return;
			}

			if (dtuList.contains(strMsg)) {
				log.info("receive message is dtu code, send command to client one time");

				ctx.channel().writeAndFlush(Unpooled.wrappedBuffer(commond))
					.addListener(ChannelFutureListener.FIRE_EXCEPTION_ON_FAILURE)
					.addListener((ChannelFutureListener) channelFuture -> log.info(
						"SomCommunicationHandler "
							+ this.getClass().getName()
							+ "成功发送指令:"
							+ Hex.encodeHexString(commond)));
				return;
			}

			DtuType dtuTypeEnum = DtuType.getTypeByValue(dtuType);
			if (Objects.isNull(dtuTypeEnum)) {
				return;
			}

			String hexString = "";
			byte[] ai1Bytes = null;
			String hexAi1 = "";
			long ai1l = 0L;
			float oxygen = 0F;
			byte[] ai2Bytes = null;
			String hexAi2 = "";
			long ai2l = 0L;
			float ph = 0F;
			byte[] ai3Bytes = null;
			String hexAi3 = "";
			long ai3l = 0L;
			float temp = 0F;
			switch (dtuTypeEnum) {
				case CONTROL:
					// 控制设备
					break;
				case SENSOR_3:
					log.info("sensor type: {}", dtuTypeEnum.getMessage());
					// 三项传感器
					hexString = Hex.encodeHexString(bytes);
					log.info("hex string: {}", hexString);

					ai1Bytes = Arrays.copyOfRange(bytes, 5, 9);
					hexAi1 = Hex.encodeHexString(ai1Bytes);
					ai1l = NettyServerHandler.parseLong(hexAi1, 16);
					oxygen = Float.intBitsToFloat((int) ai1l);
					log.info("溶氧：{}", oxygen);

					ai2Bytes = Arrays.copyOfRange(bytes, 13, 17);
					hexAi2 = Hex.encodeHexString(ai2Bytes);
					ai2l = NettyServerHandler.parseLong(hexAi2, 16);
					ph = Float.intBitsToFloat((int) ai2l);
					log.info("PH：{}", ph);

					ai3Bytes = Arrays.copyOfRange(bytes, 21, 25);
					hexAi3 = Hex.encodeHexString(ai3Bytes);
					ai3l = NettyServerHandler.parseLong(hexAi3, 16);
					temp = Float.intBitsToFloat((int) ai3l);
					log.info("温度：{}", temp);

					TsDataService tsDataService = (TsDataService) SpringUtil.getBean("tsDataService");
					TsData tsData = TsData.builder()
						.temp(temp)
						.oxygen(oxygen)
						.ph(ph)
						.pondId(dtuVO.getPondId())
						.timestamp(new Date())
						.build();

					tsDataService.add(tsData);
					break;
				case SENSOR_2:
					// 两项传感器
					log.info("sensor type: {}", dtuTypeEnum.getMessage());
					hexString = Hex.encodeHexString(bytes);
					log.info("hex string: {}", hexString);

					ai1Bytes = Arrays.copyOfRange(bytes, 5, 9);
					hexAi1 = Hex.encodeHexString(ai1Bytes);
					ai1l = NettyServerHandler.parseLong(hexAi1, 16);
					oxygen = Float.intBitsToFloat((int) ai1l);
					log.info("溶氧：{}", oxygen);

					ai2Bytes = Arrays.copyOfRange(bytes, 13, 17);
					hexAi2 = Hex.encodeHexString(ai2Bytes);
					ai2l = NettyServerHandler.parseLong(hexAi2, 16);
					ph = Float.intBitsToFloat((int) ai2l);
					log.info("PH：{}", ph);

					ai3Bytes = Arrays.copyOfRange(bytes, 21, 25);
					hexAi3 = Hex.encodeHexString(ai3Bytes);
					ai3l = NettyServerHandler.parseLong(hexAi3, 16);
					temp = Float.intBitsToFloat((int) ai3l);
					log.info("温度：{}", temp);
					break;
			}


			Channel channel = ctx.channel();
			channel.eventLoop().scheduleAtFixedRate(
				new Runnable() {
					@Override
					public void run() {
						channel.writeAndFlush(Unpooled.wrappedBuffer(commond))
							.addListener(ChannelFutureListener.FIRE_EXCEPTION_ON_FAILURE)
							.addListener((ChannelFutureListener) channelFuture -> log.info(
								"SomCommunicationHandler "
									+ this.getClass().getName()
									+ "成功发送指令:"
									+ Hex.encodeHexString(commond)));
					}
				}, 0, 10, TimeUnit.MINUTES);
		}

		log.info("=============================end=======================================");
	}

	public static long parseLong(String s, int radix) throws NumberFormatException {
		if (s == null) {
			throw new NumberFormatException("null");
		}

		if (radix < Character.MIN_RADIX) {
			throw new NumberFormatException("radix " + radix + " less than Character.MIN_RADIX");
		}
		if (radix > Character.MAX_RADIX) {
			throw new NumberFormatException("radix " + radix + " greater than Character.MAX_RADIX");
		}

		long result = 0;
		boolean negative = false;
		int i = 0, len = s.length();
		long limit = -Long.MAX_VALUE;
		long multmin;
		int digit;

		if (len > 0) {
			char firstChar = s.charAt(0);
			if (firstChar < '0') { // Possible leading "+" or "-"
				if (firstChar == '-') {
					negative = true;
					limit = Long.MIN_VALUE;
				} else if (firstChar != '+')
					throw NumberFormatException.forInputString(s);

				if (len == 1) // Cannot have lone "+" or "-"
					throw NumberFormatException.forInputString(s);
				i++;
			}
			multmin = limit / radix;
			while (i < len) {
				// Accumulating negatively avoids surprises near MAX_VALUE
				digit = Character.digit(s.charAt(i++), radix);
				if (digit < 0) {
					throw NumberFormatException.forInputString(s);
				}
				if (result < multmin) {
					throw NumberFormatException.forInputString(s);
				}
				result *= radix;
				if (result < limit + digit) {
					throw NumberFormatException.forInputString(s);
				}
				result -= digit;
			}
		} else {
			throw NumberFormatException.forInputString(s);
		}
		return negative ? result : -result;
	}


	/**
	 * 发生异常触发
	 */
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		log.error("netty channel error", cause);
		ctx.close();
	}

	@Override
	public void channelRegistered(ChannelHandlerContext ctx) throws Exception {
		log.info("================channelRegistered===================");
		super.channelRegistered(ctx);
	}

	@Override
	public void channelInactive(ChannelHandlerContext ctx) throws Exception {
		log.info("===============channelInactive=====================");
		super.channelInactive(ctx);
	}

	private byte[] getCommandByDtuType(Integer dtuType) {
		DtuType dtuTypeEnum = DtuType.getTypeByValue(dtuType);
		byte[] commond = null;
		if (Objects.isNull(dtuTypeEnum)) {
			return null;
		}
		switch (dtuTypeEnum) {
			case CONTROL:
				break;
			case SENSOR_2:
				commond = new byte[]{0x01, 0x03, 0x00, 0x00, 0x00, 0x0A, (byte) 0xc5, (byte) 0xcd};
				break;
			case SENSOR_3:
				commond = new byte[]{0x03, 0x03, 0x00, 0x00, 0x00, 0x0A, (byte) 0xc4, (byte) 0x2F};
				break;
		}

		return commond;
	}
}
