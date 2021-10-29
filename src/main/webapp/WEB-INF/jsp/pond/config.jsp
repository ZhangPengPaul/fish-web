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
                  <h3 class="card-title">生产设备</h3>
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
                    <c:forEach items="${prodDevices}" var="prodDevice">
                      <tr>
                        <td><span class="text-muted">${prodDevice.name}</span></td>
                        <td>${prodDevice.type}</td>
                        <td>${prodDevice.memo}</td>
                        <td class="text-end">
                          <a href="javascript:;"
                             onclick="deleteDevice('${prodDevice.deviceId}','${pondDetail.pondId}')" class=" btn btn-red
                             w-30">
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
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">监测设备</h3>
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
                    <c:forEach items="${sensorDevices}" var="sensor">
                      <tr>
                        <td><span class="text-muted">${sensor.name}</span></td>
                        <td>${sensor.type}</td>
                        <td>${sensor.memo}</td>
                        <td class="text-end">
                          <a href="javascript:;" onclick="deleteDevice('${sensor.deviceId}','${pondDetail.pondId}')"
                             class="btn btn-red w-30">
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
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">DTU</h3>
                </div>
                <div class="table-responsive">
                  <table class="table card-table table-vcenter text-nowrap datatable">
                    <thead>
                    <tr>
                      <th>DTU编号</th>
                      <th>备注信息</th>
                      <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${dtuList}" var="dtu">
                      <tr>
                        <td><span class="text-muted">${dtu.code}</span></td>
                        <td>${dtu.memo}</td>
                        <td class="text-end">
                          <a href="javascript:;" onclick="deleteDtu('${dtu.dtuId}','${pondDetail.pondId}')"
                             class="btn btn-red w-30">
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
                    </c:forEach>
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
        <h5 class="modal-title">新DTU</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
          <label class="form-label required">DTU编号</label>
          <input type="text" class="form-control" name="dtu-code" id="dtu-code" placeholder="DTU的编号">
          <div class="invalid-feedback">DTU编号不能为空</div>
        </div>
        <div class="mb-3">
          <div class="col-12">
            <div>
              <label class="form-label">DTU类型</label>
              <select class="form-select form-control" name="dtu-type" id="dtu-type">
                <option value="1">控制设备</option>
                <option value="2">三项传感器</option>
                <option value="3">两项传感器</option>
                <option value="4">新</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div>
              <label class="form-label">附加信息</label>
              <textarea class="form-control" rows="3" name="dtu-memo" id="dtu-memo"></textarea>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">
          取消
        </a>
        <a href="javascript:;" onclick="addDtu()" class="btn btn-primary ms-auto">
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
          <label class="form-label required">设备名称</label>
          <input type="text" class="form-control" name="device-name" id="device-name" placeholder="设备的编号">
          <div class="invalid-feedback">设备名称不能为空</div>
        </div>
        <div class="mb-3">
          <div class="col-12">
            <div>
              <label class="form-label">设备类型</label>
              <select class="form-select form-control" name="device-type" id="device-type">
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
              <select class="form-select" name="device-dtu" id="device-dtu">
                <c:forEach items="${dtuList}" var="dtu">
                  <option value="${dtu.dtuId}">${dtu.code}</option>
                </c:forEach>
              </select>
            </div>
          </div>
        </div>
        <div class="mb-3">
          <div class="col-12">
            <div>
              <label class="form-label required">DTU通道号</label>
              <input type="text" class="form-control" name="dtu-channel" id="dtu-channel" placeholder="DTU通道号">
              <div class="invalid-feedback">DTU通道号不能为空</div>
            </div>
          </div>
        </div>
        <div class="mb-3">
          <div class="col-lg-12">
            <div>
              <label class="form-label">附加信息</label>
              <textarea class="form-control" rows="3" name="device-memo" id="device-memo"></textarea>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">
          取消
        </a>
        <a href="javascript:;" class="btn btn-primary ms-auto" onclick="addDevice()">
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
<script type="text/javascript">
  function addDtu() {
    $("#dtu-code").removeClass("is-invalid");
    var url = "<%=path%>/dtu/add";
    var data = {
      "code": "",
      "memo": "",
      "pondId": "",
      "dtuType": ""
    };

    var code = $("#dtu-code").val();
    var memo = $("#dtu-memo").val();
    var pondId = "${pondDetail.pondId}";
    var dtyType = $("#dtu-type").val();


    if (code.trim() === "") {
      $("#dtu-code").addClass("is-invalid");
      return;
    }

    data.code = code;
    data.memo = memo;
    data.pondId = pondId;
    data.dtuType = dtyType;

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
          window.location.href = "<%=path%>/pond/config/${pondDetail.pondId}";
        }

      });
  }

  function addDevice() {
    var url = "<%=path%>/device/add";
    var data = {
      "name": "",
      "type": "",
      "dtuId": "",
      "dtuChannel": "",
      "pondId": "",
      "memo": ""
    }

    var name = $("#device-name").val();
    var type = $("#device-type").val();
    var dtuId = $("#device-dtu").val();
    var dtuChannel = $("#dtu-channel").val();
    var pondId = "${pondDetail.pondId}";
    var memo = $("#device-memo").val();

    if (name.trim() === "") {
      $("#device-name").addClass("is-invalid");
      return;
    }

    if (dtuChannel.trim() === "") {
      $("#dtu-channel").addClass("is-invalid");
      return;
    }

    data.name = name;
    data.type = type;
    data.dtuId = dtuId;
    data.dtuChannel = dtuChannel;
    data.pondId = pondId;
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
          window.location.href = "<%=path%>/pond/config/${pondDetail.pondId}";
        }
      });
  }

  function deleteDevice(deviceId, pondId) {
    var url = "<%=path%>/device/delete?deviceId=" + deviceId + "&pondId=" + pondId;
    fetch(url, {
      method: "POST"
    }).then(res => res.json())
      .catch(error => console.error("Error:", error))
      .then(response => {
        console.log("Success:", response);
        if (response.code !== 200) {
          $("#error-alert").removeClass("visually-hidden");
        } else {
          window.location.href = "<%=path%>/pond/config/${pondDetail.pondId}";
        }
      });
  }

  function deleteDtu(dtuId, pondId) {
    var url = "<%=path%>/dtu/delete?dtuId=" + dtuId + "&pondId=" + pondId;
    fetch(url, {
      method: "POST"
    }).then(res => res.json())
      .catch(error => console.error("Error:", error))
      .then(response => {
        console.log("Success:", response);
        if (response.code !== 200) {
          $("#error-alert").removeClass("visually-hidden");
        } else {
          window.location.href = "<%=path%>/pond/config/${pondDetail.pondId}";
        }
      });
  }
</script>
</body>
</html>
