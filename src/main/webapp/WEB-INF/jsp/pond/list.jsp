<%@include file="../common/common.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <title>池塘管理</title>
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
  <%@include file="../common/header.jsp" %>
  <%@include file="../common/menu.jsp" %>
  <div class="content">
    <div class="container-fluid">
      <!-- Page title -->
      <div class="page-header d-print-none">
        <div class="row align-items-center">
          <div class="col">
            <h2 class="page-title">
              池塘列表
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
                    <input type="text" class="form-control" placeholder="搜索池塘…"
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
                新增池塘
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
              <h3 class="card-title">池塘列表</h3>
            </div>
            <div class="table-responsive">
              <table class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                <tr>
                  <th>池塘编号</th>
                  <th>池塘名称</th>
                  <th>池塘类型</th>
                  <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pondPage.records}" var="pond">
                  <tr>
                    <td><span class="text-muted">${pond.pondId}</span></td>
                    <td><a href="<%=path%>/pond/config" class="text-reset" tabindex="-1">${pond.name}</a></td>
                    <td>
                        ${pond.type}
                    </td>
                    <td class="text-end">
                      <a href="<%=path%>/pond/config" class="btn btn-primary w-30">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                             stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                          <path
                            d="M10.325 4.317c.426 -1.756 2.924 -1.756 3.35 0a1.724 1.724 0 0 0 2.573 1.066c1.543 -.94 3.31 .826 2.37 2.37a1.724 1.724 0 0 0 1.065 2.572c1.756 .426 1.756 2.924 0 3.35a1.724 1.724 0 0 0 -1.066 2.573c.94 1.543 -.826 3.31 -2.37 2.37a1.724 1.724 0 0 0 -2.572 1.065c-.426 1.756 -2.924 1.756 -3.35 0a1.724 1.724 0 0 0 -2.573 -1.066c-1.543 .94 -3.31 -.826 -2.37 -2.37a1.724 1.724 0 0 0 -1.065 -2.572c-1.756 -.426 -1.756 -2.924 0 -3.35a1.724 1.724 0 0 0 1.066 -2.573c-.94 -1.543 .826 -3.31 2.37 -2.37c1 .608 2.296 .07 2.572 -1.065z"/>
                          <circle cx="12" cy="12" r="3"/>
                        </svg>
                        配置
                      </a>
                      <a href="#" class="btn btn-primary w-30">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                             stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                          <path d="M9 7h-3a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-3"/>
                          <path d="M9 15h3l8.5 -8.5a1.5 1.5 0 0 0 -3 -3l-8.5 8.5v3"/>
                          <line x1="16" y1="5" x2="19" y2="8"/>
                        </svg>
                        编辑
                      </a>
                      <a href="#" class="btn btn-primary w-30">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                             stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                          <ellipse cx="12" cy="6" rx="8" ry="3"></ellipse>
                          <path d="M4 6v6a8 3 0 0 0 16 0v-6"/>
                          <path d="M4 12v6a8 3 0 0 0 16 0v-6"/>
                        </svg>
                        查看数据
                      </a>
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
  <div class="alert alert-important alert-success alert-dismissible visually-hidden" id="success-alert" role="alert">
    <div class="d-flex">
      <div>
        <!-- SVG icon code with class="alert-icon" -->
      </div>
      <div>
        Your account has been saved!
      </div>
    </div>
    <a class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="close"></a>
  </div>
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
        <h5 class="modal-title">新池塘</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
          <label class="form-label required">池塘名称</label>
          <input type="text" class="form-control" name="pond-name" id="pond-name" placeholder="池塘的名称">
          <div class="invalid-feedback">池塘名称不能为空</div>
        </div>
        <label class="form-label required">池塘类型</label>
        <div class="form-selectgroup-boxes row mb-3">
          <div class="col-lg-6">
            <label class="form-selectgroup-item">
              <input type="radio" name="pond-type" value="1" class="form-selectgroup-input" checked>
              <span class="form-selectgroup-label d-flex align-items-center p-3">
                                <span class="me-3">
                                  <span class="form-selectgroup-check"></span>
                                </span>
                    <span class="form-selectgroup-label-content">
                      <span class="form-selectgroup-title strong mb-1">养殖塘</span>
                      <span class="d-block text-muted">养殖塘介绍文字</span>
                    </span>
                  </span>
            </label>
          </div>
          <div class="col-lg-6">
            <label class="form-selectgroup-item">
              <input type="radio" name="pond-type" value="2" class="form-selectgroup-input">
              <span class="form-selectgroup-label d-flex align-items-center p-3">
                    <span class="me-3">
                      <span class="form-selectgroup-check"></span>
                    </span>
                    <span class="form-selectgroup-label-content">
                      <span class="form-selectgroup-title strong mb-1">净化塘</span>
                      <span class="d-block text-muted">净化塘介绍文字</span>
                    </span>
                  </span>
            </label>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-3">
            <div class="mb-3">
              <label class="form-label required">池塘长度</label>
              <div class="input-group input-group-flat">
                <input type="text" class="form-control" name="pond-length" id="pond-length">
                <div class="invalid-feedback">池塘长度不能为空</div>
              </div>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="mb-3">
              <label class="form-label required">池塘宽度</label>
              <input type="text" class="form-control" name="pond-width" id="pond-width">
              <div class="invalid-feedback">池塘宽度不能为空</div>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="mb-3">
              <label class="form-label required">池塘深度</label>
              <input type="text" class="form-control" name="pond-depth" id="pond-depth">
              <div class="invalid-feedback">池塘深度不能为空</div>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="mb-3">
              <label class="form-label required">池塘面积</label>
              <input type="text" class="form-control" name="pond-area" id="pond-area">
              <div class="invalid-feedback">池塘面积不能为空</div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-12">
            <div>
              <label class="form-label">附加信息</label>
              <textarea class="form-control" rows="3" name="pond-memo" id="pond-memo"></textarea>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col">
            <label class="form-label required">绘制池塘轮廓<label class="badge bg-red-lt">（鼠标左键点击绘制，右键点击完成）</label></label>
          </div>
          <div class="col-auto ms-auto">
            <a href="javascript:;" id="clear" class="btn btn-primary w-30">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                   viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                   stroke-linecap="round" stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                <path d="M19 19h-11l-4 -4a1 1 0 0 1 0 -1.41l10 -10a1 1 0 0 1 1.41 0l5 5a1 1 0 0 1 0 1.41l-9 9"/>
                <line x1="18" y1="12.3" x2="11.7" y2="6"/>
              </svg>
              全部清除
            </a>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div>
              <div style="width: 100%;height: 300px" id="map"></div>
              <div class="invalid-feedback">池塘轮廓没有绘制</div>
            </div>
          </div>
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
          创建池塘
        </a>
      </div>
    </div>
  </div>
</div>
<!-- Libs JS -->
<script src="<%=path%>/dist/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=path%>/dist/libs/jquery/dist/jquery.slim.min.js"></script>
<script src="<%=path%>/dist/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="<%=path%>/dist/libs/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="<%=path%>/dist/libs/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="https://webapi.amap.com/loader.js"></script>
<!-- Tabler Core -->
<script src="<%=path%>/dist/js/tabler.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/fetch/3.5.0/fetch.min.js"></script>
<script src="<%=path%>/dist/libs/page/bootstrap-paginator.min.js"></script>
<script>
  $("document").ready(function () {
    $("#page-index").removeClass("active");
    $("#page-pond").addClass("active");

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
  // 池塘轮廓坐标点数组
  var indexs = [];

  AMapLoader.load({
    "key": "f824b2bfc96d319950893291586c3600",              // 申请好的Web端开发者Key，首次调用 load 时必填
    "version": "2.0",   // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
    "plugins": ['AMap.Scale', 'AMap.ToolBar', 'AMap.MouseTool'],      // 需要使用的的插件列表，如比例尺'AMap.Scale'等
    "AMapUI": {             // 是否加载 AMapUI，缺省不加载
      "version": '1.1',   // AMapUI 缺省 1.1
      "plugins": ['overlay/SimpleMarker'],       // 需要加载的 AMapUI ui插件
    }
  }).then((AMap) => {
    var map = new AMap.Map('map', {
      zoom: 18
    });
    map.addControl(new AMap.Scale());
    var satelliteLayer = new AMap.TileLayer.Satellite();
    map.add(satelliteLayer);

    // 矩形绘制
    var mouseTool = new AMap.MouseTool(map);
    var overlays = [];
    mouseTool.on('draw', function (e) {
      overlays.push(e.obj);
    })

    function draw() {
      mouseTool.polygon({
        fillColor: '#00b0ff',
        strokeColor: '#80d8ff'
      });
    }

    draw();

    // 矩形坐标点
    map.on('click', polygonIndex);

    function polygonIndex(e) {
      var lng = e.lnglat.getLng();
      var lat = e.lnglat.getLat();
      var point = {
        "lng": lng,
        "lat": lat
      }
      indexs.push(point);
      console.log(indexs);
    }

    $("#clear").click(function () {
      map.remove(overlays);
      overlays = [];
      indexs = [];
    });
  }).catch((e) => {
    console.error(e);  //加载错误提示
  });

  function add() {
    $("#pond-name").removeClass("is-invalid");
    $("#pond-length").removeClass("is-invalid");
    $("#pond-width").removeClass("is-invalid");
    $("#pond-depth").removeClass("is-invalid");
    $("#pond-area").removeClass("is-invalid");
    $("#map").removeClass("is-invalid");
    var url = "<%=path%>/pond/add";
    var data = {
      "name": "",
      "type": "",
      "length": "",
      "width": "",
      "depth": "",
      "area": "",
      "memo": "",
      "outline": ""
    };

    var name = $("#pond-name").val();
    var type = $("input[name='pond-type']:checked").val();
    var length = $("#pond-length").val();
    var width = $("#pond-width").val();
    var depth = $("#pond-depth").val();
    var area = $("#pond-area").val();
    var memo = $("#pond-memo").val();

    if (name.trim() === "") {
      $("#pond-name").addClass("is-invalid");
      return;
    }

    if (length.trim() === "") {
      $("#pond-length").addClass("is-invalid");
      return;
    }

    if (width.trim() === "") {
      $("#pond-width").addClass("is-invalid");
      return;
    }

    if (depth.trim() === "") {
      $("#pond-depth").addClass("is-invalid");
      return;
    }

    if (area.trim() === "") {
      $("#pond-area").addClass("is-invalid");
      return;
    }

    if (indexs.length === 0) {
      $("#map").addClass("is-invalid");
      return;
    }

    data.name = name;
    data.type = type;
    data.length = length;
    data.width = width;
    data.depth = depth;
    data.area = area;
    data.memo = memo;
    data.outline = JSON.stringify(indexs);

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
        if (response.code === 500) {
          $("#error-alert").removeClass("visually-hidden");
        } else {
          window.location.href = "<%=path%>/pond/list";
        }

      });
  }
</script>
<script type="text/javascript">
</script>
</body>
</html>
