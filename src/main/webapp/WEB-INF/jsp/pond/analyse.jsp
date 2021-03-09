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
                      <div class="h1 m-0">${tsDatas.records[0].temp}</div>
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
                      <div class="h1 m-0">${tsDatas.records[0].oxygen}</div>
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
                      <div class="h1 m-0">${tsDatas.records[0].ph}</div>
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
    <c:forEach items="${tsDatas.records}" var="data">
    tempData.push(${data.temp});
    tempLabels.push('<fmt:formatDate value="${data.timestamp}" pattern="yyyy-MM-dd HH:mm"/>');
    </c:forEach>

    window.ApexCharts && (new ApexCharts(document.getElementById('chart-temp'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 150,
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
        // [18.78, 18.52, 17.46, 18.85, 17.81, 17.88, 18.31, 18.04, 17.50, 17.83, 18.20, 17.83, 17.29, 17.02, 17.28, 19.00, 17.76, 18.09, 18.68, 18.82, 17.06, 17.66, 18.35, 18.36, 17.63, 18.85, 17.41, 17.46, 18.28, 18.11, 18.34, 17.63, 17.96, 18.93, 17.26, 17.48, 18.99, 18.60, 17.15, 17.59, 17.87, 18.71, 18.76, 18.25, 17.78, 17.84, 17.63, 17.32, 18.33, 18.85, 18.21]
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
      colors: ["#3b5998"],
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
    <c:forEach items="${tsDatas.records}" var="data">
    ryData.push(${data.oxygen});
    ryLabels.push('<fmt:formatDate value="${data.timestamp}" pattern="yyyy-MM-dd HH:mm"/>');
    </c:forEach>

    window.ApexCharts && (new ApexCharts(document.getElementById('chart-ry'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 150,
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
      colors: ["#1da1f2"],
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
    <c:forEach items="${tsDatas.records}" var="data">
    phData.push(${data.ph});
    phLabels.push('<fmt:formatDate value="${data.timestamp}" pattern="yyyy-MM-dd HH:mm"/>');
    </c:forEach>
    window.ApexCharts && (new ApexCharts(document.getElementById('chart-ph'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 150,
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
      colors: ["#ea4c89"],
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
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    window.ApexCharts && (new ApexCharts(document.getElementById('chart-do-referrals'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 150,
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
        name: "一号塘",
        data: [18.78, 18.52, 17.46, 18.85, 17.81, 17.88, 18.31, 18.04, 17.50, 17.83, 18.20, 17.83, 17.29, 17.02, 17.28, 19.00, 17.76, 18.09, 18.68, 18.82, 17.06, 17.66, 18.35, 18.36, 17.63, 18.85, 17.41, 17.46, 18.28, 18.11, 18.34, 17.63, 17.96, 18.93, 17.26, 17.48, 18.99, 18.60, 17.15, 17.59, 17.87, 18.71, 18.76, 18.25, 17.78, 17.84, 17.63, 17.32, 18.33, 18.85, 18.21]
      }, {
        name: "二号塘",
        data: [18.79, 17.11, 18.41, 18.26, 17.30, 17.60, 17.01, 17.79, 18.24, 17.93, 17.88, 18.89, 18.17, 17.33, 17.20, 17.45, 18.95, 17.75, 18.48, 17.03, 17.42, 18.18, 18.60, 17.52, 17.79, 18.80, 18.23, 17.43, 18.47, 17.35, 18.12, 17.90, 18.19, 18.45, 17.02, 18.73, 17.74, 18.80, 17.18, 18.52, 17.57, 17.59, 18.73, 17.42, 18.03, 17.54, 18.97, 18.30, 17.49, 17.99, 17.09]
      }, {
        name: "三号塘",
        data: [18.63, 17.01, 17.10, 17.46, 17.22, 18.64, 18.46, 18.64, 18.92, 17.87, 18.85, 17.38, 18.64, 17.33, 18.60, 18.27, 17.77, 18.40, 18.03, 18.23, 17.99, 18.09, 17.05, 17.07, 17.73, 17.83, 18.59, 18.76, 17.78, 17.09, 18.71, 18.57, 18.44, 17.67, 17.97, 17.77, 18.69, 17.24, 17.85, 17.11, 18.52, 17.54, 18.75, 18.85, 18.72, 18.98, 17.85, 18.01, 17.97, 18.40, 17.03]
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
      xaxis: {
        labels: {
          padding: 0
        },
        tooltip: {
          enabled: false
        },
        type: 'datetime',
        datetimeUTC: true
      },
      yaxis: {
        labels: {
          padding: 4
        },
      },
      labels: [
        '2021-01-12 10:05:00', '2021-01-12 10:10:00', '2021-01-12 10:15:00', '2021-01-12 10:20:00', '2021-01-12 10:25:00', '2021-01-12 10:30:00', '2021-01-12 10:35:00', '2021-01-12 10:40:00', '2021-01-12 10:45:00', '2021-01-12 10:50:00', '2021-01-12 10:55:00', '2021-01-12 11:00:00', '2021-01-12 11:05:00', '2021-01-12 11:10:00', '2021-01-12 11:15:00', '2021-01-12 11:20:00', '2021-01-12 11:25:00', '2021-01-12 11:30:00', '2021-01-12 11:35:00', '2021-01-12 11:40:00', '2021-01-12 11:45:00', '2021-01-12 11:50:00', '2021-01-12 11:55:00', '2021-01-12 12:00:00', '2021-01-12 12:05:00', '2021-01-12 12:10:00', '2021-01-12 12:15:00', '2021-01-12 12:20:00', '2021-01-12 12:25:00', '2021-01-12 12:30:00', '2021-01-12 12:35:00', '2021-01-12 12:40:00', '2021-01-12 12:45:00', '2021-01-12 12:50:00', '2021-01-12 12:55:00', '2021-01-12 13:00:00', '2021-01-12 13:05:00', '2021-01-12 13:10:00', '2021-01-12 13:15:00', '2021-01-12 13:20:00', '2021-01-12 13:25:00', '2021-01-12 13:30:00', '2021-01-12 13:35:00', '2021-01-12 13:40:00', '2021-01-12 13:45:00', '2021-01-12 13:50:00', '2021-01-12 13:55:00', '2021-01-12 14:00:00', '2021-01-12 14:05:00', '2021-01-12 14:10:00', '2021-01-12 14:15:00'
      ],
      colors: ["#3b5998", "#1da1f2", "#ea4c89"],
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
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    window.ApexCharts && (new ApexCharts(document.getElementById('chart-revenue-bg'), {
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
        data: [37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46, 39, 62, 51, 35, 41, 67]
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
      labels: [
        '2020-06-20', '2020-06-21', '2020-06-22', '2020-06-23', '2020-06-24', '2020-06-25', '2020-06-26', '2020-06-27', '2020-06-28', '2020-06-29', '2020-06-30', '2020-07-01', '2020-07-02', '2020-07-03', '2020-07-04', '2020-07-05', '2020-07-06', '2020-07-07', '2020-07-08', '2020-07-09', '2020-07-10', '2020-07-11', '2020-07-12', '2020-07-13', '2020-07-14', '2020-07-15', '2020-07-16', '2020-07-17', '2020-07-18', '2020-07-19'
      ],
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
    window.ApexCharts && (new ApexCharts(document.getElementById('chart-new-clients'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 40.0,
        sparkline: {
          enabled: true
        },
        animations: {
          enabled: false
        },
      },
      fill: {
        opacity: 1,
      },
      stroke: {
        width: [2, 1],
        dashArray: [0, 3],
        lineCap: "round",
        curve: "smooth",
      },
      series: [{
        name: "May",
        data: [37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 4, 46, 39, 62, 51, 35, 41, 67]
      }, {
        name: "April",
        data: [93, 54, 51, 24, 35, 35, 31, 67, 19, 43, 28, 36, 62, 61, 27, 39, 35, 41, 27, 35, 51, 46, 62, 37, 44, 53, 41, 65, 39, 37]
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
        type: 'datetime',
      },
      yaxis: {
        labels: {
          padding: 4
        },
      },
      labels: [
        '2020-06-20', '2020-06-21', '2020-06-22', '2020-06-23', '2020-06-24', '2020-06-25', '2020-06-26', '2020-06-27', '2020-06-28', '2020-06-29', '2020-06-30', '2020-07-01', '2020-07-02', '2020-07-03', '2020-07-04', '2020-07-05', '2020-07-06', '2020-07-07', '2020-07-08', '2020-07-09', '2020-07-10', '2020-07-11', '2020-07-12', '2020-07-13', '2020-07-14', '2020-07-15', '2020-07-16', '2020-07-17', '2020-07-18', '2020-07-19'
      ],
      colors: ["#206bc4", "#a8aeb7"],
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
    window.ApexCharts && (new ApexCharts(document.getElementById('chart-active-users'), {
      chart: {
        type: "bar",
        fontFamily: 'inherit',
        height: 40.0,
        sparkline: {
          enabled: true
        },
        animations: {
          enabled: false
        },
      },
      plotOptions: {
        bar: {
          columnWidth: '50%',
        }
      },
      dataLabels: {
        enabled: false,
      },
      fill: {
        opacity: 1,
      },
      series: [{
        name: "Profits",
        data: [37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46, 39, 62, 51, 35, 41, 67]
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
      labels: [
        '2020-06-20', '2020-06-21', '2020-06-22', '2020-06-23', '2020-06-24', '2020-06-25', '2020-06-26', '2020-06-27', '2020-06-28', '2020-06-29', '2020-06-30', '2020-07-01', '2020-07-02', '2020-07-03', '2020-07-04', '2020-07-05', '2020-07-06', '2020-07-07', '2020-07-08', '2020-07-09', '2020-07-10', '2020-07-11', '2020-07-12', '2020-07-13', '2020-07-14', '2020-07-15', '2020-07-16', '2020-07-17', '2020-07-18', '2020-07-19'
      ],
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
    window.ApexCharts && (new ApexCharts(document.getElementById('chart-mentions'), {
      chart: {
        type: "bar",
        fontFamily: 'inherit',
        height: 240,
        parentHeightOffset: 0,
        toolbar: {
          show: false,
        },
        animations: {
          enabled: false
        },
        stacked: true,
      },
      plotOptions: {
        bar: {
          columnWidth: '50%',
        }
      },
      dataLabels: {
        enabled: false,
      },
      fill: {
        opacity: 1,
      },
      series: [{
        name: "Web",
        data: [1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 2, 12, 5, 8, 22, 6, 8, 6, 4, 1, 8, 24, 29, 51, 40, 47, 23, 26, 50, 26, 41, 22, 46, 47, 81, 46, 6]
      }, {
        name: "Social",
        data: [2, 5, 4, 3, 3, 1, 4, 7, 5, 1, 2, 5, 3, 2, 6, 7, 7, 1, 5, 5, 2, 12, 4, 6, 18, 3, 5, 2, 13, 15, 20, 47, 18, 15, 11, 10, 0]
      }, {
        name: "Other",
        data: [2, 9, 1, 7, 8, 3, 6, 5, 5, 4, 6, 4, 1, 9, 3, 6, 7, 5, 2, 8, 4, 9, 1, 2, 6, 7, 5, 1, 8, 3, 2, 3, 4, 9, 7, 1, 6]
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
      labels: [
        '2020-06-20', '2020-06-21', '2020-06-22', '2020-06-23', '2020-06-24', '2020-06-25', '2020-06-26', '2020-06-27', '2020-06-28', '2020-06-29', '2020-06-30', '2020-07-01', '2020-07-02', '2020-07-03', '2020-07-04', '2020-07-05', '2020-07-06', '2020-07-07', '2020-07-08', '2020-07-09', '2020-07-10', '2020-07-11', '2020-07-12', '2020-07-13', '2020-07-14', '2020-07-15', '2020-07-16', '2020-07-17', '2020-07-18', '2020-07-19', '2020-07-20', '2020-07-21', '2020-07-22', '2020-07-23', '2020-07-24', '2020-07-25', '2020-07-26'
      ],
      colors: ["#206bc4", "#79a6dc", "#bfe399"],
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
<script>
  // @formatter:on
  document.addEventListener("DOMContentLoaded", function () {
    $('#map-world').vectorMap({
      map: 'world_en',
      backgroundColor: 'transparent',
      color: 'rgba(120, 130, 140, .1)',
      borderColor: 'transparent',
      scaleColors: ["#d2e1f3", "#206bc4"],
      normalizeFunction: 'polynomial',
      values: (chart_data = {
        "af": 16,
        "al": 11,
        "dz": 158,
        "ao": 85,
        "ag": 1,
        "ar": 351,
        "am": 8,
        "au": 1219,
        "at": 366,
        "az": 52,
        "bs": 7,
        "bh": 21,
        "bd": 105,
        "bb": 3,
        "by": 52,
        "be": 461,
        "bz": 1,
        "bj": 6,
        "bt": 1,
        "bo": 19,
        "ba": 16,
        "bw": 12,
        "br": 2023,
        "bn": 11,
        "bg": 44,
        "bf": 8,
        "bi": 1,
        "kh": 11,
        "cm": 21,
        "ca": 1563,
        "cv": 1,
        "cf": 2,
        "td": 7,
        "cl": 199,
        "cn": 5745,
        "co": 283,
        "km": 0,
        "cd": 12,
        "cg": 11,
        "cr": 35,
        "ci": 22,
        "hr": 59,
        "cy": 22,
        "cz": 195,
        "dk": 304,
        "dj": 1,
        "dm": 0,
        "do": 50,
        "ec": 61,
        "eg": 216,
        "sv": 21,
        "gq": 14,
        "er": 2,
        "ee": 19,
        "et": 30,
        "fj": 3,
        "fi": 231,
        "fr": 2555,
        "ga": 12,
        "gm": 1,
        "ge": 11,
        "de": 3305,
        "gh": 18,
        "gr": 305,
        "gd": 0,
        "gt": 40,
        "gn": 4,
        "gw": 0,
        "gy": 2,
        "ht": 6,
        "hn": 15,
        "hk": 226,
        "hu": 132,
        "is": 12,
        "in": 1430,
        "id": 695,
        "ir": 337,
        "iq": 84,
        "ie": 204,
        "il": 201,
        "it": 2036,
        "jm": 13,
        "jp": 5390,
        "jo": 27,
        "kz": 129,
        "ke": 32,
        "ki": 0,
        "kr": 986,
        "undefined": 5,
        "kw": 117,
        "kg": 4,
        "la": 6,
        "lv": 23,
        "lb": 39,
        "ls": 1,
        "lr": 0,
        "ly": 77,
        "lt": 35,
        "lu": 52,
        "mk": 9,
        "mg": 8,
        "mw": 5,
        "my": 218,
        "mv": 1,
        "ml": 9,
        "mt": 7,
        "mr": 3,
        "mu": 9,
        "mx": 1004,
        "md": 5,
        "mn": 5,
        "me": 3,
        "ma": 91,
        "mz": 10,
        "mm": 35,
        "na": 11,
        "np": 15,
        "nl": 770,
        "nz": 138,
        "ni": 6,
        "ne": 5,
        "ng": 206,
        "no": 413,
        "om": 53,
        "pk": 174,
        "pa": 27,
        "pg": 8,
        "py": 17,
        "pe": 153,
        "ph": 189,
        "pl": 438,
        "pt": 223,
        "qa": 126,
        "ro": 158,
        "ru": 1476,
        "rw": 5,
        "ws": 0,
        "st": 0,
        "sa": 434,
        "sn": 12,
        "rs": 38,
        "sc": 0,
        "sl": 1,
        "sg": 217,
        "sk": 86,
        "si": 46,
        "sb": 0,
        "za": 354,
        "es": 1374,
        "lk": 48,
        "kn": 0,
        "lc": 1,
        "vc": 0,
        "sd": 65,
        "sr": 3,
        "sz": 3,
        "se": 444,
        "ch": 522,
        "sy": 59,
        "tw": 426,
        "tj": 5,
        "tz": 22,
        "th": 312,
        "tl": 0,
        "tg": 3,
        "to": 0,
        "tt": 21,
        "tn": 43,
        "tr": 729,
        "tm": 0,
        "ug": 17,
        "ua": 136,
        "ae": 239,
        "gb": 2258,
        "us": 4624,
        "uy": 40,
        "uz": 37,
        "vu": 0,
        "ve": 285,
        "vn": 101,
        "ye": 30,
        "zm": 15,
        "zw": 5
      }),
      onLabelShow: function (event, label, code) {
        if (chart_data[code] > 0) {
          label.append(': <strong>' + chart_data[code] + '</strong>');
        }
      },
    });
  });
  // @formatter:off
</script>
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    window.ApexCharts && (new ApexCharts(document.getElementById('sparkline-activity'), {
      chart: {
        type: "radialBar",
        fontFamily: 'inherit',
        height: 40,
        width: 40,
        animations: {
          enabled: false
        },
        sparkline: {
          enabled: true
        },
      },
      tooltip: {
        enabled: false,
      },
      plotOptions: {
        radialBar: {
          hollow: {
            margin: 0,
            size: '75%'
          },
          track: {
            margin: 0
          },
          dataLabels: {
            show: false
          }
        }
      },
      colors: ["#206bc4"],
      series: [35],
    })).render();
  });
  // @formatter:on
</script>
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    window.ApexCharts && (new ApexCharts(document.getElementById('chart-development-activity'), {
      chart: {
        type: "area",
        fontFamily: 'inherit',
        height: 192,
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
        name: "Purchases",
        data: [3, 5, 4, 6, 7, 5, 6, 8, 24, 7, 12, 5, 6, 3, 8, 4, 14, 30, 17, 19, 15, 14, 25, 32, 40, 55, 60, 48, 52, 70]
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
      labels: [
        '2020-06-20', '2020-06-21', '2020-06-22', '2020-06-23', '2020-06-24', '2020-06-25', '2020-06-26', '2020-06-27', '2020-06-28', '2020-06-29', '2020-06-30', '2020-07-01', '2020-07-02', '2020-07-03', '2020-07-04', '2020-07-05', '2020-07-06', '2020-07-07', '2020-07-08', '2020-07-09', '2020-07-10', '2020-07-11', '2020-07-12', '2020-07-13', '2020-07-14', '2020-07-15', '2020-07-16', '2020-07-17', '2020-07-18', '2020-07-19'
      ],
      colors: ["#206bc4"],
      legend: {
        show: false,
      },
      point: {
        show: false
      },
    })).render();
  });
  // @formatter:on
</script>
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    window.ApexCharts && (new ApexCharts(document.getElementById('sparkline-bounce-rate-1'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 24,
        animations: {
          enabled: false
        },
        sparkline: {
          enabled: true
        },
      },
      tooltip: {
        enabled: false,
      },
      stroke: {
        width: 2,
        lineCap: "round",
      },
      series: [{
        color: "#206bc4",
        data: [17, 24, 20, 10, 5, 1, 4, 18, 13]
      }],
    })).render();
  });
  // @formatter:on
</script>
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    window.ApexCharts && (new ApexCharts(document.getElementById('sparkline-bounce-rate-2'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 24,
        animations: {
          enabled: false
        },
        sparkline: {
          enabled: true
        },
      },
      tooltip: {
        enabled: false,
      },
      stroke: {
        width: 2,
        lineCap: "round",
      },
      series: [{
        color: "#206bc4",
        data: [13, 11, 19, 22, 12, 7, 14, 3, 21]
      }],
    })).render();
  });
  // @formatter:on
</script>
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    window.ApexCharts && (new ApexCharts(document.getElementById('sparkline-bounce-rate-3'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 24,
        animations: {
          enabled: false
        },
        sparkline: {
          enabled: true
        },
      },
      tooltip: {
        enabled: false,
      },
      stroke: {
        width: 2,
        lineCap: "round",
      },
      series: [{
        color: "#206bc4",
        data: [10, 13, 10, 4, 17, 3, 23, 22, 19]
      }],
    })).render();
  });
  // @formatter:on
</script>
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    window.ApexCharts && (new ApexCharts(document.getElementById('sparkline-bounce-rate-4'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 24,
        animations: {
          enabled: false
        },
        sparkline: {
          enabled: true
        },
      },
      tooltip: {
        enabled: false,
      },
      stroke: {
        width: 2,
        lineCap: "round",
      },
      series: [{
        color: "#206bc4",
        data: [6, 15, 13, 13, 5, 7, 17, 20, 19]
      }],
    })).render();
  });
  // @formatter:on
</script>
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    window.ApexCharts && (new ApexCharts(document.getElementById('sparkline-bounce-rate-5'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 24,
        animations: {
          enabled: false
        },
        sparkline: {
          enabled: true
        },
      },
      tooltip: {
        enabled: false,
      },
      stroke: {
        width: 2,
        lineCap: "round",
      },
      series: [{
        color: "#206bc4",
        data: [2, 11, 15, 14, 21, 20, 8, 23, 18, 14]
      }],
    })).render();
  });
  // @formatter:on
</script>
<script>
  // @formatter:off
  document.addEventListener("DOMContentLoaded", function () {
    window.ApexCharts && (new ApexCharts(document.getElementById('sparkline-bounce-rate-6'), {
      chart: {
        type: "line",
        fontFamily: 'inherit',
        height: 24,
        animations: {
          enabled: false
        },
        sparkline: {
          enabled: true
        },
      },
      tooltip: {
        enabled: false,
      },
      stroke: {
        width: 2,
        lineCap: "round",
      },
      series: [{
        color: "#206bc4",
        data: [22, 12, 7, 14, 3, 21, 8, 23, 18, 14]
      }],
    })).render();
  });
  // @formatter:on
</script>
</body>
</html>
