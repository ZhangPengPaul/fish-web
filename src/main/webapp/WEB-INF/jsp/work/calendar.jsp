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
            <h2 class="page-title">
              工作日历
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
        <div class="col-3">
          <div class="card">
            <div class="card-body">
              <div class="card card-sm">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col-auto">
                      <span class="bg-orange text-white badge"></span>
                    </div>
                    <div class="col">
                      <div class="font-weight-medium">
                        未发布
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card card-sm">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col-auto">
                      <span class="bg-azure text-white badge"></span>
                    </div>
                    <div class="col">
                      <div class="font-weight-medium">
                        已发布
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card card-sm">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col-auto">
                      <span class="bg-facebook text-white badge"></span>
                    </div>
                    <div class="col">
                      <div class="font-weight-medium">
                        进行中
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card card-sm">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col-auto">
                      <span class="bg-green text-white badge"></span>
                    </div>
                    <div class="col">
                      <div class="font-weight-medium">
                        已完成
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card card-sm">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col">
                      <label class="form-label required">选择池塘</label>
                      <select class="form-select form-control" name="task-type" id="">
                        <option value="1">一号塘</option>
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
                  </div>
                </div>
              </div>
              <div class="card card-sm">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col">
                      <label class="form-label required">任务类型</label>
                      <select class="form-select form-control" name="task-type">
                        <option value="1">已发布</option>
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
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-9">
          <div class="card">
            <div class="card-body">
              <div id='calendar'></div>
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
<!-- edit task modal -->

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
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialView: 'dayGridMonth',
      locale: 'cn',
      events: [
        <c:forEach items="${tasks}" var="task">
        {
          id: "${task.taskId}",
          title: "${task.title}",
          start: "<fmt:formatDate value="${task.startTime}" pattern="yyyy-MM-dd"/>",
          end: "<fmt:formatDate value="${task.endTime}" pattern="yyyy-MM-dd"/>",
          <c:if test="${task.status == 1}">
          color: "#f76707"
          </c:if>
          <c:if test="${task.status == 2}">
          color: "#4299e1"
          </c:if>
          <c:if test="${task.status == 3}">
          color: "#3b5998"
          </c:if>
          <c:if test="${task.status == 4}">
          color: "#2fb344"
          </c:if>
        }
        <c:if test="${tasks.size() > 1}">, </c:if>
        </c:forEach>
      ],
      eventClick: function (info) {
        clickEvent(info.event.id);
      },
      eventMouseEnter: function (mouseEnterInfo) {
        var body = document.querySelector("body")
        body.style.cursor = "pointer";
      },
      eventMouseLeave: function (mouseLeaveInfo) {
        var body = document.querySelector("body")
        body.style.cursor = "default";
      }
    });
    calendar.render();

    function clickEvent(taskId) {
      var url = "<%=path%>/work/detail/" + taskId;

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
            console.log(response);
            var statusHtml = "";
            var status = response.data.status;
            switch (status) {
              case 1:
                statusHtml = "<dd class=\"col-6\"><div class=\"row\"><div class=\"col-1\"><span class=\"bg-orange text-white badge\"></span></div><div class=\"col-11\">未发布</div></div></dd>\n";
                break;
              case 2:
                statusHtml = "<dd class=\"col-6\"><div class=\"row\"><div class=\"col-1\"><span class=\"bg-azure text-white badge\"></span></div><div class=\"col-11\">已发布</div></div></dd>\n";
                break;
              case 3:
                statusHtml = "<dd class=\"col-6\"><div class=\"row\"><div class=\"col-1\"><span class=\"bg-facebook text-white badge\"></span></div><div class=\"col-11\">进行中</div></div></dd>\n";
                break;
              case 4:
                statusHtml = "<dd class=\"col-6\"><div class=\"row\"><div class=\"col-1\"><span class=\"bg-green text-white badge\"></span></div><div class=\"col-11\">已完成</div></div></dd>\n";
                break;
            }
            var html = "<div class=\"modal modal-blur fade\" id=\"modal-task\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\">\n" +
              "  <div class=\"modal-dialog modal-lg\" role=\"document\">\n" +
              "    <div class=\"modal-content\">\n" +
              "      <div class=\"modal-header\">\n" +
              "        <h5 class=\"modal-title\">任务详情</h5>\n" +
              "        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n" +
              "      </div>\n" +
              "      <div class=\"modal-body\">\n" +
              "        <div class=\"card\">\n" +
              "          <div class=\"card-header\">\n" +
              "            <div class=\"card-actions\">\n" +
              "              <a href=\"javascript:;\" onclick=deleteTask('" + response.data.taskId + "')>\n" +
              "                删除任务\n" +
              "                <svg xmlns=\"http://www.w3.org/2000/svg\" class=\"icon\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\"\n" +
              "                     stroke-width=\"2\" stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">\n" +
              "                  <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"/>\n" +
              "                  <line x1=\"4\" y1=\"7\" x2=\"20\" y2=\"7\"/>\n" +
              "                  <line x1=\"10\" y1=\"11\" x2=\"10\" y2=\"17\"/>\n" +
              "                  <line x1=\"14\" y1=\"11\" x2=\"14\" y2=\"17\"/>\n" +
              "                  <path d=\"M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12\"/>\n" +
              "                  <path d=\"M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3\"/>\n" +
              "                </svg>\n" +
              "              </a>\n" +
              "            </div>\n" +
              "          </div>\n" +
              "          <div class=\"card-body\">\n" +
              "            <dl class=\"row\">\n" +
              "              <dt class=\"col-5\">任务名称:</dt>\n" +
              "              <dd class=\"col-6\">" + response.data.title + "</dd>\n" +
              "              <dt class=\"col-5\">所属池塘:</dt>\n" +
              "              <dd class=\"col-6\">" + response.data.pond.name + "</dd>\n" +
              "              <dt class=\"col-5\">任务类型:</dt>\n" +
              "              <dd class=\"col-6\">" + response.data.type + "</dd>\n" +
              "              <dt class=\"col-5\">开始时间:</dt>\n" +
              "              <dd class=\"col-6\">" + response.data.startTime + "</dd>\n" +
              "              <dt class=\"col-5\">结束时间:</dt>\n" +
              "              <dd class=\"col-6\">" + response.data.endTime + "</dd>\n" +
              "              <dt class=\"col-5\">任务状态:</dt>\n" +
              statusHtml +
              "            </dl>\n" +
              "          </div>\n" +
              "        </div>\n" +
              "      </div>\n" +
              "      <div class=\"mb-3\">\n" +
              "        <label class=\"form-label required\">指派任务</label>\n" +
              "        <select class=\"form-select\" id=\"assign-user\">\n" +
              <c:forEach items="${users}" var="user">
              "<option value=\"${user.userId}\">${user.username}</option>\n" +
              </c:forEach>
              "        </select>\n" +
              "      </div>\n" +
              "    <div class=\"modal-footer\">\n" +
              "      <a href=\"#\" class=\"btn btn-link link-secondary\" data-bs-dismiss=\"modal\">\n" +
              "        取消\n" +
              "      </a>\n" +
              "      <a href=\"javascript:;\" onclick=\"assign('" + response.data.taskId + "')\" class=\"btn btn-primary ms-auto\">\n" +
              "        <svg xmlns=\"http://www.w3.org/2000/svg\" class=\"icon\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\"\n" +
              "             stroke-width=\"2\" stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\"\n" +
              "             stroke-linejoin=\"round\">\n" +
              "          <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"/>\n" +
              "          <line x1=\"12\" y1=\"5\" x2=\"12\" y2=\"19\"/>\n" +
              "          <line x1=\"5\" y1=\"12\" x2=\"19\" y2=\"12\"/>\n" +
              "        </svg>\n" +
              "        指派任务\n" +
              "      </a>\n" +
              "    </div>\n" +
              "  </div>\n" +
              "</div>";

            $("body").append(html);
            $("#modal-task").modal("show");
          }

        });

    }
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

  function deleteTask(taskId) {
    var url = "<%=path%>/work/delete-task?taskId=" + taskId;

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
          window.location.href = "<%=path%>/work/calendar";
        }

      });
  }

  function assign(taskId) {
    var userId = $("#assign-user").val();
    var url = "<%=path%>/work/assign-task?taskId=" + taskId + "&userId=" + userId;

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
