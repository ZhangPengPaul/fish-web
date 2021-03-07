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
    <div class="alert alert-important alert-danger alert-dismissible visually-hidden" id="error-alert" role="alert">
      <div class="d-flex">
        <div>
          <!-- SVG icon code with class="alert-icon" -->
        </div>
        <div id="alert-text">
        </div>
      </div>
      <a class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="close"></a>
    </div>
    <div class="card-body">
      <h2 class="card-title text-center mb-4">登录</h2>
      <div class="mb-3">
        <label class="form-label required">账号</label>
        <input type="text" name="username" id="username" class="form-control" placeholder="输入账号">
        <div class="invalid-feedback">账号不能为空</div>
      </div>
      <div class="mb-2">
        <label class="form-label required">
          密码
          <span class="form-label-description">
            </span>
        </label>
        <div class="input-group input-group-flat">
          <input type="password" name="password" id="password" class="form-control" placeholder="密码" autocomplete="off">
          <div class="invalid-feedback">密码不能为空</div>
        </div>
      </div>
      <div class="form-footer">
        <button onclick="login()" type="button" id="login-btn" class="btn btn-primary w-100">登录</button>
      </div>
    </div>
  </div>
</div>
<!-- Libs JS -->
<script src="<%=path%>/dist/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=path%>/dist/libs/jquery/dist/jquery.slim.min.js"></script>
<!-- Tabler Core -->
<script src="<%=path%>/dist/js/tabler.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/fetch/3.5.0/fetch.min.js"></script>
<script type="text/javascript">
  function login() {
    var username = $("#username").val();
    var password = $("#password").val();
    if (username === '') {
      $("#username").addClass("is-invalid");
      return;
    }

    if (password === '') {
      $("#password").addClass("is-invalid");
      return;
    }
    var url = "<%=path%>/auth/login?username=" + username + "&password=" + password;
    fetch(url, {
      method: "POST"
    }).then(res => res.json())
      .catch(error => console.error("Error:", error))
      .then(response => {
        console.log("response:", response);
        if (response.code !== 200) {
          $("#alert-text").text(response.message);
          $("#error-alert").removeClass("visually-hidden");
        } else {
          var browser = {
            versions: function () {
              var u = navigator.userAgent, app = navigator.appVersion;
              return {
                trident: u.indexOf('Trident') > -1, //IE内核
                presto: u.indexOf('Presto') > -1, //opera内核
                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,//火狐内核
                mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                android: u.indexOf('Android') > -1 || u.indexOf('Adr') > -1, //android终端
                iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
                iPad: u.indexOf('iPad') > -1, //是否iPad
                webApp: u.indexOf('Safari') == -1, //是否web应该程序，没有头部与底部
                weixin: u.indexOf('MicroMessenger') > -1, //是否微信 （2015-01-22新增）
                qq: u.match(/\sQQ/i) == " qq" //是否QQ
              };
            }(),
            language: (navigator.browserLanguage || navigator.language).toLowerCase()
          }

          console.log(browser.versions.mobile);
          if (browser.versions.mobile) {
            window.location.href = "<%=path%>/mobile/pond/list";
          } else {
            window.location.href = "<%=path%>/";
          }

        }
      })
  }
</script>
</body>
</html>
