<%@include file="../common/common.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <title>首页</title>
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

      <div class="row row-deck row-cards">

        <div class="col-12">
          <div class="card" style="height: calc(100vh - 180px);">
            <div class="card-body" id="map"></div>
          </div>
        </div>

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
<script src="<%=path%>/dist/js/ezui/ezuikit.js"></script>
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
      zoom: 16.5
    });
    map.addControl(new AMap.Scale());
    var satelliteLayer = new AMap.TileLayer.Satellite();
    map.add(satelliteLayer);

    var markers = [];
    var layer = new AMap.LabelsLayer({
      zooms: [3, 20],
      zIndex: 1000,
      collision: false,
      allowCollision: false,
    });

    layer.add(markers);
    // 图层添加到地图
    map.add(layer);

    <c:forEach items="${pondPage}" var="pondDetail" varStatus="stat">
    var indexs = ${pondDetail.outline};
    var centerPoint = getCenterPoint(indexs);
    var center = new AMap.LngLat(centerPoint.lng, centerPoint.lat);
    <c:if test="${stat.last}">
    console.log("set center");
    map.setCenter(center);
    </c:if>

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

    var marker = new AMap.LabelMarker({
      name: "aa",
      position: [centerPoint.lng, centerPoint.lat],
      zIndex: 10,
      text: {
        content: '${pondDetail.name}',
        direction: 'center'
        // style: textStyle,
      }
    });
    var marker2 = new AMap.LabelMarker({
      name: "bb",
      position: [centerPoint.lng, centerPoint.lat],
      zIndex: 10,
      text: {
        content: '${pondDetail.name}',
        direction: 'center'
        // style: textStyle,
      }
    });
    markers.push(marker);
    markers.push(marker2);

    </c:forEach>
    layer.add(markers);


  }).catch((e) => {
    console.error(e);  //加载错误提示
  });

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

  function deviceControl(action, deviceId) {
    var url = "<%=path%>/remote-device/control?action=" + action + "&deviceId=" + deviceId;

    fetch(url, {
      method: "GET",
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
          alert("控制成功")
        }
      });
  }
</script>
</body>
</html>
