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
        .custom-sidebar{
            margin:0 15% 0 0;
        }
        HTML CSSResult Skip Results Iframe
        EDIT ON

        @import url('https://fonts.googleapis.com/icon?family=Material+Icons');
        li.nav-item{
            margin: 0 auto 0 auto;

        }
        .dropdown{
            position : relative;
            display : inline-block;
            width: 230px;
            height: 50px;
            margin: 0 auto 0 18px;
        }

        .dropbtn_icon{
            font-family : 'Material Icons';
        }
        .dropbtn{
            border: 0;
            background-color: rgb(31,40,61);
            font-weight: 400;
            color : rgb(138,143,157);
            padding : 15px 46px 6px 13px;
            width :200px;
            text-align: center;
            cursor : pointer;
            font-size : 12px;
        }
        .dropdown-content{
            display : none;
            position : absolute;
            z-index : 1; /*다른 요소들보다 앞에 배치*/
            font-weight: 400;
            background-color: rgb(26,32,53);
            min-width : 180px;
            height: 115px;
            margin-left: 50px;

        }

        .dropdown-content a{
            display : block;
            text-decoration : none;
            color : rgb(37, 37, 37);
            font-size: 12px;
            padding : 12px 20px;
        }

        .dropdown-content a:hover{
            background-color : #1f283e
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</head>

<body class="dark-edition">
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="custom-sidebar">
    <div class="sidebar" data-color="purple" data-background-color="black" data-image="E:\developement_pk\source\spring_framework\RHcommunity\src\main\webapp\resources\material-dashboard-dark-edition-v2.1.0\assets\img\sidebar-2.jpg">
        <!--
          Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

          Tip 2: you can also add an image using data-image tag
      -->
        <div class="logo"><a href="/member/main" class="simple-text logo-normal">
            RH company
        </a></div>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <li class="nav-item active  ">
                    <a class="nav-link" href="/member/main">
                        <i class="material-icons">dashboard</i>
                        <p>HOME</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/member/memberList">
                        <i class="material-icons">person</i>
                        <p>사원목록</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/member/myProfile">
                        <i class="material-icons">person</i>
                        <p>내 프로필</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="./tables.html">
                        <i class="material-icons">content_paste</i>
                        <p>Table List</p>
                    </a>
                </li>
                <li class="nav-item ">
                        <div class="dropdown">
                            <button class="dropbtn">
                                <i class="material-icons">library_books</i>
                                <p>서류발급 서비스</p>
                            </button>
                            <div class="dropdown-content">
                                <a href="/documents/certificate">재직증명서</a>
                                <a href="#">급여명세서</a>
                            </div>
                        </div>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="./icons.html">
                        <i class="material-icons">bubble_chart</i>
                        <p>Icons</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="./map.html">
                        <i class="material-icons">location_ons</i>
                        <p>Maps</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="./notifications.html">
                        <i class="material-icons">notifications</i>
                        <p>Notifications</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
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

            $('.fixed-plugin a').click(function(event) {
                // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
                if ($(this).hasClass('switch-trigger')) {
                    if (event.stopPropagation) {
                        event.stopPropagation();
                    } else if (window.event) {
                        window.event.cancelBubble = true;
                    }
                }
            });

            $('.fixed-plugin .active-color span').click(function() {
                $full_page_background = $('.full-page-background');

                $(this).siblings().removeClass('active');
                $(this).addClass('active');

                var new_color = $(this).data('color');

                if ($sidebar.length != 0) {
                    $sidebar.attr('data-color', new_color);
                }

                if ($full_page.length != 0) {
                    $full_page.attr('filter-color', new_color);
                }

                if ($sidebar_responsive.length != 0) {
                    $sidebar_responsive.attr('data-color', new_color);
                }
            });

            $('.fixed-plugin .background-color .badge').click(function() {
                $(this).siblings().removeClass('active');
                $(this).addClass('active');

                var new_color = $(this).data('background-color');

                if ($sidebar.length != 0) {
                    $sidebar.attr('data-background-color', new_color);
                }
            });

            $('.fixed-plugin .img-holder').click(function() {
                $full_page_background = $('.full-page-background');

                $(this).parent('li').siblings().removeClass('active');
                $(this).parent('li').addClass('active');


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
    });
</script>

</body>

</html>