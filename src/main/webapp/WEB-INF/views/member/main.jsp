<!--
=========================================================
* Material Dashboard Dark Edition - v2.1.0
=========================================================

* Product Page: https://www.creative-tim.com/product/material-dashboard-dark
* Copyright 2019 Creative Tim (http://www.creative-tim.com)

* Coded by www.creative-tim.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="apple-touch-icon" sizes="76x76" href="E:\developement_pk\source\spring_framework\RHcommunity\src\main\webapp\resources\material-dashboard-dark-edition-v2.1.0\assets\img\apple-icon.png">
    <link rel="icon" type="image/png" href="E:\developement_pk\source\spring_framework\RHcommunity\src\main\webapp\resources\material-dashboard-dark-edition-v2.1.0\assets\img\favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        Material Dashboard Dark Edition by Creative Tim
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- CSS Files -->
    <link href="../../../resources/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="../../../resources/css/demo.css" rel="stylesheet" />
    <style>
        body{
            background-color: rgb(26,32,53);
            color: whitesmoke;
            margin-left: 300px;
            margin-top: 200px;
        }
        .custom-wrapper{
            margin: 0 5% 0 15%;
        }
        .tableTh{
            width: 25%;
        }
        .content{
            width: 100%;
        }
        .footer{
            width: 100%;
        }
        .sub-container{
            margin: 0 0% 0 0%;
            background-color: rgba(31,40,62,0.95);
            height: 70%;
            width: 120%;
            border-radius: 5%;
        }
    </style>
</head>

<body class="dark-edition">
<jsp:include page="../layout/sidebar.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="sub-container">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-4 col-lg-12">
                        <div class="card card-chart">
                            <div class="card-header card-header-success">
                                <div class="ct-chart" id="dailySalesChart"></div>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">이번달 우수사원</h4>
                                <p class="card-category" style="color: lightgray">
                                    ${loginDTO.memberName} ${loginDTO.memberDept} ${loginDTO.memberPosition}</p>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    우수사원에 뽑힌걸 축하드립니다.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-12">
                        <div class="card card-chart">
                            <div class="card-header card-header-warning">
                                <div class="ct-chart" id="websiteViewsChart"></div>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">이번달 전체사원의 근태현황</h4>
                                <p class="card-category" style="color: lightgray">결근률 3.2%, 지각률 5.9%, 조퇴률 2.4%</p>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    지난달: 결근률 3.6%, 지각률 5.8%, 조퇴률 2.6%
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-12">
                        <div class="card card-chart">
                            <div class="card-header card-header-danger">
                                <div class="ct-chart" id="completedTasksChart"></div>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">이번달 나의 근태현황</h4>
                                <p class="card-category" style="color: lightgray">결근률 3.3%, 지각률 2.4%, 조퇴률 5.8%</p>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    지난달: 결근률 3.3%, 지각률 2.8%, 조퇴률 5.5%
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-warning card-header-icon">
                                <div class="card-icon" style="width: 86px; height: 86px">
                                    <a href="/attendance/attendance?id=${sessionScope.id}">
                                    <i class="bi bi-stopwatch" style="width: 100px; margin-right: 12px; font-size: 30px"></i>
                                    <p style="text-align: center; margin-top: 0; padding-top: 0"><sup>출근체크</sup></p>
                                    </a>
                                </div>
                                <p class="card-category">근무일수</p>
                                <h3 class="card-title">${loginDTO.countAttendance}
                                </h3>
                                <small>일</small>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons">date_range</i> Last 24 Hours
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-success card-header-icon">
                                    <div class="card-icon" style="width: 86px; height: 86px">
                                        <a href="/attendance/closing?id=${sessionScope.id}">
                                        <i class="bi bi-clock" style="width: 100px; margin-right: 12px; font-size: 30px"></i>
                                        <p style="text-align: center; margin-top: 0; padding-top: 0"><sup>퇴근체크</sup></p>
                                        </a>
                                    </div>
                                <p class="card-category">조기퇴근일수</p>
                                <h3 class="card-title">${loginDTO.countEarly}</h3>
                                <small>일</small>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons">date_range</i> Last 24 Hours
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-danger card-header-icon">
                                <div class="card-icon" style="width: 86px; height: 86px">
                                    <a href="/documents/absence-form">
                                    <i class="material-icons">info_outline</i>
                                    <p style="text-align: center; margin-top: 0; padding-top: 0"><sup>결근사유서</sup></p>
                                    </a>
                                </div>
                                <p class="card-category">결근일수</p>
                                <h3 class="card-title">${loginDTO.countAbsenceDate}</h3>
                                <small>일</small>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons">date_range</i> This Month
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-info card-header-icon">
                                <div class="card-icon"  style="width: 86px; height: 86px">
                                    <a href="/documents/hollyDay-form">
                                    <i class="fa fa-twitter"></i>
                                    <p style="text-align: center; margin-top: 0; padding-top: 0"><sup>휴가신청</sup></p>
                                    </a>
                                </div>
                                <p class="card-category">휴가일수</p>
                                <h3 class="card-title">${loginDTO.restHoliday}/${loginDTO.totalHoliday}</h3>
                                <small>일</small>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons">update</i> Today Updated
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">이번달 신입사원</h4>
                                <p class="card-category">입사를 환영합니다. 많이 도와주세요.</p>
                            </div>
                            <div class="card-body table-responsive">
                                <table class="table table-hover">
                                    <thead class="text-warning">
                                    <th class="tableTh">사원명</th>
                                    <th class="tableTh">부서</th>
                                    <th class="tableTh">직급</th>
                                    <th class="tableTh">입사일</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${newList}" var="newList">
                                    <tr>
                                        <td>${newList.memberName}</td>
                                        <td>${newList.memberDept}</td>
                                        <td>${newList.memberPosition}</td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                            value="${newList.memberJoinDate}"></fmt:formatDate></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-header card-header-tabs card-header-warning">
                                <h4 class="card-title">이번달 휴가인원</h4>
                                <p class="card-category">푹쉬고 새로운 마음가짐으로 일하세요.</p>
                            </div>
                            <div class="card-body table-responsive">
                                <table class="table table-hover">
                                    <thead class="text-warning">
                                    <th class="tableTh">사원명</th>
                                    <th class="tableTh">부서</th>
                                    <th class="tableTh">직급</th>
                                    <th class="tableTh">휴가기간</th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Dakota Rice</td>
                                        <td>$36,738</td>
                                        <td>Niger</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Minerva Hooper</td>
                                        <td>$23,789</td>
                                        <td>Curaçao</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Sage Rodriguez</td>
                                        <td>$56,142</td>
                                        <td>Netherlands</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Philip Chaney</td>
                                        <td>$38,735</td>
                                        <td>Korea, South</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container-fluid">
                <nav class="float-left">
                    <ul>
                        <li>
                            <a href="https://www.creative-tim.com">
                                Creative Tim
                            </a>
                        </li>
                        <li>
                            <a href="https://creative-tim.com/presentation">
                                About Us
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                                Blog
                            </a>
                        </li>
                        <li>
                            <a href="https://www.creative-tim.com/license">
                                Licenses
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="copyright float-right" id="date">
                    , made with <i class="material-icons">favorite</i> by
                    <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a> for a better web.
                </div>
            </div>
        </footer>
        <script>
            const x = new Date().getFullYear();
            let date = document.getElementById('date');
            date.innerHTML = '&copy; ' + x + date.innerHTML;
        </script>
    </div>
</div>

<!--   Core JS Files   -->
<script src="E:\developement_pk\source\spring_framework\RHcommunity\src\main\webapp\resources\material-dashboard-dark-edition-v2.1.0\assets\js\core\jquery.min.js"></script>
<script src="E:\developement_pk\source\spring_framework\RHcommunity\src\main\webapp\resources\material-dashboard-dark-edition-v2.1.0\assets\js\core\popper.min.js"></script>
<script src="E:\developement_pk\source\spring_framework\RHcommunity\src\main\webapp\resources\material-dashboard-dark-edition-v2.1.0\assets\js\core\bootstrap-material-design.min.js"></script>
<script src="https://unpkg.com/default-passive-events"></script>
<script src="E:\developement_pk\source\spring_framework\RHcommunity\src\main\webapp\resources\material-dashboard-dark-edition-v2.1.0\assets\js\plugins\perfect-scrollbar.jquery.min.js"></script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Chartist JS -->
<script src="E:\developement_pk\source\spring_framework\RHcommunity\src\main\webapp\resources\material-dashboard-dark-edition-v2.1.0\assets\js\plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="E:\developement_pk\source\spring_framework\RHcommunity\src\main\webapp\resources\material-dashboard-dark-edition-v2.1.0\assets\js\plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="E:\developement_pk\source\spring_framework\RHcommunity\src\main\webapp\resources\material-dashboard-dark-edition-v2.1.0\assets\js\material-dashboard.js?v=2.1.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="../../../resources/js/demo.js"></script>
<script>
    $(document).ready(function() {
        $().ready(function() {
            $sidebar = $('.sidebar');

            $sidebar_img_container = $sidebar.find('.sidebar-background');

            $full_page = $('.full-page');

            $sidebar_responsive = $('body > .navbar-collapse');

            window_width = $(window).width();

                var new_image = $(this).find("img").attr('src');

                if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                    $sidebar_img_container.fadeOut('fast', function() {
                        $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                        $sidebar_img_container.fadeIn('fast');
                    });
                }

                if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                    $full_page_background.fadeOut('fast', function() {
                        $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                        $full_page_background.fadeIn('fast');
                    });
                }

                if ($('.switch-sidebar-image input:checked').length == 0) {
                    var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                    $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                    $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                }

                if ($sidebar_responsive.length != 0) {
                    $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
                }
            });

            $('.switch-sidebar-image input').change(function() {
                $full_page_background = $('.full-page-background');

                $input = $(this);

                if ($input.is(':checked')) {
                    if ($sidebar_img_container.length != 0) {
                        $sidebar_img_container.fadeIn('fast');
                        $sidebar.attr('data-image', '#');
                    }

                    if ($full_page_background.length != 0) {
                        $full_page_background.fadeIn('fast');
                        $full_page.attr('data-image', '#');
                    }

                    background_image = true;
                } else {
                    if ($sidebar_img_container.length != 0) {
                        $sidebar.removeAttr('data-image');
                        $sidebar_img_container.fadeOut('fast');
                    }

                    if ($full_page_background.length != 0) {
                        $full_page.removeAttr('data-image', '#');
                        $full_page_background.fadeOut('fast');
                    }

                    background_image = false;
                }
            });

            $('.switch-sidebar-mini input').change(function() {
                $body = $('body');

                $input = $(this);

                if (md.misc.sidebar_mini_active == true) {
                    $('body').removeClass('sidebar-mini');
                    md.misc.sidebar_mini_active = false;

                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

                } else {

                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

                    setTimeout(function() {
                        $('body').addClass('sidebar-mini');

                        md.misc.sidebar_mini_active = true;
                    }, 300);
                }

                // we simulate the window Resize so the charts will get updated in realtime.
                var simulateWindowResize = setInterval(function() {
                    window.dispatchEvent(new Event('resize'));
                }, 180);

                // we stop the simulation of Window Resize after the animations are completed
                setTimeout(function() {
                    clearInterval(simulateWindowResize);
                }, 1000);
        });
    });
</script>
<script>
    $(document).ready(function() {
        // Javascript method's body can be found in assets/js/demos.js
        md.initDashboardPageCharts();

    });
</script>
</body>
</html>