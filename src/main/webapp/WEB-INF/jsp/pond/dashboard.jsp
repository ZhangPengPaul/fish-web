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
        <div class="col-3">
          <div class="card" style="height: calc(100vh - 180px);">
            <div class="card-body card-body-scrollable card-body-scrollable-shadow">
              <div class="card">
                <div class="card-header">
                  <h4>今日任务</h4>
                </div>
                <div class="row row-deck row-cards">
                  <div class="col">
                    <div class="card">
                      <div class="card-body">
                        <div class="col">
                          <div class="d-flex align-items-center">
                            <div class="h4 font-weight-bold text-green">日常施肥</div>
                            <div class="ms-auto lh-1">
                              <div class="text-muted">2021-03-31</div>
                            </div>
                          </div>
                          <div class="h5 mb-3">全塘 100%</div>
                          <span class="badge bg-green-lt font-weight-bold">VC+硅藻 300KG</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row row-deck row-cards">
                  <div class="col">
                    <div class="card">
                      <div class="card-body">
                        <div class="d-flex align-items-center">
                          <div class="h4 font-weight-bold text-yellow">日常投喂</div>
                          <div class="ms-auto lh-1">
                            <div class="text-muted">2021-03-31</div>
                          </div>
                        </div>
                        <div class="h5 mb-3">日常投喂量 10%</div>
                        <span class="badge bg-yellow-lt font-weight-bold">饲料 60KG</span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row row-deck row-cards">
                  <div class="col">
                    <div class="card">
                      <div class="card-body">
                        <div class="d-flex align-items-center">
                          <div class="h4 font-weight-bold text-azure">消毒</div>
                          <div class="ms-auto lh-1">
                            <div class="text-muted">2021-03-31</div>
                          </div>
                        </div>
                        <div class="h5 mb-3">全塘 100%</div>
                        <span class="badge bg-azure-lt font-weight-bold">蟹安康15%浓度，200KG</span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row row-deck row-cards">
                  <div class="col">
                    <div class="card">
                      <div class="card-body">
                        <div class="d-flex align-items-center">
                          <div class="h4 font-weight-bold text-cyan">增氧</div>
                          <div class="ms-auto lh-1">
                            <div class="text-muted">2021-03-31</div>
                          </div>
                        </div>
                        <div class="h5 mb-3">全塘 100%</div>
                        <span class="badge bg-cyan-lt font-weight-bold">持续供氧</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <h4>养殖模型</h4>
                </div>
                <div class="row">

                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card" style="height: calc(100vh - 180px);">
            <div class="card-body" id="map"></div>
          </div>
        </div>
        <div class="col-3">
          <div class="card" style="height: calc(100vh - 180px);">
            <div class="card-body card-body-scrollable card-body-scrollable-shadow">
              <div class="card">
                <div class="card-header">
                  <h4>视频监控</h4>
                </div>
                <div class="card-body">
                  <iframe
                    src="https://open.ys7.com/ezopen/h5/iframe?url=ezopen://open.ys7.com/F43323849/1.live&autoplay=1&audio=1&accessToken=${ysToken.accessToken}&templete=0"
                    width="300"
                    height="200"
                    id="ysOpenDevice"
                    scrolling="no"
                    allowfullscreen
                  >
                  </iframe>
                </div>
              </div>
              <c:forEach items="${dtus}" var="dtu">
                <div class="card">
                  <div class="card-header">
                    <c:choose>
                      <c:when test="${dtu.dtuType == 1}">
                        <h4>智能开关</h4>
                      </c:when>
                      <c:otherwise>
                        <h4>实时水质</h4>
                      </c:otherwise>
                    </c:choose>
                  </div>
                  <c:choose>
                    <c:when test="${dtu.dtuType == 1}">
                      <div class="row">
                        <c:forEach items="${prodDevices}" var="prodDevice">
                          <div class="col-auto">
                            <div class="card">
                              <div class="card-body">
                                <div class="row align-items-center">
                                  <div class="col-auto">
                                                        <span class="bg-blue text-white avatar"><svg
                                                          xmlns="http://www.w3.org/2000/svg" class="icon"
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
                                  <div class="col-auto">
                                    <div class="font-weight-medium">
                                        ${prodDevice.name}
                                    </div>
                                    <div class="row">
                                      <div class="col-auto">
                                        <a href="/pond/config/1361230754313998338" class="btn btn-primary w-30">
                                          <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                                               viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                               stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                            <polyline points="13 3 13 10 19 10 11 21 11 14 5 14 13 3"/>
                                          </svg>
                                          开
                                        </a>
                                      </div>
                                      <div class="col-auto">
                                        <a href="/pond/config/1361230754313998338" class="btn btn-secondary w-30">
                                          <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                                               viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                               stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                            <line x1="3" y1="3" x2="21" y2="21"/>
                                            <path
                                              d="M15.212 15.21l-4.212 5.79v-7h-6l3.79 -5.21m1.685 -2.32l2.525 -3.47v6m1 1h5l-2.104 2.893"/>
                                          </svg>
                                          关
                                        </a>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </c:forEach>
                      </div>
                    </c:when>
                    <c:when test="${dtu.dtuType == 2}">
                      <div class="row">
                        <div class="col-4">
                          <div class="card">
                            <div class="card-body">
                              <div class="row align-items-center">
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
                    </c:when>
                    <c:otherwise>
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
                            d="M7 20v-16l10 16v-16"/></svg>
                          </span>
                                </div>
                                <div class="col">
                                  <div class="font-weight-medium">
                                    氨氮
                                  </div>
                                  <div class="h1 mb-0 me-2 text-green">
                                    <fmt:formatNumber type="number" value="${tsDataN.records[0].nh4n}"
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
                            d="M18 9a5 5 0 0 0 -5 -5h-2a5 5 0 0 0 -5 5v6a5 5 0 0 0 5 5h2a5 5 0 0 0 5 -5"/></svg>
                          </span>
                                </div>
                                <div class="col">
                                  <div class="font-weight-medium">
                                    COD
                                  </div>
                                  <div class="h1 mb-0 me-2 text-green">
                                    <fmt:formatNumber type="number" value="${tsDataC.records[0].cod}"
                                                      maxFractionDigits="1"/>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:otherwise>
                  </c:choose>
                </div>
              </c:forEach>
              <%--              <div class="card">--%>
              <%--                <div class="card-header">--%>
              <%--                  <h4>任务统计</h4>--%>
              <%--                </div>--%>
              <%--                <div class="row">--%>
              <%--                  <div class="col-4">--%>
              <%--                    <div class="card">--%>
              <%--                      <div class="card-body">--%>
              <%--                        <div class="row align-items-center">--%>
              <%--                          <div class="col-auto">--%>
              <%--                          <span class="bg-blue text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"--%>
              <%--                                                                       width="24" height="24" viewBox="0 0 24 24"--%>
              <%--                                                                       stroke-width="2" stroke="currentColor"--%>
              <%--                                                                       fill="none" stroke-linecap="round"--%>
              <%--                                                                       stroke-linejoin="round"><path stroke="none"--%>
              <%--                                                                                                     d="M0 0h24v24H0z"--%>
              <%--                                                                                                     fill="none"/><path--%>
              <%--                            d="M3.5 5.5l1.5 1.5l2.5 -2.5"/><path d="M3.5 11.5l1.5 1.5l2.5 -2.5"/><path--%>
              <%--                            d="M3.5 17.5l1.5 1.5l2.5 -2.5"/><line x1="11" y1="6" x2="20" y2="6"/><line x1="11" y1="12"--%>
              <%--                                                                                                       x2="20" y2="12"/><line--%>
              <%--                            x1="11" y1="18" x2="20" y2="18"/></svg>--%>
              <%--                          </span>--%>
              <%--                          </div>--%>
              <%--                          <div class="col">--%>
              <%--                            <div class="font-weight-medium">--%>
              <%--                              已发布--%>
              <%--                            </div>--%>
              <%--                            <div class="h1 mb-0 me-2 text-azure">--%>
              <%--                              ${fn:length(assignedTasks)}--%>
              <%--                            </div>--%>
              <%--                          </div>--%>
              <%--                        </div>--%>
              <%--                      </div>--%>
              <%--                    </div>--%>
              <%--                  </div>--%>
              <%--                  <div class="col-4">--%>
              <%--                    <div class="card">--%>
              <%--                      <div class="card-body">--%>
              <%--                        <div class="row align-items-center">--%>
              <%--                          <div class="col-auto">--%>
              <%--                          <span class="bg-blue text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"--%>
              <%--                                                                       width="24" height="24" viewBox="0 0 24 24"--%>
              <%--                                                                       stroke-width="2" stroke="currentColor"--%>
              <%--                                                                       fill="none" stroke-linecap="round"--%>
              <%--                                                                       stroke-linejoin="round"><path stroke="none"--%>
              <%--                                                                                                     d="M0 0h24v24H0z"--%>
              <%--                                                                                                     fill="none"/><path--%>
              <%--                            d="M3.5 5.5l1.5 1.5l2.5 -2.5"/><path d="M3.5 11.5l1.5 1.5l2.5 -2.5"/><path--%>
              <%--                            d="M3.5 17.5l1.5 1.5l2.5 -2.5"/><line x1="11" y1="6" x2="20" y2="6"/><line x1="11" y1="12"--%>
              <%--                                                                                                       x2="20" y2="12"/><line--%>
              <%--                            x1="11" y1="18" x2="20" y2="18"/></svg>--%>
              <%--                          </span>--%>
              <%--                          </div>--%>
              <%--                          <div class="col">--%>
              <%--                            <div class="font-weight-medium">--%>
              <%--                              进行中--%>
              <%--                            </div>--%>
              <%--                            <div class="h1 mb-0 me-2 text-facebook">--%>
              <%--                              ${fn:length(doingTasks)}--%>
              <%--                            </div>--%>
              <%--                          </div>--%>
              <%--                        </div>--%>
              <%--                      </div>--%>
              <%--                    </div>--%>
              <%--                  </div>--%>
              <%--                  <div class="col-4">--%>
              <%--                    <div class="card">--%>
              <%--                      <div class="card-body">--%>
              <%--                        <div class="row align-items-center">--%>
              <%--                          <div class="col-auto">--%>
              <%--                          <span class="bg-blue text-white avatar"><svg xmlns="http://www.w3.org/2000/svg" class="icon"--%>
              <%--                                                                       width="24" height="24" viewBox="0 0 24 24"--%>
              <%--                                                                       stroke-width="2" stroke="currentColor"--%>
              <%--                                                                       fill="none" stroke-linecap="round"--%>
              <%--                                                                       stroke-linejoin="round"><path stroke="none"--%>
              <%--                                                                                                     d="M0 0h24v24H0z"--%>
              <%--                                                                                                     fill="none"/><path--%>
              <%--                            d="M3.5 5.5l1.5 1.5l2.5 -2.5"/><path d="M3.5 11.5l1.5 1.5l2.5 -2.5"/><path--%>
              <%--                            d="M3.5 17.5l1.5 1.5l2.5 -2.5"/><line x1="11" y1="6" x2="20" y2="6"/><line x1="11" y1="12"--%>
              <%--                                                                                                       x2="20" y2="12"/><line--%>
              <%--                            x1="11" y1="18" x2="20" y2="18"/></svg>--%>
              <%--                          </span>--%>
              <%--                          </div>--%>
              <%--                          <div class="col">--%>
              <%--                            <div class="font-weight-medium">--%>
              <%--                              已完成--%>
              <%--                            </div>--%>
              <%--                            <div class="h1 mb-0 me-2 text-green">--%>
              <%--                              ${fn:length(doneTasks)}--%>
              <%--                            </div>--%>
              <%--                          </div>--%>
              <%--                        </div>--%>
              <%--                      </div>--%>
              <%--                    </div>--%>
              <%--                  </div>--%>
              <%--                </div>--%>
              <%--              </div>--%>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@include file="../common/footer.jsp" %>
  </div>
</div>
<%--<div class="modal modal-blur fade" id="modal-camera" tabindex="-1" role="dialog" aria-hidden="true">--%>
<%--  <div class="modal-dialog modal-lg" role="document">--%>
<%--    <div class="modal-content">--%>
<%--      <div class="modal-header">--%>
<%--        <h5 class="modal-title">监控</h5>--%>
<%--        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"--%>
<%--                onclick="closeCramera()"></button>--%>
<%--      </div>--%>
<%--      <div class="modal-body">--%>
<%--        <div class="mb-3">--%>
<%--          <iframe--%>
<%--            src="https://open.ys7.com/ezopen/h5/iframe?url=ezopen://open.ys7.com/F43323849/1.live&autoplay=1&audio=1&accessToken=${ysToken.accessToken}&templete=0"--%>
<%--            width="600"--%>
<%--            height="400"--%>
<%--            id="ysOpenDevice"--%>
<%--            scrolling="no"--%>
<%--            allowfullscreen--%>
<%--          >--%>
<%--          </iframe>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="modal-footer">--%>
<%--        <a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal" onclick="closeCramera()">--%>
<%--          关闭--%>
<%--        </a>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>
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
    var player = document.getElementById('ysOpenDevice').contentWindow;
    player.postMessage("play", "https://open.ys7.com/ezopen/h5/iframe");
    <%--  player = new EZUIPlayer({--%>
    <%--    id: 'myPlayer',--%>
    <%--    url: 'ezopen://open.ys7.com/F43323849/1.hd.live',--%>
    <%--    autoplay: true,--%>
    <%--    accessToken: "${ysToken.accessToken}",--%>
    <%--    decoderPath: '<%=path%>/dist/js/ezui/',--%>
    <%--    width: 600,--%>
    <%--    height: 400--%>
    <%--  });--%>
    <%--}--%>
  }

  function closeCramera() {
    var modal = $("#modal-camera");
    modal.modal("hide");
    var player = document.getElementById('ysOpenDevice').contentWindow;
    player.postMessage("stop", "https://open.ys7.com/ezopen/h5/iframe");

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
