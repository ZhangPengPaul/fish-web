package com.paulzhang.web.service;

import com.paulzhang.web.domain.PondVO;

import java.lang.reflect.InvocationTargetException;

public interface PondService {

	int add(PondVO pondVO) throws InvocationTargetException, IllegalAccessException;
}
