package com.paulzhang.web.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.domain.PondVO;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

public interface PondService {

	int add(PondVO pondVO) throws InvocationTargetException, IllegalAccessException;

	IPage<PondVO> findAllByPage(long current, long size);

	PondVO findById(Long pondId);

	List<PondVO> findAllByProjectId(Long projectId);
}
