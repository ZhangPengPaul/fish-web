package com.paulzhang.web.common.config;

import com.paulzhang.web.entity.Permission;
import com.paulzhang.web.mapper.PermissionMapper;
import com.paulzhang.web.service.impl.UserAuthRealm;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.apache.shiro.mgt.SecurityManager;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Configuration
public class ShiroConfig {

	@Resource
	private UserAuthRealm userAuthRealm;

	@Resource
	private PermissionMapper permissionMapper;

	/**
	 * 配置 资源访问策略 . web应用程序 shiro核心过滤器配置
	 */
	@Bean
	public ShiroFilterFactoryBean factoryBean(SecurityManager securityManager) {
		ShiroFilterFactoryBean factoryBean = new ShiroFilterFactoryBean();
		factoryBean.setSecurityManager(securityManager);
		factoryBean.setLoginUrl("/auth/sign-in");//登录页
		factoryBean.setSuccessUrl("/index");//首页
		factoryBean.setUnauthorizedUrl("/unauthorized");//未授权界面;
		factoryBean.setFilterChainDefinitionMap(setFilterChainDefinitionMap()); //配置 拦截过滤器链
		return factoryBean;
	}

	/**
	 * 配置 SecurityManager,可配置一个或多个realm
	 */
	@Bean
	public SecurityManager securityManager() {
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		securityManager.setRealm(userAuthRealm);
		return securityManager;
	}

	/**
	 * 配置 拦截过滤器链.  map的键 : 资源地址 ;  map的值 : 所有默认Shiro过滤器实例名
	 * 默认Shiro过滤器实例 参考 : {@link org.apache.shiro.web.filter.mgt.DefaultFilter}
	 */
	private Map<String, String> setFilterChainDefinitionMap() {
		Map<String, String> filterMap = new LinkedHashMap<>();
		//注册 数据库中所有的权限 及其对应url
		List<Permission> allPermission = permissionMapper.selectList(null);//数据库中查询所有权限
		for (Permission p : allPermission) {
			filterMap.put(p.getUrl(), "perms[" + p.getName() + "]");    //拦截器中注册所有的权限
		}
		filterMap.put("/dist/**", "anon");    //公开访问的资源
		filterMap.put("/auth/sign-in", "anon");  //公开地址
		filterMap.put("/auth/login", "anon");
		filterMap.put("/logout", "logout");     //配置登出页,shiro已经帮我们实现了跳转
//		filterMap.put("/**", "user");          //所有资源都需要经过验证
		return filterMap;
	}
}
