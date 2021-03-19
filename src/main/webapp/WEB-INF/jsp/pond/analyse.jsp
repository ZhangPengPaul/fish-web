<%@include file="../common/common.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <title>驾驶舱</title>
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
  <%@include file="../common/header.jsp" %>
  <%@include file="../common/menu.jsp" %>
  <div class="content">
    <div class="container-fluid">
      <!-- Page title -->
      <div class="page-header d-print-none">
        <div class="row align-items-center">
          <div class="col">
            <div class="mb-1">
              <ol class="breadcrumb breadcrumb-alternate" aria-label="breadcrumbs">
                <li class="breadcrumb-item"><a href="<%=path%>/pond/list">池塘管理</a></li>
                <li class="breadcrumb-item">池塘数据分析</li>
                <li class="breadcrumb-item active" aria-current="page">${pondDetail.name}</li>
              </ol>
            </div>
            <h2 class="page-title">
              ${pondDetail.name}
            </h2>
          </div>
        </div>
      </div>
      <div class="row row-deck row-cards">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">池塘简介</h3>
            </div>
            <div class="card-body">
              ${pondDetail.memo}
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">基本信息</h3>
            </div>
            <div class="card-body">
              <div class="row row-cards">
                <div class="col-3">
                  <div class="card">
                    <div class="card-header">
                      <h5 class="card-title">池塘长度</h5>
                    </div>
                    <div class="card-body">
                      ${pondDetail.length}米
                    </div>
                  </div>
                </div>
                <div class="col-3">
                  <div class="card">
                    <div class="card-header">
                      <h5 class="card-title">池塘宽度</h5>
                    </div>
                    <div class="card-body">
                      ${pondDetail.width}米
                    </div>
                  </div>
                </div>
                <div class="col-3">
                  <div class="card">
                    <div class="card-header">
                      <h5 class="card-title">池塘深度</h5>
                    </div>
                    <div class="card-body">
                      ${pondDetail.depth}米
                    </div>
                  </div>
                </div>
                <div class="col-3">
                  <div class="card">
                    <div class="card-header">
                      <h5 class="card-title">池塘面积</h5>
                    </div>
                    <div class="card-body">
                      ${pondDetail.area}亩
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">养殖信息</h3>
            </div>
            <div class="card-body">
              <div class="row row-cards">
                <div class="col-3">
                  <div class="card">
                    <div class="card-header">
                      <h5 class="card-title">养殖阶段</h5>
                    </div>
                    <div class="card-body">
                      未开始
                    </div>
                  </div>
                </div>
                <div class="col-3">
                  <div class="card">
                    <div class="card-header">
                      <h5 class="card-title">养殖对象</h5>
                    </div>
                    <div class="card-body">
                      大闸蟹
                    </div>
                  </div>
                </div>
                <div class="col-3">
                  <div class="card">
                    <div class="card-header">
                      <h5 class="card-title">养殖天数</h5>
                    </div>
                    <div class="card-body">
                      20天
                    </div>
                  </div>
                </div>
                <div class="col-3">
                  <div class="card">
                    <div class="card-header">
                      <h5 class="card-title">放养日期</h5>
                    </div>
                    <div class="card-body">
                      2021-01-14
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">水质监测</h3>
            </div>
            <div class="card-body">
              <div class="row row-cards">
                <div class="col-3">
                  <div class="card">
                    <div class="card-body p-2 text-center">
                      <div class="h1 m-0">${tsDatas[99].temp}</div>
                      <div class="text-muted mb-3">温度</div>
                    </div>
                  </div>
                </div>
                <div class="col-9">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex">
                        <h3 class="card-title">温度</h3>
                      </div>
                      <div id="chart-temp"></div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row row-cards">
                <div class="col-3">
                  <div class="card">
                    <div class="card-body p-2 text-center">
                      <div class="h1 m-0">${tsDatas[99].oxygen}</div>
                      <div class="text-muted mb-3">溶氧</div>
                    </div>
                  </div>
                </div>
                <div class="col-9">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex">
                        <h3 class="card-title">溶氧</h3>
                      </div>
                      <div id="chart-ry"></div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row row-cards">
                <div class="col-3">
                  <div class="card">
                    <div class="card-body p-2 text-center">
                      <div class="h1 m-0">${tsDatas[99].ph}</div>
                      <div class="text-muted mb-3">PH</div>
                    </div>
                  </div>
                </div>
                <div class="col-9">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex">
                        <h3 class="card-title">PH</h3>
                      </div>
                      <div id="chart-ph"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">远程控制</h3>
            </div>
            <div class="table-responsive">
              <table class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                <tr>
                  <th>设备名称</th>
                  <th>备注信息</th>
                  <th>设备状态</th>
                  <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${prodDevices}" var="prodDevice">
                  <tr>
                    <td><span class="text-muted">${prodDevice.name}</span></td>
                    <td>${prodDevice.type}</td>
                    <td>${prodDevice.memo}</td>
                    <td class="text-end">
                      <label class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" checked="">
                      </label>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@include file="../common/footer.jsp" %>
  </div>
</div>
<!-- Libs JS -->
<script src="<%=path%>/dist/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=path%>/dist/libs/jquery/dist/jquery.slim.min.js"></script>
<script src="<%=path%>/dist/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="<%=path%>/dist/libs/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="<%=path%>/dist/libs/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<!-- Tabler Core -->
<script src="<%=path%>/dist/js/tabler.min.js"></script>
<script>
  $("document").ready(function () {
    $("#page-index").removeClass("active");
    $("#page-pond").addClass("active");
  });
</script>
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    var tempData = [];
    var tempLabels = [];
    <c:forEach items="${tsDatas}" var="data">
    tempData.push(${data.temp});
    tempLabels.push('<fmt:formatDate value="${data.timestamp}" pattern="yyyy-MM-dd HH:mm"/>');
    </c:forEach>

    window.ApexCharts && (new ApexCharts(document.getElementById('chart-temp'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 300,
        parentHeightOffset: 0,
        toolbar: {
          show: false,
        },
        animations: {
          enabled: false
        },
      },
      fill: {
        opacity: 1,
      },
      stroke: {
        width: 2,
        lineCap: "round",
        curve: "smooth",
      },
      series: [{
        name: "温度",
        data: tempData
      }],
      grid: {
        padding: {
          top: -20,
          right: 0,
          left: -4,
          bottom: -4
        },
        strokeDashArray: 4,
        xaxis: {
          lines: {
            show: true
          }
        },
      },
      yaxis: {
        labels: {
          padding: 4
        },
      },
      labels: tempLabels,
      colors: ["#98baea"],
      legend: {
        show: true,
        position: 'bottom',
        height: 32,
        offsetY: 8,
        markers: {
          width: 8,
          height: 8,
          radius: 100,
        },
        itemMargin: {
          horizontal: 8,
        },
      },
    })).render();

    var ryData = [];
    var ryLabels = [];
    <c:forEach items="${tsDatas}" var="data">
    ryData.push(${data.oxygen});
    ryLabels.push('<fmt:formatDate value="${data.timestamp}" pattern="yyyy-MM-dd HH:mm"/>');
    </c:forEach>

    window.ApexCharts && (new ApexCharts(document.getElementById('chart-ry'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 300,
        parentHeightOffset: 0,
        toolbar: {
          show: false,
        },
        animations: {
          enabled: false
        },
      },
      fill: {
        opacity: 1,
      },
      stroke: {
        width: 2,
        lineCap: "round",
        curve: "smooth",
      },
      series: [{
        name: "溶氧",
        data: ryData
      }],
      grid: {
        padding: {
          top: -20,
          right: 0,
          left: -4,
          bottom: -4
        },
        strokeDashArray: 4,
        xaxis: {
          lines: {
            show: true
          }
        },
      },
      yaxis: {
        labels: {
          padding: 4
        },
      },
      labels: ryLabels,
      colors: ["#98baea"],
      legend: {
        show: true,
        position: 'bottom',
        height: 32,
        offsetY: 8,
        markers: {
          width: 8,
          height: 8,
          radius: 100,
        },
        itemMargin: {
          horizontal: 8,
        },
      },
    })).render();

    var phData = [];
    var phLabels = [];
    <c:forEach items="${tsDatas}" var="data">
    phData.push(${data.ph});
    phLabels.push('<fmt:formatDate value="${data.timestamp}" pattern="yyyy-MM-dd HH:mm"/>');
    </c:forEach>
    window.ApexCharts && (new ApexCharts(document.getElementById('chart-ph'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 300,
        parentHeightOffset: 0,
        toolbar: {
          show: false,
        },
        animations: {
          enabled: false
        },
      },
      fill: {
        opacity: 1,
      },
      stroke: {
        width: 2,
        lineCap: "round",
        curve: "smooth",
      },
      series: [{
        name: "PH",
        data: phData
      }],
      grid: {
        padding: {
          top: -20,
          right: 0,
          left: -4,
          bottom: -4
        },
        strokeDashArray: 4,
        xaxis: {
          lines: {
            show: true
          }
        },
      },
      yaxis: {
        labels: {
          padding: 4
        },
      },
      labels: phLabels,
      colors: ["#98baea"],
      legend: {
        show: true,
        position: 'bottom',
        height: 32,
        offsetY: 8,
        markers: {
          width: 8,
          height: 8,
          radius: 100,
        },
        itemMargin: {
          horizontal: 8,
        },
      },
    })).render();
  });
  // @formatter:on
</script>
</body>
</html>
