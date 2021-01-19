<%
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
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
