package com.paulzhang.web.service;

import com.paulzhang.web.domain.DeviceVO;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

public interface DeviceService {

	int add(DeviceVO deviceVO) throws InvocationTargetException, IllegalAccessException;

	List<DeviceVO> findByPondAndType(Long pondId, Integer type);

	int deleteByPondId(Long deviceId, Long pondId);
}
