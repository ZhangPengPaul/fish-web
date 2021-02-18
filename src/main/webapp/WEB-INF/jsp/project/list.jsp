<%@include file="../common/common.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <title>项目管理</title>
  <!-- CSS files -->
  <link href="<%=path%>/dist/libs/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/tabler.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/tabler-flags.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/tabler-payments.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/tabler-vendors.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/demo.min.css" rel="stylesheet"/>
</head>
<body class="antialiased">
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
              项目列表
            </h2>
          </div>
          <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
              <div class="my-2 my-md-0 flex-grow-1 flex-md-grow-0 order-first order-md-last">
                <form action="." method="get">
                  <div class="input-icon">
                                        <span class="input-icon-addon">
                                          <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                                               viewBox="0 0 24 24"
                                               stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                                               stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z"
                                                                             fill="none"></path><circle
                                            cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15"
                                                                                 y2="15"></line></svg>
                                        </span>
                    <input type="text" class="form-control" placeholder="搜索项目…"
                           aria-label="Search in website">
                  </div>
                </form>
              </div>
              <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal"
                 data-bs-target="#modal-pond">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                     viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                     stroke-linecap="round" stroke-linejoin="round">
                  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                  <line x1="12" y1="5" x2="12" y2="19"></line>
                  <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
                新增项目
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
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">项目列表</h3>
            </div>
            <div class="table-responsive">
              <table class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                <tr>
                  <th>项目编号</th>
                  <th>项目名称</th>
                  <th>项目地址</th>
                  <th>项目简介</th>
                  <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${projectPage.records}" var="project">
                  <tr>
                    <td><span class="text-muted">${project.projectId}</span></td>
                    <td><a href="<%=path%>/pond/config" class="text-reset" tabindex="-1">${project.name}</a></td>
                    <td>
                        ${project.address}
                    </td>
                    <td>
                        ${project.memo}
                    </td>
                    <td class="text-end">
                    </td>
                  </tr>
                </c:forEach>
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
        <h5 class="modal-title">新项目</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
          <label class="form-label required">项目名</label>
          <input type="text" class="form-control" name="project-name" id="project-name" placeholder="项目的名称">
          <div class="invalid-feedback">项目名称不能为空</div>
        </div>
        <div class="mb-3">
          <label class="form-label required">项目地址</label>
          <input type="text" class="form-control" name="project-addr" id="project-addr" placeholder="项目地址">
          <div class="invalid-feedback">项目地址不能为空</div>
        </div>
        <div class="mb-3">
          <label class="form-label">项目说明</label>
          <textarea class="form-control" rows="3" name="project-memo" id="project-memo"></textarea>
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
          创建项目
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
    $("#page-project").addClass("active");

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
    $("#project-name").removeClass("is-invalid");
    $("#project-addr").removeClass("is-invalid");
    var url = "<%=path%>/project/add";
    var data = {
      "name": "",
      "address": "",
      "memo": ""
    };

    var name = $("#project-name").val();
    var address = $("#project-addr").val();
    var memo = $("#project-memo").val();

    if (name.trim() === "") {
      $("#project-name").addClass("is-invalid");
      return;
    }

    if (address.trim() === "") {
      $("#project-name").addClass("is-invalid");
      return;
    }

    data.name = name;
    data.address = address;
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
          window.location.href = "<%=path%>/project/list";
        }

      });
  }
</script>
</body>
</html>
