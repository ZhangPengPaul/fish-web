package com.paulzhang.web.service.impl;

import com.paulzhang.web.domain.TaskVO;
import com.paulzhang.web.entity.Task;
import com.paulzhang.web.mapper.TaskMapper;
import com.paulzhang.web.service.TaskService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.Objects;

@Slf4j
@Service
public class TaskServiceImpl implements TaskService {
	@Resource
	private TaskMapper taskMapper;

	@Override
	public int add(TaskVO taskVO) {
		int count = 0;
		if (Objects.nonNull(taskVO)) {
			Task task = new Task();
			try {
				BeanUtils.copyProperties(task, taskVO);
				count = taskMapper.insert(task);
			} catch (IllegalAccessException | InvocationTargetException e) {
				log.error("task copy error", e);
			}
		}
		return count;
	}
}
