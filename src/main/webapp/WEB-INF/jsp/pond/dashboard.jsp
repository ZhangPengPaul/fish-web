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
            <h2 class="page-title">
              首页
            </h2>
          </div>
          <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
              <label class="form-check form-switch">
                <input class="form-check-input" type="checkbox" id="refresh-radio"
                       onclick="switchRefresh()"
                       <c:if test="${isSelect eq true}">checked</c:if> >
                <span class="form-check-label">轮播开关</span>
              </label>
            </div>
          </div>
        </div>
      </div>
      <div class="row row-deck row-cards">
        <div class="col-2">
          <div class="card" style="height: calc(100vh - 180px);">
            <div class="card-header">
              <h3 class="card-title">池塘列表</h3>
            </div>
            <div class="card-body card-body-scrollable card-body-scrollable-shadow">
              <c:forEach items="${pondPage}" var="pond">
                <a href="<%=path%>/pond/dashboard?pondId=${pond.pondId}"
                   class="card text-center <c:if test="${pond.pondId eq pondDetail.pondId}">card-active</c:if>">
                  <div class="card-body">
                    <div class="list-group list-group-flush">
                      <div class="list-group-item">
                        <div class="row align-items-center">
                          <div class="col">
                              ${pond.name}
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </a>
              </c:forEach>
            </div>
          </div>
        </div>
        <div class="col-6">
          <div class="card" style="height: calc(100vh - 180px);">
            <div class="card-body" id="map"></div>
          </div>
        </div>
        <div class="col-4">
          <div class="card">
            <div class="card-body card-body-scrollable card-body-scrollable-shadow">
              <div class="card">
                <div class="card-header">
                  <h4>基本信息</h4>
                </div>
                <div class="row">
                  <div class="col-4">
                    <div class="card">
                      <div class="card-body">
                        <div class="row align-items-center">
                          <div class="col-auto">
                          <span class="bg-blue text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                                                       width="24" height="24" viewBox="0 0 24 24"
                                                                       stroke-width="2" stroke="currentColor"
                                                                       fill="none" stroke-linecap="round"
                                                                       stroke-linejoin="round"><path stroke="none"
                                                                                                     d="M0 0h24v24H0z"
                                                                                                     fill="none"/><polyline
                            points="6 21 21 6 18 3 3 18 6 21"/><line x1="15" y1="6" x2="18" y2="9"/><path
                            d="M9 3a2 2 0 0 0 2 2a2 2 0 0 0 -2 2a2 2 0 0 0 -2 -2a2 2 0 0 0 2 -2"/><path
                            d="M19 13a2 2 0 0 0 2 2a2 2 0 0 0 -2 2a2 2 0 0 0 -2 -2a2 2 0 0 0 2 -2"/></svg>
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
                  </div>
                  <div class="col-4">
                    <div class="card">
                      <div class="card-body">
                        <div class="row align-items-center">
                          <div class="col-auto">
                          <span class="bg-blue text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                                                       width="24" height="24" viewBox="0 0 24 24"
                                                                       stroke-width="2" stroke="currentColor"
                                                                       fill="none" stroke-linecap="round"
                                                                       stroke-linejoin="round"><path stroke="none"
                                                                                                     d="M0 0h24v24H0z"
                                                                                                     fill="none"/><circle
                            cx="9.5" cy="9.5" r="6.5"/><rect x="10" y="10" width="11" height="11" rx="2"/></svg>
                          </span>
                          </div>
                          <div class="col">
                            <div class="font-weight-medium">
                              ${pondDetail.area}亩
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-4">
                    <div class="card">
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
                              N/A
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>实时水质</h4>
                </div>
                <div class="row">
                  <div class="col-4">
                    <div class="card">
                      <div class="card-body">
                        <div class="row align-items-center">
                          <div class="col-auto">
                          <span class="bg-green text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                                                        width="24" height="24" viewBox="0 0 24 24"
                                                                        stroke-width="2" stroke="currentColor"
                                                                        fill="none" stroke-linecap="round"
                                                                        stroke-linejoin="round"><path stroke="none"
                                                                                                      d="M0 0h24v24H0z"
                                                                                                      fill="none"/><path
                            d="M10 13.5a4 4 0 1 0 4 0v-8.5a2 2 0 0 0 -4 0v8.5"/><line x1="10" y1="9" x2="14"
                                                                                      y2="9"/></svg>
                          </span>
                          </div>
                          <div class="col">
                            <div class="font-weight-medium">
                              温度
                            </div>
                            <div class="h1 mb-0 me-2 text-green">
                              <fmt:formatNumber type="number" value="${tsData.records[0].temp}"
                                                maxFractionDigits="1"/>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-4">
                    <div class="card">
                      <div class="card-body">
                        <div class="row align-items-center">
                          <div class="col-auto">
                          <span class="bg-green text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                                                        width="24" height="24" viewBox="0 0 24 24"
                                                                        stroke-width="2" stroke="currentColor"
                                                                        fill="none" stroke-linecap="round"
                                                                        stroke-linejoin="round"><path stroke="none"
                                                                                                      d="M0 0h24v24H0z"
                                                                                                      fill="none"/><circle
                            cx="6" cy="16" r="3"/><circle cx="16" cy="19" r="2"/><circle cx="14.5" cy="7.5"
                                                                                         r="4.5"/></svg>
                          </span>
                          </div>
                          <div class="col">
                            <div class="font-weight-medium">
                              溶氧量
                            </div>
                            <div class="h1 mb-0 me-2 text-green">
                              <fmt:formatNumber type="number" value="${tsData.records[0].oxygen}"
                                                maxFractionDigits="1"/>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-4">
                    <div class="card">
                      <div class="card-body">
                        <div class="row align-items-center">
                          <div class="col-auto">
                          <span class="bg-green text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                                                        width="24" height="24" viewBox="0 0 24 24"
                                                                        stroke-width="2" stroke="currentColor"
                                                                        fill="none" stroke-linecap="round"
                                                                        stroke-linejoin="round"><path stroke="none"
                                                                                                      d="M0 0h24v24H0z"
                                                                                                      fill="none"/><path
                            d="M7 20v-16h5.5a4 4 0 0 1 0 9h-5.5"/></svg>
                          </span>
                          </div>
                          <div class="col">
                            <div class="font-weight-medium">
                              PH
                            </div>
                            <div class="h1 mb-0 me-2 text-green">
                              <fmt:formatNumber type="number" value="${tsData.records[0].ph}"
                                                maxFractionDigits="1"/>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>智能开关</h4>
                </div>
                <div class="row">
                  <c:forEach items="${prodDevices}" var="prodDevice">
                    <div class="col-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="row align-items-center">
                            <div class="col-auto">
                          <span class="bg-blue text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                                                       width="24" height="24" viewBox="0 0 24 24"
                                                                       stroke-width="2" stroke="currentColor"
                                                                       fill="none" stroke-linecap="round"
                                                                       stroke-linejoin="round"><path stroke="none"
                                                                                                     d="M0 0h24v24H0z"
                                                                                                     fill="none"/><path
                            d="M12 12c2.76 0 5 -2.01 5 -4.5s-2.24 -4.5 -5 -4.5v9z"/><path
                            d="M12 12c0 2.76 2.01 5 4.5 5s4.5 -2.24 4.5 -5h-9z"/><path
                            d="M12 12c-2.76 0 -5 2.01 -5 4.5s2.24 4.5 5 4.5v-9z"/><path
                            d="M12 12c0 -2.76 -2.01 -5 -4.5 -5s-4.5 2.24 -4.5 5h9z"/></svg>
                          </span>
                            </div>
                            <div class="col">
                              <div class="font-weight-medium">
                                  ${prodDevice.name}
                              </div>
                              <div class="row">
                                <a href="/pond/config/1361230754313998338" class="btn btn-primary w-30">
                                  <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                                       viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                       stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <path
                                      d="M10.325 4.317c.426 -1.756 2.924 -1.756 3.35 0a1.724 1.724 0 0 0 2.573 1.066c1.543 -.94 3.31 .826 2.37 2.37a1.724 1.724 0 0 0 1.065 2.572c1.756 .426 1.756 2.924 0 3.35a1.724 1.724 0 0 0 -1.066 2.573c.94 1.543 -.826 3.31 -2.37 2.37a1.724 1.724 0 0 0 -2.572 1.065c-.426 1.756 -2.924 1.756 -3.35 0a1.724 1.724 0 0 0 -2.573 -1.066c-1.543 .94 -3.31 -.826 -2.37 -2.37a1.724 1.724 0 0 0 -1.065 -2.572c-1.756 -.426 -1.756 -2.924 0 -3.35a1.724 1.724 0 0 0 1.066 -2.573c-.94 -1.543 .826 -3.31 2.37 -2.37c1 .608 2.296 .07 2.572 -1.065z"></path>
                                    <circle cx="12" cy="12" r="3"></circle>
                                  </svg>
                                  开
                                </a>
                              </div>
                              <div class="row">
                                <a href="/pond/config/1361230754313998338" class="btn btn-primary w-30">
                                  <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                                       viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                       stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <path
                                      d="M10.325 4.317c.426 -1.756 2.924 -1.756 3.35 0a1.724 1.724 0 0 0 2.573 1.066c1.543 -.94 3.31 .826 2.37 2.37a1.724 1.724 0 0 0 1.065 2.572c1.756 .426 1.756 2.924 0 3.35a1.724 1.724 0 0 0 -1.066 2.573c.94 1.543 -.826 3.31 -2.37 2.37a1.724 1.724 0 0 0 -2.572 1.065c-.426 1.756 -2.924 1.756 -3.35 0a1.724 1.724 0 0 0 -2.573 -1.066c-1.543 .94 -3.31 -.826 -2.37 -2.37a1.724 1.724 0 0 0 -1.065 -2.572c-1.756 -.426 -1.756 -2.924 0 -3.35a1.724 1.724 0 0 0 1.066 -2.573c-.94 -1.543 .826 -3.31 2.37 -2.37c1 .608 2.296 .07 2.572 -1.065z"></path>
                                    <circle cx="12" cy="12" r="3"></circle>
                                  </svg>
                                  开
                                </a>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </c:forEach>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>任务统计</h4>
                </div>
                <div class="row">
                  <div class="col-4">
                    <div class="card">
                      <div class="card-body">
                        <div class="row align-items-center">
                          <div class="col-auto">
                          <span class="bg-blue text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                                                       width="24" height="24" viewBox="0 0 24 24"
                                                                       stroke-width="2" stroke="currentColor"
                                                                       fill="none" stroke-linecap="round"
                                                                       stroke-linejoin="round"><path stroke="none"
                                                                                                     d="M0 0h24v24H0z"
                                                                                                     fill="none"/><path
                            d="M3.5 5.5l1.5 1.5l2.5 -2.5"/><path d="M3.5 11.5l1.5 1.5l2.5 -2.5"/><path
                            d="M3.5 17.5l1.5 1.5l2.5 -2.5"/><line x1="11" y1="6" x2="20" y2="6"/><line x1="11" y1="12"
                                                                                                       x2="20" y2="12"/><line
                            x1="11" y1="18" x2="20" y2="18"/></svg>
                          </span>
                          </div>
                          <div class="col">
                            <div class="font-weight-medium">
                              已发布
                            </div>
                            <div class="h1 mb-0 me-2 text-azure">
                              10
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-4">
                    <div class="card">
                      <div class="card-body">
                        <div class="row align-items-center">
                          <div class="col-auto">
                          <span class="bg-blue text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                                                       width="24" height="24" viewBox="0 0 24 24"
                                                                       stroke-width="2" stroke="currentColor"
                                                                       fill="none" stroke-linecap="round"
                                                                       stroke-linejoin="round"><path stroke="none"
                                                                                                     d="M0 0h24v24H0z"
                                                                                                     fill="none"/><path
                            d="M3.5 5.5l1.5 1.5l2.5 -2.5"/><path d="M3.5 11.5l1.5 1.5l2.5 -2.5"/><path
                            d="M3.5 17.5l1.5 1.5l2.5 -2.5"/><line x1="11" y1="6" x2="20" y2="6"/><line x1="11" y1="12"
                                                                                                       x2="20" y2="12"/><line
                            x1="11" y1="18" x2="20" y2="18"/></svg>
                          </span>
                          </div>
                          <div class="col">
                            <div class="font-weight-medium">
                              进行中
                            </div>
                            <div class="h1 mb-0 me-2 text-facebook">
                              5
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-4">
                    <div class="card">
                      <div class="card-body">
                        <div class="row align-items-center">
                          <div class="col-auto">
                          <span class="bg-blue text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"
                                                                       width="24" height="24" viewBox="0 0 24 24"
                                                                       stroke-width="2" stroke="currentColor"
                                                                       fill="none" stroke-linecap="round"
                                                                       stroke-linejoin="round"><path stroke="none"
                                                                                                     d="M0 0h24v24H0z"
                                                                                                     fill="none"/><path
                            d="M3.5 5.5l1.5 1.5l2.5 -2.5"/><path d="M3.5 11.5l1.5 1.5l2.5 -2.5"/><path
                            d="M3.5 17.5l1.5 1.5l2.5 -2.5"/><line x1="11" y1="6" x2="20" y2="6"/><line x1="11" y1="12"
                                                                                                       x2="20" y2="12"/><line
                            x1="11" y1="18" x2="20" y2="18"/></svg>
                          </span>
                          </div>
                          <div class="col">
                            <div class="font-weight-medium">
                              已完成
                            </div>
                            <div class="h1 mb-0 me-2 text-green">
                              20
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@include file="../common/footer.jsp" %>
  </div>
</div>
<div class="modal modal-blur fade" id="modal-camera" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">监控</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                onclick="closeCramera()"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
          <div id="myPlayer"></div>
        </div>
      </div>
      <div class="modal-footer">
        <a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal" onclick="closeCramera()">
          关闭
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
<script src="<%=path%>/dist/js/ezuikit.js"></script>
<script type="application/javascript">
  AMapLoader.load({
    "key": "f824b2bfc96d319950893291586c3600",              // 申请好的Web端开发者Key，首次调用 load 时必填
    "version": "2.0",   // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
    "plugins": ['AMap.Scale', 'AMap.ToolBar', 'AMap.MouseTool'],      // 需要使用的的插件列表，如比例尺'AMap.Scale'等
    "AMapUI": {             // 是否加载 AMapUI，缺省不加载
      "version": '1.1',   // AMapUI 缺省 1.1
      "plugins": ['overlay/SimpleMarker'],       // 需要加载的 AMapUI ui插件
    }
  }).then((AMap) => {

    function getCenterPoint(data) {
      var lng = 0.0, lat = 0.0;
      for (var i = 0; i < data.length; i++) {
        if ($.isEmptyObject(data[i])) {
          continue;
        }
        lng = lng + parseFloat(data[i]['lng']);
        lat = lat + parseFloat(data[i]['lat']);
      }
      lng = lng / data.length;
      lat = lat / data.length;
      return {'lng': lng, 'lat': lat};
    }


    var map = new AMap.Map('map', {
      zoom: 17
    });
    map.addControl(new AMap.Scale());
    var satelliteLayer = new AMap.TileLayer.Satellite();
    map.add(satelliteLayer);

    var indexs = ${pondDetail.outline};
    var centerPoint = getCenterPoint(indexs);
    var center = new AMap.LngLat(centerPoint.lng, centerPoint.lat);
    map.setCenter(center);

    var path = [];
    indexs.forEach((item, index, array) => {
      path.push(new AMap.LngLat(item.lng, item.lat));
    });
    var polygon = new AMap.Polygon({
      path: path,
      fillColor: '#3d5d93', // 多边形填充颜色
      borderWeight: 1, // 线条宽度，默认为 1
      strokeColor: '#287c95', // 线条颜色
    });
    map.add(polygon);

    // 创建一个 Marker 实例：
    var marker = new AMap.Marker({
      position: new AMap.LngLat(centerPoint.lng, centerPoint.lat),   // 经纬度对象，也可以是经纬度构成的一维数组[116.39, 39.9]
      title: '${pondDetail.name}'
    })
    map.remove(marker);
    map.add(marker);

    marker.on('click', clickMarker);

  }).catch((e) => {
    console.error(e);  //加载错误提示
  });

  var player;

  function clickMarker() {
    var modal = $("#modal-camera");
    modal.modal("show")
    player = new EZUIPlayer({
      id: 'myPlayer',
      url: 'ezopen://open.ys7.com/F43323849/1.hd.live',
      autoplay: true,
      accessToken: "at.1fscvppp9cmd71hu8t0xr5q90g9r0xd3-2kqgms1bmp-0abqw6m-4ih0nqfp3",
      decoderPath: '<%=path%>/dist',
      width: 600,
      height: 400
    });
  }

  function closeCramera() {
    var modal = $("#modal-camera");
    modal.modal("hide");
    player.stop();

  }
</script>
<script type="application/javascript">
  var timeId;

  var isSelected = $("#refresh-radio").prop("checked");

  function refresh(s) {
    timeId = window.setTimeout(function () {
      console.log(s);
      window.location.href = "<%=path%>/pond/dashboard?pondId=" + pondIndexId + "&index=${index}&isSelect=" + s;
    }, 20000);
  }

  var pondIndexId = "${pondPage[index].pondId}";
  if (isSelected) {
    refresh(isSelected);
  }

  function switchRefresh() {
    isSelected = $("#refresh-radio").prop("checked");
    if (isSelected) {
      refresh(isSelected);
    } else {
      window.clearTimeout(timeId);
    }
  }
</script>
</body>
</html>
