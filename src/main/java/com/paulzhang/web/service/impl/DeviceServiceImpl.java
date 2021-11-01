package com.paulzhang.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.benmanes.caffeine.cache.Cache;
import com.paulzhang.socket.NettyServerHandler;
import com.paulzhang.util.ByteUtils;
import com.paulzhang.web.common.constants.CommonConstants;
import com.paulzhang.web.common.constants.DeviceControlType;
import com.paulzhang.web.domain.DeviceVO;
import com.paulzhang.web.domain.DtuVO;
import com.paulzhang.web.entity.Device;
import com.paulzhang.web.mapper.DeviceMapper;
import com.paulzhang.web.service.DeviceService;
import com.paulzhang.web.service.DtuService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

@Slf4j
@Service
public class DeviceServiceImpl implements DeviceService {

	@Resource
	private DeviceMapper deviceMapper;

	@Resource
	private Cache<String, Object> caffeineCache;

	@Resource
	private DtuService dtuService;

	@Override

	public int add(DeviceVO deviceVO) throws InvocationTargetException, IllegalAccessException {
		int count = 0;
		if (Objects.nonNull(deviceVO)) {
			Device dtu = new Device();
			BeanUtils.copyProperties(dtu, deviceVO);
			dtu.setCreateTime(new Date());
			count = deviceMapper.insert(dtu);
		}

		return count;
	}

	@Override
	public List<DeviceVO> findByPondAndType(Long pondId, Integer type) {
		QueryWrapper<Device> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("POND_ID", pondId).eq("TYPE", type);
		List<Device> devices = deviceMapper.selectList(queryWrapper);
		List<DeviceVO> deviceVOS = null;
		DeviceVO deviceVO;
		if (CollectionUtils.isNotEmpty(devices)) {
			deviceVOS = new ArrayList<>(devices.size());
			for (Device device : devices) {
				deviceVO = new DeviceVO();
				try {
					BeanUtils.copyProperties(deviceVO, device);
					deviceVOS.add(deviceVO);
				} catch (IllegalAccessException | InvocationTargetException e) {
					e.printStackTrace();
				}
			}

		}
		return deviceVOS;
	}

	@Override
	public int deleteByPondId(Long deviceId, Long pondId) {
		QueryWrapper<Device> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("DEVICE_ID", deviceId).eq("POND_ID", pondId);
		return deviceMapper.delete(queryWrapper);
	}

	@Override
	public List<DeviceVO> findByDtuId(Long dtuId) {
		QueryWrapper<Device> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("DTU_ID", dtuId);
		List<Device> devices = deviceMapper.selectList(queryWrapper);
		List<DeviceVO> deviceVOS = null;
		DeviceVO deviceVO;
		if (CollectionUtils.isNotEmpty(devices)) {
			deviceVOS = new ArrayList<>(devices.size());
			for (Device device : devices) {
				deviceVO = new DeviceVO();
				try {
					BeanUtils.copyProperties(deviceVO, device);
					deviceVOS.add(deviceVO);
				} catch (IllegalAccessException | InvocationTargetException e) {
					e.printStackTrace();
				}
			}

		}
		return deviceVOS;
	}

	@Override
	public DeviceVO findById(Long deviceId) {
		Device device = deviceMapper.selectById(deviceId);
		DeviceVO deviceVO = null;
		if (Objects.nonNull(device)) {
			deviceVO = new DeviceVO();
			try {
				BeanUtils.copyProperties(deviceVO, device);
			} catch (IllegalAccessException | InvocationTargetException e) {
				log.error("device copy error", e);
			}
		}
		return deviceVO;
	}

	@Override
	@Async
	public void control(String action, Long deviceId) throws DecoderException {
		if (StringUtils.isBlank(action)) {
			return;
		}

		DeviceControlType deviceControlType = DeviceControlType.valueOf(action);
		DeviceVO deviceVO = findById(deviceId);
		byte[] command = new byte[8];

		String dtuChannel = deviceVO.getDtuChannel();
		byte[] first = Hex.decodeHex(dtuChannel.toCharArray());
		command[0] = first[0];

		switch (deviceControlType) {
			case ON:
				command[1] = 0x05;
				command[2] = 0x00;
				command[3] = 0x01;
				command[4] = (byte) 0xFF;
				command[5] = 0x00;
				command[6] = (byte) 0xC5;
				command[7] = 0x5A;
				break;
			case OFF:
				command[1] = 0x05;
				command[2] = 0x00;
				command[3] = 0x01;
				command[4] = (byte) 0x00;
				command[5] = 0x00;
				command[6] = (byte) 0x84;
				command[7] = (byte) 0xAA;
				break;
			default:
				break;
		}

//		String crcString = ByteUtils.getCRC3(command);
//		byte[] crcByte = Hex.decodeHex(crcString.toCharArray());
//		byte[] crcHeight = Arrays.copyOfRange(crcByte, 0, 1);
//		byte[] crcLow = Arrays.copyOfRange(crcByte, 1, 2);
//		command[6] = crcHeight[0];
//		command[7] = crcLow[0];

		DtuVO dtuVO = dtuService.findById(deviceVO.getDtuId());
		String channelId = (String) caffeineCache.getIfPresent(CommonConstants.CacheChannelKeys.CHANNEL + dtuVO.getCode());
		NettyServerHandler.sendMessage(command, channelId);
	}
}
