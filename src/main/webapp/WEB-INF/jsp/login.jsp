<%@include file="common/common.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Sign in - Tabler - Premium and Open Source dashboard template with responsive and high quality UI.</title>
    <!-- CSS files -->
    <link href="<%=path%>/dist/css/tabler.min.css" rel="stylesheet"/>
    <link href="<%=path%>/dist/css/tabler-flags.min.css" rel="stylesheet"/>
    <link href="<%=path%>/dist/css/tabler-payments.min.css" rel="stylesheet"/>
    <link href="<%=path%>/dist/css/tabler-vendors.min.css" rel="stylesheet"/>
    <link href="<%=path%>/dist/css/demo.min.css" rel="stylesheet"/>
</head>
<body class="antialiased border-top-wide border-primary d-flex flex-column">
<div class="flex-fill d-flex flex-column justify-content-center py-4">
    <div class="container-tight py-6">
        <div class="text-center mb-4">
            <a href="."><img src="<%=path%>/dist/static/logo.svg" height="36" alt=""></a>
        </div>
        <form class="card card-md" action="<%=path%>/auth/login" method="post" autocomplete="off">
            <div class="card-body">
                <h2 class="card-title text-center mb-4">登录</h2>
                <div class="mb-3">
                    <label class="form-label">账号</label>
                    <input type="email" class="form-control" placeholder="Enter email">
                </div>
                <div class="mb-2">
                    <label class="form-label">
                        密码
                        <span class="form-label-description">
                            <%--                  <a href="<%=path%>/forgot-password.html">I forgot password</a>--%>
                        </span>
                    </label>
                    <div class="input-group input-group-flat">
                        <input type="password" class="form-control" placeholder="Password" autocomplete="off">
                        <span class="input-group-text">
                </span>
                    </div>
                </div>
                <%--                <div class="mb-2">--%>
                <%--                    <label class="form-check">--%>
                <%--                        <input type="checkbox" class="form-check-input"/>--%>
                <%--                        <span class="form-check-label">Remember me on this device</span>--%>
                <%--                    </label>--%>
                <%--                </div>--%>
                <div class="form-footer">
                    <button type="submit" class="btn btn-primary w-100">登录</button>
                </div>
            </div>
        </form>
        <%--        <div class="text-center text-muted mt-3">--%>
        <%--            Don't have account yet? <a href="<%=path%>/sign-up.html" tabindex="-1">Sign up</a>--%>
        <%--        </div>--%>
    </div>
</div>
<!-- Libs JS -->
<script src="<%=path%>/dist/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- Tabler Core -->
<script src="<%=path%>/dist/js/tabler.min.js"></script>
</body>
</html>