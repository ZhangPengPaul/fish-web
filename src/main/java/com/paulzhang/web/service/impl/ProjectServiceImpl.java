package com.paulzhang.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.paulzhang.web.domain.ProjectVO;
import com.paulzhang.web.domain.UserVO;
import com.paulzhang.web.entity.Project;
import com.paulzhang.web.entity.User;
import com.paulzhang.web.mapper.ProjectMapper;
import com.paulzhang.web.service.ProjectService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class ProjectServiceImpl implements ProjectService {

	@Resource
	private ProjectMapper projectMapper;

	@Override
	public IPage<ProjectVO> findAllByPage(long current, long size) {
		QueryWrapper<Project> queryWrapper = new QueryWrapper<>();
		queryWrapper.orderByDesc("CREATE_TIME");
		IPage<Project> page = new Page<>();
		page.setCurrent(current);
		page.setSize(size);

		IPage<Project> projectPage = projectMapper.selectPage(page, queryWrapper);
		IPage<ProjectVO> projectVOS = null;
		List<ProjectVO> projectVOList;
		if (projectPage.getTotal() > 0) {
			projectVOS = new Page<>();
			List<Project> projectList = projectPage.getRecords();
			projectVOList = new ArrayList<>(projectList.size());
			List<ProjectVO> finalProjectVOList = projectVOList;
			projectList.forEach(project -> {
				ProjectVO projectVO = new ProjectVO();
				try {
					BeanUtils.copyProperties(projectVO, project);
					finalProjectVOList.add(projectVO);
				} catch (IllegalAccessException | InvocationTargetException e) {
					log.error("project copy error", e);
				}
			});
			projectVOS.setSize(projectPage.getSize());
			projectVOS.setCurrent(projectPage.getCurrent());
			projectVOS.setPages(projectPage.getPages());
			projectVOS.setRecords(finalProjectVOList);
			projectVOS.setTotal(projectPage.getTotal());
		}
		return projectVOS;
	}
}
