<%@include file="../../common/common.jsp" %>
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
<body class="antialiased theme-dark">
<div class="page">
  <div class="sticky-top">
    <%@include file="../../common/header.jsp" %>
    <%@include file="../../common/menu.jsp" %>
  </div>
  <div class="content">
    <div class="container-fluid">
      <!-- Page title -->
      <div class="page-header d-print-none">
        <div class="row align-items-center">
          <div class="col">
            <h2 class="page-title">
              一号塘
            </h2>
          </div>
        </div>
      </div>
      <div class="row row-deck row-cards">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4>基本信息</h4>
            </div>
            <div class="card-body">
              <div class="col-12">
                <div class="card card-sm">
                  <div class="card-body">
                    <div class="row align-items-center">
                      <div class="col-auto">
                          <span class="bg-blue text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                                                       width="24" height="24" viewBox="0 0 24 24"
                                                                       stroke-width="2" stroke="currentColor"
                                                                       fill="none" stroke-linecap="round"
                                                                       stroke-linejoin="round"><path stroke="none"
                                                                                                     d="M0 0h24v24H0z"
                                                                                                     fill="none"></path><polyline
                            points="6 21 21 6 18 3 3 18 6 21"></polyline><line x1="15" y1="6" x2="18" y2="9"></line><path
                            d="M9 3a2 2 0 0 0 2 2a2 2 0 0 0 -2 2a2 2 0 0 0 -2 -2a2 2 0 0 0 2 -2"></path><path
                            d="M19 13a2 2 0 0 0 2 2a2 2 0 0 0 -2 2a2 2 0 0 0 -2 -2a2 2 0 0 0 2 -2"></path></svg>
                          </span>
                      </div>
                      <div class="col">
                        <div class="font-weight-medium">
                          大闸蟹
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card card-sm">
                  <div class="card-body">
                    <div class="row align-items-center">
                      <div class="col-auto">
                          <span class="bg-blue text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                                                       width="24" height="24" viewBox="0 0 24 24"
                                                                       stroke-width="2" stroke="currentColor"
                                                                       fill="none" stroke-linecap="round"
                                                                       stroke-linejoin="round"><path stroke="none"
                                                                                                     d="M0 0h24v24H0z"
                                                                                                     fill="none"></path><circle
                            cx="9.5" cy="9.5" r="6.5"></circle><rect x="10" y="10" width="11" height="11" rx="2"></rect></svg>
                          </span>
                      </div>
                      <div class="col">
                        <div class="font-weight-medium">
                          25.0亩
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card card-sm">
                  <div class="card-body">
                    <div class="row align-items-center">
                      <div class="col-auto">
                          <span class="bg-blue text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                                                       width="24" height="24" viewBox="0 0 24 24"
                                                                       stroke-width="2" stroke="currentColor"
                                                                       fill="none" stroke-linecap="round"
                                                                       stroke-linejoin="round"><path stroke="none"
                                                                                                     d="M0 0h24v24H0z"
                                                                                                     fill="none"></path><path
                            d="M16.7 8a3 3 0 0 0 -2.7 -2h-4a3 3 0 0 0 0 6h4a3 3 0 0 1 0 6h-4a3 3 0 0 1 -2.7 -2"></path><path
                            d="M12 3v3m0 12v3"></path></svg>
                          </span>
                      </div>
                      <div class="col">
                        <div class="font-weight-medium">
                          100
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="card">
            <div class="card-body">
              <div class="d-flex align-items-center">
                <div class="subheader">远程开关</div>
              </div>
              <div class="d-flex align-items-baseline">
                <div class="col">
                  <div class="font-weight-medium">
                    增氧泵
                  </div>
                  <div class="text-muted">
                    <label class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" checked="">
                    </label>
                  </div>
                </div>
                <div class="col">
                  <div class="font-weight-medium">
                    推水机
                  </div>
                  <div class="text-muted">
                    <label class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" checked="">
                    </label>
                  </div>
                </div>
              </div>
            </div>
            <div class="resize-triggers">
              <div class="expand-trigger">
                <div style="width: 343px; height: 120px;"></div>
              </div>
              <div class="contract-trigger"></div>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="card">
            <div class="card-body">
              <div id="myPlayer"></div>
            </div>
            <div class="resize-triggers">
              <div class="expand-trigger">
                <div style="width: 343px; height: 120px;"></div>
              </div>
              <div class="contract-trigger"></div>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="card">
            <div class="card-body">
              <div class="d-flex align-items-center">
                <div class="subheader">温度</div>
              </div>
              <div class="d-flex align-items-baseline">
                <div class="h1 mb-0 me-2">
                  <fmt:formatNumber type="number" value="${tsData.records[0].temp}"
                                    maxFractionDigits="1"/>
                </div>
              </div>
            </div>
            <div id="chart-temp-bg" class="chart-sm">

            </div>
            <div class="resize-triggers">
              <div class="expand-trigger">
                <div style="width: 343px; height: 120px;"></div>
              </div>
              <div class="contract-trigger"></div>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="card">
            <div class="card-body">
              <div class="d-flex align-items-center">
                <div class="subheader">溶氧</div>
              </div>
              <div class="d-flex align-items-baseline">
                <div class="h1 mb-0 me-2">
                  <fmt:formatNumber type="number" value="${tsData.records[0].oxygen}"
                                    maxFractionDigits="1"/>
                </div>
              </div>
            </div>
            <div id="chart-ry-bg" class="chart-sm">

            </div>
            <div class="resize-triggers">
              <div class="expand-trigger">
                <div style="width: 343px; height: 120px;"></div>
              </div>
              <div class="contract-trigger"></div>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="card">
            <div class="card-body">
              <div class="d-flex align-items-center">
                <div class="subheader">PH</div>
              </div>
              <div class="d-flex align-items-baseline">
                <div class="h1 mb-0 me-2">
                  <fmt:formatNumber type="number" value="${tsData.records[0].ph}"
                                    maxFractionDigits="1"/>
                </div>
              </div>
            </div>
            <div id="chart-ph-bg" class="chart-sm">

            </div>
            <div class="resize-triggers">
              <div class="expand-trigger">
                <div style="width: 343px; height: 120px;"></div>
              </div>
              <div class="contract-trigger"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@include file="../../common/footer.jsp" %>
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
<script src="https://webapi.amap.com/loader.js"></script>
<!-- Tabler Core -->
<script src="<%=path%>/dist/js/tabler.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/fetch/3.5.0/fetch.min.js"></script>
<script src="<%=path%>/dist/libs/page/bootstrap-paginator.min.js"></script>
<script src="<%=path%>/dist/js/ezuikit.js"></script>
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
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    var tempData = [];
    var tempLabels = [];
    <c:forEach items="${tsDatas.records}" var="data">
    tempData.push(${data.temp});
    tempLabels.push('<fmt:formatDate value="${data.timestamp}" pattern="yyyy-MM-dd HH:mm"/>');
    </c:forEach>
    window.ApexCharts && (new ApexCharts(document.getElementById('chart-temp-bg'), {
      chart: {
        type: "area",
        fontFamily: 'inherit',
        height: 40.0,
        sparkline: {
          enabled: true
        },
        animations: {
          enabled: false
        },
      },
      dataLabels: {
        enabled: false,
      },
      fill: {
        opacity: .16,
        type: 'solid'
      },
      stroke: {
        width: 2,
        lineCap: "round",
        curve: "smooth",
      },
      series: [{
        name: "Profits",
        data: tempData
        // [37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46, 39, 62, 51, 35, 41, 67]
      }],
      grid: {
        strokeDashArray: 4,
      },
      xaxis: {
        labels: {
          padding: 0
        },
        tooltip: {
          enabled: false
        },
        axisBorder: {
          show: false,
        },
        type: 'datetime',
      },
      yaxis: {
        labels: {
          padding: 4
        },
      },
      labels: tempLabels,
      //   [
      //   '2020-06-20', '2020-06-21', '2020-06-22', '2020-06-23', '2020-06-24', '2020-06-25', '2020-06-26', '2020-06-27', '2020-06-28', '2020-06-29', '2020-06-30', '2020-07-01', '2020-07-02', '2020-07-03', '2020-07-04', '2020-07-05', '2020-07-06', '2020-07-07', '2020-07-08', '2020-07-09', '2020-07-10', '2020-07-11', '2020-07-12', '2020-07-13', '2020-07-14', '2020-07-15', '2020-07-16', '2020-07-17', '2020-07-18', '2020-07-19'
      // ],
      colors: ["#206bc4"],
      legend: {
        show: false,
      },
    })).render();
  });
  // @formatter:on
</script>
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    var ryData = [];
    var ryLabels = [];
    <c:forEach items="${tsDatas.records}" var="data">
    ryData.push(${data.oxygen});
    ryLabels.push('<fmt:formatDate value="${data.timestamp}" pattern="yyyy-MM-dd HH:mm"/>');
    </c:forEach>
    window.ApexCharts && (new ApexCharts(document.getElementById('chart-ry-bg'), {
      chart: {
        type: "area",
        fontFamily: 'inherit',
        height: 40.0,
        sparkline: {
          enabled: true
        },
        animations: {
          enabled: false
        },
      },
      dataLabels: {
        enabled: false,
      },
      fill: {
        opacity: .16,
        type: 'solid'
      },
      stroke: {
        width: 2,
        lineCap: "round",
        curve: "smooth",
      },
      series: [{
        name: "Profits",
        data: ryData,
        // [37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46, 39, 62, 51, 35, 41, 67]
      }],
      grid: {
        strokeDashArray: 4,
      },
      xaxis: {
        labels: {
          padding: 0
        },
        tooltip: {
          enabled: false
        },
        axisBorder: {
          show: false,
        },
        type: 'datetime',
      },
      yaxis: {
        labels: {
          padding: 4
        },
      },
      labels: ryLabels,
      //   [
      //   '2020-06-20', '2020-06-21', '2020-06-22', '2020-06-23', '2020-06-24', '2020-06-25', '2020-06-26', '2020-06-27', '2020-06-28', '2020-06-29', '2020-06-30', '2020-07-01', '2020-07-02', '2020-07-03', '2020-07-04', '2020-07-05', '2020-07-06', '2020-07-07', '2020-07-08', '2020-07-09', '2020-07-10', '2020-07-11', '2020-07-12', '2020-07-13', '2020-07-14', '2020-07-15', '2020-07-16', '2020-07-17', '2020-07-18', '2020-07-19'
      // ],
      colors: ["#206bc4"],
      legend: {
        show: false,
      },
    })).render();
  });
  // @formatter:on
</script>
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    var phData = [];
    var phLabels = [];
    <c:forEach items="${tsDatas.records}" var="data">
    phData.push(${data.ph});
    phLabels.push('<fmt:formatDate value="${data.timestamp}" pattern="yyyy-MM-dd HH:mm"/>');
    </c:forEach>
    window.ApexCharts && (new ApexCharts(document.getElementById('chart-ph-bg'), {
      chart: {
        type: "area",
        fontFamily: 'inherit',
        height: 40.0,
        sparkline: {
          enabled: true
        },
        animations: {
          enabled: false
        },
      },
      dataLabels: {
        enabled: false,
      },
      fill: {
        opacity: .16,
        type: 'solid'
      },
      stroke: {
        width: 2,
        lineCap: "round",
        curve: "smooth",
      },
      series: [{
        name: "Profits",
        data: phData
        // [37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46, 39, 62, 51, 35, 41, 67]
      }],
      grid: {
        strokeDashArray: 4,
      },
      xaxis: {
        labels: {
          padding: 0
        },
        tooltip: {
          enabled: false
        },
        axisBorder: {
          show: false,
        },
        type: 'datetime',
      },
      yaxis: {
        labels: {
          padding: 4
        },
      },
      labels: phLabels,
      //   [
      //   '2020-06-20', '2020-06-21', '2020-06-22', '2020-06-23', '2020-06-24', '2020-06-25', '2020-06-26', '2020-06-27', '2020-06-28', '2020-06-29', '2020-06-30', '2020-07-01', '2020-07-02', '2020-07-03', '2020-07-04', '2020-07-05', '2020-07-06', '2020-07-07', '2020-07-08', '2020-07-09', '2020-07-10', '2020-07-11', '2020-07-12', '2020-07-13', '2020-07-14', '2020-07-15', '2020-07-16', '2020-07-17', '2020-07-18', '2020-07-19'
      // ],
      colors: ["#206bc4"],
      legend: {
        show: false,
      },
    })).render();
  });
  // @formatter:on
</script>
<script type="application/javascript">
  var player = new EZUIPlayer({
    id: 'myPlayer',
    url: 'ezopen://open.ys7.com/F43323849/1.hd.live',
    autoplay: true,
    accessToken: "at.1fscvppp9cmd71hu8t0xr5q90g9r0xd3-2kqgms1bmp-0abqw6m-4ih0nqfp3",
    decoderPath: '<%=path%>/dist',
    width: 300,
    height: 200
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
        if (response.code !== 200) {
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
