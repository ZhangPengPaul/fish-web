package com.paulzhang.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.paulzhang.web.domain.TaskVO;
import com.paulzhang.web.entity.Task;
import com.paulzhang.web.mapper.TaskMapper;
import com.paulzhang.web.service.TaskService;
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
				task.setCreateTime(new Date());
				count = taskMapper.insert(task);
			} catch (IllegalAccessException | InvocationTargetException e) {
				log.error("task copy error", e);
			}
		}
		return count;
	}

	@Override
	public List<TaskVO> findByPonds(List<Long> pondIds) {
		QueryWrapper<Task> queryWrapper = new QueryWrapper<>();
		queryWrapper.in("POND_ID", pondIds);

		List<Task> tasks = taskMapper.selectList(queryWrapper);
		List<TaskVO> taskVOS = null;
		if (CollectionUtils.isNotEmpty(tasks)) {
			taskVOS = new ArrayList<>(tasks.size());
			for (Task task : tasks) {
				TaskVO taskVO = new TaskVO();
				try {
					BeanUtils.copyProperties(taskVO, task);
					taskVOS.add(taskVO);
				} catch (IllegalAccessException | InvocationTargetException e) {
					log.error("task copy error", e);
				}

			}

		}
		return taskVOS;
	}

}
