package com.paulzhang.web.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.domain.ProjectVO;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

public interface ProjectService {

	IPage<ProjectVO> findAllByPage(long current, long size);

	int add(ProjectVO projectVO) throws InvocationTargetException, IllegalAccessException;

	List<ProjectVO> findAll();

	ProjectVO findById(Long projectId);
}
