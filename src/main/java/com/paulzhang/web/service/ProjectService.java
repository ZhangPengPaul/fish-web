package com.paulzhang.web.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.paulzhang.web.domain.ProjectVO;

public interface ProjectService {

	IPage<ProjectVO> findAllByPage(long current, long size);
}
