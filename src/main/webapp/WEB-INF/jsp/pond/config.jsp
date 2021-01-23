<%@include file="../common/common.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <title>编辑池塘</title>
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
            <div class="mb-1">
              <ol class="breadcrumb breadcrumb-alternate" aria-label="breadcrumbs">
                <li class="breadcrumb-item"><a href="<%=path%>/pond/list">池塘管理</a></li>
                <li class="breadcrumb-item">编辑池塘</li>
                <li class="breadcrumb-item active" aria-current="page">${pondDetail.name}</li>
              </ol>
            </div>
            <h2 class="page-title">
              ${pondDetail.name}
            </h2>
          </div>
          <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
              <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal"
                 data-bs-target="#modal-dtu">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                     viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                     stroke-linecap="round" stroke-linejoin="round">
                  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                  <line x1="12" y1="5" x2="12" y2="19"></line>
                  <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
                添加DTU
              </a>
              <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal"
                 data-bs-target="#modal-device">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                     viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                     stroke-linecap="round" stroke-linejoin="round">
                  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                  <line x1="12" y1="5" x2="12" y2="19"></line>
                  <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
                添加设备
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="row row-deck row-cards">
        <div class="col-8">
          <div class="row row-cards">
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
                  <h3 class="card-title">控制设备</h3>
                </div>
                <div class="table-responsive">
                  <table class="table card-table table-vcenter text-nowrap datatable">
                    <thead>
                    <tr>
                      <th>设备名称</th>
                      <th>设备类型</th>
                      <th>备注信息</th>
                      <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                      <td><span class="text-muted">增氧机</span></td>
                      <td><a href="<%=path%>/pond/config" class="text-reset" tabindex="-1">增氧机</a>
                      </td>
                      <td>
                        增氧机
                      </td>
                      <td class="text-end">
                        <a href="<%=path%>/pond/config" class="btn btn-red w-30">
                          <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
                               height="24" viewBox="0 0 24 24" stroke-width="2"
                               stroke="currentColor" fill="none" stroke-linecap="round"
                               stroke-linejoin="round">
                            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                            <line x1="4" y1="7" x2="20" y2="7"/>
                            <line x1="10" y1="11" x2="10" y2="17"/>
                            <line x1="14" y1="11" x2="14" y2="17"/>
                            <path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12"/>
                            <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3"/>
                          </svg>
                          删除
                        </a>

                      </td>
                    </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">传感设备</h3>
                </div>
                <div class="table-responsive">
                  <table class="table card-table table-vcenter text-nowrap datatable">
                    <thead>
                    <tr>
                      <th>设备编号</th>
                      <th>设备名称</th>
                      <th>备注信息</th>
                      <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                      <td><span class="text-muted">10000001</span></td>
                      <td><a href="<%=path%>/pond/config" class="text-reset" tabindex="-1">传感器</a>
                      </td>
                      <td>
                        传感器
                      </td>
                      <td class="text-end">
                        <a href="<%=path%>/pond/config" class="btn btn-red w-30">
                          <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
                               height="24" viewBox="0 0 24 24" stroke-width="2"
                               stroke="currentColor" fill="none" stroke-linecap="round"
                               stroke-linejoin="round">
                            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                            <line x1="4" y1="7" x2="20" y2="7"/>
                            <line x1="10" y1="11" x2="10" y2="17"/>
                            <line x1="14" y1="11" x2="14" y2="17"/>
                            <path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12"/>
                            <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3"/>
                          </svg>
                          删除
                        </a>

                      </td>
                    </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">浮标位置</h3>
            </div>
            <div class="card-body" id="map"></div>
          </div>
        </div>
      </div>
    </div>
    <%@include file="../common/footer.jsp" %>
  </div>
</div>
<div class="modal modal-blur fade" id="modal-dtu" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">新DTU</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
          <label class="form-label">DTU编号</label>
          <input type="text" class="form-control" name="example-text-input" placeholder="DTU的编号">
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div>
              <label class="form-label">附加信息</label>
              <textarea class="form-control" rows="3"></textarea>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">
          取消
        </a>
        <a href="#" class="btn btn-primary ms-auto" data-bs-dismiss="modal">
          <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
               stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
               stroke-linejoin="round">
            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
            <line x1="12" y1="5" x2="12" y2="19"/>
            <line x1="5" y1="12" x2="19" y2="12"/>
          </svg>
          添加DTU
        </a>
      </div>
    </div>
  </div>
</div>
<div class="modal modal-blur fade" id="modal-device" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">新设备</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
          <label class="form-label">设备名称</label>
          <input type="text" class="form-control" name="example-text-input" placeholder="设备的编号">
        </div>
        <div class="mb-3">
          <div class="col-12">
            <div>
              <label class="form-label">设备类型</label>
              <select class="form-select form-control">
                <option value="1">生产设备</option>
                <option value="2">监测设备</option>
              </select>
            </div>
          </div>
        </div>
        <div class="mb-3">
          <div class="col-12">
            <div>
              <label class="form-label">关联DTU</label>
              <select class="form-select">
                <option value="1">crab01</option>
                <option value="2">crab02</option>
              </select>
            </div>
          </div>
        </div>
        <div class="mb-3">
          <div class="col-12">
            <div>
              <label class="form-label">DTU通道号</label>
              <input type="text" class="form-control" name="example-text-input" placeholder="DTU通道号">
            </div>
          </div>
        </div>
        <div class="mb-3">
          <div class="col-lg-12">
            <div>
              <label class="form-label">附加信息</label>
              <textarea class="form-control" rows="3"></textarea>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">
          取消
        </a>
        <a href="#" class="btn btn-primary ms-auto" data-bs-dismiss="modal">
          <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
               stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
               stroke-linejoin="round">
            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
            <line x1="12" y1="5" x2="12" y2="19"/>
            <line x1="5" y1="12" x2="19" y2="12"/>
          </svg>
          添加设备
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
<script>
  $("document").ready(function () {
    $("#page-index").removeClass("active");
    $("#page-pond").addClass("active");
  });
</script>
<script type="text/javascript">
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

    var indexs = ${pondDetail.outline};
    var center = new AMap.LngLat(indexs[0].lng, indexs[0].lat);
    map.setCenter(center);
    var path = [];
    indexs.forEach((item, index, array) => {
      path.push(new AMap.LngLat(item.lng, item.lat));
    });

    var polygon = new AMap.Polygon({
      path: path,
      fillColor: '#00b0ff', // 多边形填充颜色
      borderWeight: 1, // 线条宽度，默认为 1
      strokeColor: '#80d8ff', // 线条颜色
    });

    map.add(polygon);

  }).catch((e) => {
    console.error(e);  //加载错误提示
  });
</script>
</body>
</html>
