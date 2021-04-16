package com.paulzhang.web.service;

import com.paulzhang.web.domain.DeviceVO;
import org.apache.commons.codec.DecoderException;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

public interface DeviceService {

	int add(DeviceVO deviceVO) throws InvocationTargetException, IllegalAccessException;

	List<DeviceVO> findByPondAndType(Long pondId, Integer type);

	int deleteByPondId(Long deviceId, Long pondId);

	List<DeviceVO> findByDtuId(Long dtuId);

	DeviceVO findById(Long deviceId);

	void control(String action, Long deviceId) throws DecoderException;
}
