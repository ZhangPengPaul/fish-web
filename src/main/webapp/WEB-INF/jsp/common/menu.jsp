<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<div class="navbar-expand-md">
  <div class="collapse navbar-collapse" id="navbar-menu">
    <div class="navbar navbar-light">
      <div class="container-fluid">
        <ul class="navbar-nav">
          <li class="nav-item active" id="page-index">
            <a class="nav-link" href="<%=path%>/dashboard">
                    <span class="nav-link-icon d-md-none d-lg-inline-block"><svg xmlns="http://www.w3.org/2000/svg"
                                                                                 class="icon" width="24" height="24"
                                                                                 viewBox="0 0 24 24" stroke-width="2"
                                                                                 stroke="currentColor" fill="none"
                                                                                 stroke-linecap="round"
                                                                                 stroke-linejoin="round"><path
                      stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="5 12 3 12 12 3 21 12 19 12"/><path
                      d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"/><path
                      d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6"/></svg>
                    </span>
              <span class="nav-link-title">
                      首页
                    </span>
            </a>
          </li>
          <li class="nav-item" id="page-pond">
            <a class="nav-link" href="<%=path%>/pond/list">
                    <span class="nav-link-icon d-md-none d-lg-inline-block">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
                             stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                             stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path
                          d="M2 20a2.4 2.4 0 0 0 2 1a2.4 2.4 0 0 0 2 -1a2.4 2.4 0 0 1 2 -1a2.4 2.4 0 0 1 2 1a2.4 2.4 0 0 0 2 1a2.4 2.4 0 0 0 2 -1a2.4 2.4 0 0 1 2 -1a2.4 2.4 0 0 1 2 1a2.4 2.4 0 0 0 2 1a2.4 2.4 0 0 0 2 -1"/><path
                          d="M2 16a2.4 2.4 0 0 0 2 1a2.4 2.4 0 0 0 2 -1a2.4 2.4 0 0 1 2 -1a2.4 2.4 0 0 1 2 1a2.4 2.4 0 0 0 2 1a2.4 2.4 0 0 0 2 -1a2.4 2.4 0 0 1 2 -1a2.4 2.4 0 0 1 2 1a2.4 2.4 0 0 0 2 1a2.4 2.4 0 0 0 2 -1"/><path
                          d="M15 12v-7.5a1.5 1.5 0 0 1 3 0"/><path d="M9 12v-7.5a1.5 1.5 0 0 0 -3 0"/><line
                          x1="15" y1="5" x2="9" y2="5"/><line x1="9" y1="10" x2="15" y2="10"/></svg>
                    </span>
              <span class="nav-link-title">
                      池塘管理
                    </span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=path%>/form-elements.html">
                    <span class="nav-link-icon d-md-none d-lg-inline-block">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
                             stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                             stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><rect x="13"
                                                                                                              y="8"
                                                                                                              width="8"
                                                                                                              height="12"
                                                                                                              rx="1"/><path
                          d="M18 8v-3a1 1 0 0 0 -1 -1h-13a1 1 0 0 0 -1 1v12a1 1 0 0 0 1 1h9"/><line x1="16" y1="9"
                                                                                                    x2="18"
                                                                                                    y2="9"/></svg>
                    </span>
              <span class="nav-link-title">
                      设备管理
                    </span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#navbar-extra" data-bs-toggle="dropdown"
               role="button" aria-expanded="false">
                    <span class="nav-link-icon d-md-none d-lg-inline-block">
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
                             stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                             stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><rect x="4"
                                                                                                              y="5"
                                                                                                              width="16"
                                                                                                              height="16"
                                                                                                              rx="2"/><line
                          x1="16" y1="3" x2="16" y2="7"/><line x1="8" y1="3" x2="8" y2="7"/><line x1="4" y1="11"
                                                                                                  x2="20"
                                                                                                  y2="11"/><rect
                          x="8" y="15" width="2" height="2"/></svg>
                    </span>
              <span class="nav-link-title">
                      生产管理
                    </span>
            </a>
          </li>
          <li class="nav-item dropdown" id="page-user-manager">
            <a class="nav-link dropdown-toggle" href="#navbar-base" data-bs-toggle="dropdown" role="button"
               aria-expanded="false">
              <span class="nav-link-icon d-md-none d-lg-inline-block">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
                     stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path
                  stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="9" cy="7" r="4"/><path
                  d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/><path
                  d="M21 21v-2a4 4 0 0 0 -3 -3.85"/></svg>
              </span>
              <span class="nav-link-title">
                用户权限管理
              </span>
            </a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="<%=path%>/user/list" id="dropdown-user">
                用户管理
              </a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
