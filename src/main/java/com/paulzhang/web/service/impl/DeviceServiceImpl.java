package com.paulzhang.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.paulzhang.web.domain.DeviceVO;
import com.paulzhang.web.entity.Device;
import com.paulzhang.web.mapper.DeviceMapper;
import com.paulzhang.web.service.DeviceService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
public class DeviceServiceImpl implements DeviceService {

	@Resource
	private DeviceMapper deviceMapper;

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
}
