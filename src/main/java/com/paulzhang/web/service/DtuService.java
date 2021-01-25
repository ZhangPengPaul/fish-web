package com.paulzhang.web.service;

import com.paulzhang.web.domain.DtuVO;

import java.lang.reflect.InvocationTargetException;

public interface DtuService {

	int add(DtuVO dtuVO) throws InvocationTargetException, IllegalAccessException;

	DtuVO findByCode(String code);
}
