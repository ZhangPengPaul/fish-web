<%@include file="../common/common.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <title>工作日历</title>
  <!-- CSS files -->
  <link href="<%=path%>/dist/libs/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/tabler.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/tabler-flags.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/tabler-payments.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/tabler-vendors.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/css/demo.min.css" rel="stylesheet"/>
  <link href="<%=path%>/dist/libs/calendar/main.css" rel='stylesheet'/>
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
              用户列表
            </h2>
          </div>
          <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
              <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal"
                 data-bs-target="#modal-pond">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                     viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                     stroke-linecap="round" stroke-linejoin="round">
                  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                  <line x1="12" y1="5" x2="12" y2="19"></line>
                  <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
                新增任务
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
              <div class="col-1">
                <span class="badge bg-blue">已完成</span>
              </div>
              <div class="col-1">
                <span class="badge bg-blue">未完成</span>
              </div>
              <div class="col-1">
                <span class="badge bg-blue">其他</span>
              </div>
            </div>
            <div class="card-body">
              <div id='calendar'></div>
            </div>
            <div class="card-footer d-flex align-items-center">
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
        <h5 class="modal-title">新任务</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
          <label class="form-label required">池塘</label>
          <select class="form-select form-control" name="task-pond" id="task-pond">
            <c:forEach items="${ponds}" var="pond">
              <option value="${pond.pondId}">${pond.name}</option>
            </c:forEach>
          </select>
        </div>
        <div class="mb-3">
          <label class="form-label required">任务名</label>
          <input type="text" class="form-control" name="task-title" id="task-title" placeholder="任务名">
          <div class="invalid-feedback">任务名</div>
        </div>
        <div class="mb-3">
          <label class="form-label required">任务描述</label>
          <textarea class="form-control" rows="3" name="task-memo" id="task-memo"></textarea>
          <div class="invalid-feedback">任务描述</div>
        </div>
        <div class="mb-3">
          <label class="form-label required">任务类型</label>
          <select class="form-select form-control" name="task-type" id="task-type">
            <option value="1">清塘</option>
            <option value="2">消毒</option>
            <option value="3">晒塘</option>
            <option value="4">放水</option>
            <option value="5">施肥</option>
            <option value="6">种植水草</option>
            <option value="7">肥水</option>
            <option value="8">试苗</option>
            <option value="9">巡塘</option>
            <option value="10">放苗</option>
            <option value="11">投喂</option>
            <option value="12">抽检</option>
            <option value="13">换水</option>
            <option value="14">捕捞</option>
            <option value="15">检验</option>
          </select>
        </div>
        <div class="mb-3">
          <label class="form-label required">任务开始时间</label>
          <input id="startTime" type="date" class="form-control mb-2"
                 placeholder="Select a date"/>
          <div class="invalid-feedback">任务描述</div>
        </div>
        <div class="mb-3">
          <label class="form-label required">任务结束时间</label>
          <input id="endTime" type="date" class="form-control mb-2"
                 placeholder="Select a date"/>
          <div class="invalid-feedback">任务描述</div>
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
          添加任务
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
<script src="<%=path%>/dist/libs/calendar/main.js"></script>
<script src="<%=path%>/dist/libs/calendar/zh-cn.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale: 'cn',
      events: [
        <c:forEach items="${tasks}" var="task">
        {
          title: "${task.title}",
          start: "<fmt:formatDate value="${task.startTime}" pattern="yyyy-MM-dd"/>",
          end: "<fmt:formatDate value="${task.endTime}" pattern="yyyy-MM-dd"/>"
        }
        <c:if test="${tasks.size() > 1}">, </c:if>
        </c:forEach>
      ]
    });
    calendar.render();
  });


  $("document").ready(function () {
    $("#page-index").removeClass("active");
    $("#page-work-schedule").addClass("active");
    $("#dropdown-calendar").addClass("active");

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
    var url = "<%=path%>/work/add-task";
    var data = {
      "title": "",
      "memo": "",
      "type": "",
      "startTime": "",
      "endTime": "",
      "pondId": ""
    };

    var pondId = $("#task-pond").val();
    var title = $("#task-title").val();
    var memo = $("#task-memo").val();
    var type = $("#task-type").val();
    var startTime = $("#startTime").val();
    var endTime = $("#endTime").val();

    data.title = title;
    data.memo = memo;
    data.type = type;
    data.startTime = startTime;
    data.endTime = endTime;
    data.pondId = pondId;

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
          window.location.href = "<%=path%>/work/calendar";
        }

      });
  }

  function showModal(userId) {
    $("#modal-user-id").val(userId);
    $("#modal-role").modal('show');
  }

  function configRole() {
    var userId = $("#modal-user-id").val();
    var roleId = $("#roles").val();
    var url = "<%=path%>/user/config-role?userId=" + userId + "&roleId=" + roleId;

    fetch(url, {
      method: "POST",
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
          window.location.href = "<%=path%>/user/list";
        }

      });
  }
</script>
</body>
</html>
