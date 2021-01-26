package com.paulzhang.web.service;

import com.paulzhang.web.domain.DtuVO;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

public interface DtuService {

	int add(DtuVO dtuVO) throws InvocationTargetException, IllegalAccessException;

	DtuVO findByCode(String code);

	List<DtuVO> findByPondId(Long pondId);
}
