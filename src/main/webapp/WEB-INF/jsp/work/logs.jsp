<%@include file="../common/common.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <title>角色管理</title>
  <!-- CSS files -->
  <link href="<%=path%>/dist/libs/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/tabler.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/tabler-flags.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/tabler-payments.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/tabler-vendors.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/demo.min.css" rel="stylesheet"/>
</head>
<body class="antialiased theme-dark">
<div class="page">
  <div class="sticky-top">
    <%@include file="../common/header.jsp" %>
    <%@include file="../common/menu.jsp" %>
  </div>
  <div class="content">
    <div class="container-fluid">
      <!-- Page title -->
      <div class="page-header d-print-none">
        <div class="row align-items-center">
          <div class="col">
            <h2 class="page-title">
              工作日志
            </h2>
          </div>
          <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
              <%--              <div class="my-2 my-md-0 flex-grow-1 flex-md-grow-0 order-first order-md-last">--%>
              <%--                <form action="." method="get">--%>
              <%--                  <div class="input-icon">--%>
              <%--                                        <span class="input-icon-addon">--%>
              <%--                                          <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"--%>
              <%--                                               viewBox="0 0 24 24"--%>
              <%--                                               stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"--%>
              <%--                                               stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z"--%>
              <%--                                                                             fill="none"></path><circle--%>
              <%--                                            cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15"--%>
              <%--                                                                                 y2="15"></line></svg>--%>
              <%--                                        </span>--%>
              <%--                    <input type="text" class="form-control" placeholder="搜索日志…"--%>
              <%--                           aria-label="Search in website">--%>
              <%--                  </div>--%>
              <%--                </form>--%>
              <%--              </div>--%>
              <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal"
                 data-bs-target="#modal-pond">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                     viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                     stroke-linecap="round" stroke-linejoin="round">
                  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                  <line x1="12" y1="5" x2="12" y2="19"></line>
                  <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
                新增日志
              </a>
              <a href="#" class="btn btn-primary d-sm-none btn-icon" data-bs-toggle="modal"
                 data-bs-target="#modal-report" aria-label="Create new report">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                     viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                     stroke-linecap="round" stroke-linejoin="round">
                  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                  <line x1="12" y1="5" x2="12" y2="19"></line>
                  <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="row row-deck row-cards">
        <div class="col-3">
          <div class="card">
            <div class="card-body">
              <div class="card card-sm">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col">
                      <label class="form-label required">开始时间</label>
                      <input type="date" class="form-control mb-2"
                             placeholder="Select a date"/>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card card-sm">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col">
                      <label class="form-label required">结束时间</label>
                      <input type="date" class="form-control mb-2"
                             placeholder="Select a date"/>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card card-sm">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col">
                      <label class="form-label required">任务类型</label>
                      <select class="form-select form-control" name="task-type" id="task-type">
                        <option value="1">清塘</option>
                        <option value="2">消毒</option>
                        <option value="3">晒塘</option>
                        <option value="4">放水</option>
                        <option value="5">施肥</option>
                        <option value="6">种植水草</option>
                        <option value="7">肥水</option>
                        <option value="8">试苗</option>
                        <option value="9">巡塘</option>
                        <option value="10">放苗</option>
                        <option value="11">投喂</option>
                        <option value="12">抽检</option>
                        <option value="13">换水</option>
                        <option value="14">捕捞</option>
                        <option value="15">检验</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card card-sm">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col">
                      <label class="form-label required">池塘</label>
                      <select class="form-select form-control" name="task-type" id="">
                        <option value="1">一号塘</option>
                        <option value="2">消毒</option>
                        <option value="3">晒塘</option>
                        <option value="4">放水</option>
                        <option value="5">施肥</option>
                        <option value="6">种植水草</option>
                        <option value="7">肥水</option>
                        <option value="8">试苗</option>
                        <option value="9">巡塘</option>
                        <option value="10">放苗</option>
                        <option value="11">投喂</option>
                        <option value="12">抽检</option>
                        <option value="13">换水</option>
                        <option value="14">捕捞</option>
                        <option value="15">检验</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-footer">
              <a href="javascript:;" onclick="add()" class="btn btn-primary ms-auto">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
                     stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                     stroke-linejoin="round">
                  <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                  <line x1="12" y1="5" x2="12" y2="19"/>
                  <line x1="5" y1="12" x2="19" y2="12"/>
                </svg>
                搜索
              </a>
            </div>
          </div>
        </div>
        <div class="col-9">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">工作日志</h3>
            </div>
            <div class="table-responsive">
              <table class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                <tr>
                  <th>日期</th>
                  <th>天气</th>
                  <th>水温</th>
                  <th>日投饵量(kg)</th>
                  <th>吃食情况</th>
                  <th>是否浮头</th>
                  <th>开增氧机(h)</th>
                  <th>是否施药</th>
                  <th>换水量(cm)</th>
                  <th>施肥情况</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td><span class="text-muted">2020/3/4</span></td>
                  <td>阴</td>
                  <td>6</td>
                  <td>7</td>
                  <td>良</td>
                  <td>无</td>
                  <td>无</td>
                  <td>无</td>
                  <td>无</td>
                  <td>无</td>
                </tr>
                <tr>
                  <td><span class="text-muted">2020/3/5</span></td>
                  <td>小雨</td>
                  <td>7</td>
                  <td>7</td>
                  <td>良</td>
                  <td>无</td>
                  <td>无</td>
                  <td>无</td>
                  <td>无</td>
                  <td>无</td>
                </tr>
                <tr>
                  <td><span class="text-muted">2020/3/6</span></td>
                  <td>多云</td>
                  <td>9</td>
                  <td>7</td>
                  <td>良</td>
                  <td>无</td>
                  <td>无</td>
                  <td>无</td>
                  <td>无</td>
                  <td>无</td>
                </tr>
                <tr>
                  <td><span class="text-muted">2020/3/7</span></td>
                  <td>小雨</td>
                  <td>9</td>
                  <td>7</td>
                  <td>良</td>
                  <td>无</td>
                  <td>无</td>
                  <td>无</td>
                  <td>无</td>
                  <td>无</td>
                </tr>
                </tbody>
              </table>
            </div>
            <div class="card-footer d-flex align-items-center">
              <ul id="pageLimit" class="m-0 ms-auto"></ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@include file="../common/footer.jsp" %>
  </div>
</div>
<div class="modal modal-blur fade" id="modal-pond" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="alert alert-important alert-danger alert-dismissible visually-hidden" id="error-alert" role="alert">
    <div class="d-flex">
      <div>
        <!-- SVG icon code with class="alert-icon" -->
      </div>
      <div>
        Your account has been deleted and can't be restored.
      </div>
    </div>
    <a class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="close"></a>
  </div>
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">新角色</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
          <label class="form-label required">角色名</label>
          <input type="text" class="form-control" name="role-name" id="role-name" placeholder="角色的名称">
          <div class="invalid-feedback">角色名称不能为空</div>
        </div>
        <div class="mb-3">
          <label class="form-label required">角色简介</label>
          <input type="text" class="form-control" name="role-memo" id="role-memo" placeholder="角色简介">
          <div class="invalid-feedback">角色描述不能为空</div>
        </div>
      </div>
      <div class="modal-footer">
        <a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">
          取消
        </a>
        <a href="javascript:;" onclick="add()" class="btn btn-primary ms-auto">
          <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
               stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
               stroke-linejoin="round">
            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
            <line x1="12" y1="5" x2="12" y2="19"/>
            <line x1="5" y1="12" x2="19" y2="12"/>
          </svg>
          创建角色
        </a>
      </div>
    </div>
  </div>
</div>
<!-- Libs JS -->
<script src="<%=path%>/dist/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=path%>/dist/libs/jquery/dist/jquery.slim.min.js"></script>
<script src="<%=path%>/dist/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="https://webapi.amap.com/loader.js"></script>
<!-- Tabler Core -->
<script src="<%=path%>/dist/js/tabler.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/fetch/3.5.0/fetch.min.js"></script>
<script src="<%=path%>/dist/libs/page/bootstrap-paginator.min.js"></script>
<script>
  $("document").ready(function () {
    $("#page-index").removeClass("active");
    $("#page-user-manager").addClass("active");
    $("#dropdown-role").addClass("active");

    $('#pageLimit').bootstrapPaginator({
      pageUrl: "/test",
      currentPage: 1,//当前的请求页面。
      totalPages: 20,//一共多少页。
      size: "normal",//应该是页眉的大小。
      bootstrapMajorVersion: 3,//bootstrap的版本要求。
      alignment: "right",
      numberOfPages: 5,//一页列出多少数据。
      itemTexts: function (type, page, current) {//如下的代码是将页眉显示的中文显示我们自定义的中文。
        switch (type) {
          case "first":
            return "首页";
          case "prev":
            return "上一页";
          case "next":
            return "下一页";
          case "last":
            return "末页";
          case "page":
            return page;
        }
      }
    });
  });
</script>
<script type="text/javascript">
  function add() {
    $("#role-name").removeClass("is-invalid");
    $("#role-memo").removeClass("is-invalid");

    var url = "<%=path%>/role/add";
    var data = {
      "name": "",
      "memo": ""
    };

    var name = $("#role-name").val();
    var memo = $("#role-memo").val();

    if (name.trim() === "") {
      $("#role-name").addClass("is-invalid");
      return;
    }

    if (memo.trim() === "") {
      $("#role-memo").addClass("is-invalid");
      return;
    }

    data.name = name;
    data.memo = memo;

    fetch(url, {
      method: "POST",
      body: JSON.stringify(data),
      headers: new Headers({
        "Content-Type": "application/json"
      })
    }).then(res => res.json())
      .catch(error => console.error("Error:", error))
      .then(response => {
        console.log("Success:", response);
        if (response.code !== 200) {
          $("#error-alert").removeClass("visually-hidden");
        } else {
          window.location.href = "<%=path%>/role/list";
        }

      });
  }
</script>
</body>
</html>
