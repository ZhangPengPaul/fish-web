package com.paulzhang.web.domain;

import com.paulzhang.web.entity.Project;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserVO {

	private Long userId;
	private String username;
	private String password;
	private Date createTime;
	private Long projectId;
	private ProjectVO projectVO;
}
