package com.paulzhang.web.service;

import com.paulzhang.web.domain.TaskVO;

import java.util.List;

public interface TaskService {

	int add(TaskVO taskVO);

	List<TaskVO> findByPonds(List<Long> pondIds);
}
