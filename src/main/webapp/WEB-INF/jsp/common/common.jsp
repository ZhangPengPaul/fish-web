<%@ page import="com.paulzhang.web.entity.User" %>
<%@ page import="org.apache.shiro.SecurityUtils" %><%
    String path = request.getContextPath();
    int port = request.getServerPort();
    String basePath = "";
    if (port == 80) {
        basePath = request.getScheme() + "://"
                + request.getServerName() + path + "/";
    } else {
        basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + port
                + path + "/";
    }

  User user = (User) SecurityUtils.getSubject().getPrincipal();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
