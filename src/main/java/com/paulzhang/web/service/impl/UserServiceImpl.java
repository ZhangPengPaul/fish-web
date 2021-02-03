package com.paulzhang.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.paulzhang.web.domain.PondVO;
import com.paulzhang.web.domain.UserVO;
import com.paulzhang.web.entity.Pond;
import com.paulzhang.web.entity.User;
import com.paulzhang.web.mapper.UserMapper;
import com.paulzhang.web.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;

	@Override
	public IPage<UserVO> findAllByPage(long current, long size) {
		QueryWrapper<User> queryWrapper = new QueryWrapper<>();
		queryWrapper.orderByDesc("CREATE_TIME");
		IPage<User> page = new Page<>();
		page.setCurrent(current);
		page.setSize(size);

		IPage<User> userPage = userMapper.selectPage(page, queryWrapper);
		IPage<UserVO> userVOS = null;
		List<UserVO> userVOList;
		if (userPage.getTotal() > 0) {
			userVOS = new Page<>();
			List<User> userList = userPage.getRecords();
			userVOList = new ArrayList<>(userList.size());
			List<UserVO> finalUserVOList = userVOList;
			userList.forEach(user -> {
				UserVO userVO = new UserVO();
				try {
					BeanUtils.copyProperties(userVO, user);
					finalUserVOList.add(userVO);
				} catch (IllegalAccessException | InvocationTargetException e) {
					log.error("user copy error", e);
				}
			});
			userVOS.setSize(userPage.getSize());
			userVOS.setCurrent(userPage.getCurrent());
			userVOS.setPages(userPage.getPages());
			userVOS.setRecords(finalUserVOList);
			userVOS.setTotal(userPage.getTotal());
		}
		return userVOS;
	}
}
