<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="Codedthemes" />
    <meta name="description" content="">
    <title></title>
    <!-- Favicon icon -->
    <link rel="icon" href="https://denb.co.kr/assets/images/favicon.ico" type="image/x-icon">
    <!-- fontawesome icon -->
    <!-- plugins css -->
    <link href="/resources/static/css/style.css" rel="stylesheet">
    <link href="/resources/static/app/demos/main/css/style.css" rel="stylesheet">
    <link href="/resources/static/app/demos/main/css/style.css" rel="stylesheet">
    <link href="/resources/static/inspinia/css/bootstrap.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/css/plugins/bootstrapSocial/bootstrap-social.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/css/plugins/datapicker/datepicker3.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/css/plugins/select2/select2.min.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/css/plugins/select2/select2-bootstrap4.min.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/css/plugins/fullcalendar/fullcalendar.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/css/plugins/fullcalendar/fullcalendar.print.css?v=1716528579" rel="stylesheet" media="print">
    <link href="/resources/static/inspinia/css/plugins/slick/slick-theme.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/noticejs/css/animate.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/noticejs/dist/noticejs.css?v=1716528579" rel="stylesheet" />
    <link href="/resources/static/inspinia/css/plugins/iCheck/custom.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/css/plugins/summernote/summernote-bs4.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/css/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/css/plugins/sweetalert/sweetalert.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/plugin/fullcalendar/lib/main.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/plugin/jQuerySwwetAlert/dist/sweetalert2.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/plugin/jquerygrowl-notification/colored-theme.min.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/css/animate.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/css/style.css?v=1716528579" rel="stylesheet">

    <!-- user css -->
    <link href="/resources/static/css/common.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/css/denb.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/assets/fonts/fontawesome/css/fontawesome-all.min.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/assets/fonts/simple-line-icons/css/simple-line-icons.css?v=1716528579" rel="stylesheet">
    <link href="/resources/static/inspinia/font-awesome/css/font-awesome.css?v=1716528579" rel="stylesheet">

    <!-- js -->
    <!-- 브라우저 판단 -->
    <script src="/resources/static/plugin/anti-selfish-browser/Browser.js"></script>
    <script src="/resources/static/plugin/anti-selfish-browser/anti-selfish-browser.js"></script>

    <!-- jquery -->
    <script src="/resources/static/inspinia/js/jquery-3.1.1.min.js?v=1716528579"></script>
    <script src="/resources/static/js/common.js?v=1716528579"></script>
    <script src="/resources/static/inspinia/js/plugins/sweetalert/sweetalert.min.js?v=1716528579"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    

    <!-- sound -->
    <audio id="audio" src="/resources/static/img/notify.wav"></audio>

</head>

<body class="  bg-light">
    <link href="https://denb.co.kr/inspinia/css/plugins/slick/slick.css" rel="stylesheet">
    <link href="/resources/static/inspinia/css/plugins/slick/slick-theme.css" rel="stylesheet">
    <link href="/resources/static/app/demos/main/css/style.css" rel="stylesheet">
    <style>
        .user_auth_overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 200000;
        }

        .user_auth_modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 50px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            z-index: 200001;
        }

        .user_auth_close-btn1 {
            cursor: pointer;
            font-size: 20px;
            position: absolute;
            top: 10px;
            left: 10px;
        }

        .user_auth_close-btn2 {
            cursor: pointer;
            font-size: 20px;
            position: absolute;
            top: 10px;
            right: 10px;
        }


        .swiper-container {
            width: 100%;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .swiper-slide img {
            width: 100%;
            height: auto;
            display: block;
        }

        .column {
            flex: 1;
            margin: 10px;
        }

        .column img {
            max-width: 100%;
            height: auto;
        }

        .fa-reserv:before {
            content: "\f073"
        }

        .fa-checkin:before {
            content: "\f543"
        }

        .fa-hugi:before {
            content: "\f27a"
        }

        .fa-talks:before {
            content: "\e068"
        }

        .fa-assistants:before {
            content: "\f4c4"
        }

        .fa-coin:before {
            content: "\f4c0"
        }

        .fa-coupon:before {
            content: "\f145"
        }

    </style>
    <div class="user_auth_overlay" id="user_auth_overlay" onclick="close_user_auth_modal()"></div>
    <div class="user_auth_modal" id="user_auth_modal">
        <div style='border-bottom: 2px solid #eee;margin-left:-40px;margin-right:-40px;'>
            <span class="user_auth_close-btn1">본인인증</span> <span class="user_auth_close-btn2"
                onclick="close_user_auth_modal()">&times;</span>
        </div>
        <br />
        <h3>
            <유효시간>
                </h2>
                <p>
                <table>
                    <!--
            <tr>
                <td><input type="radio" id="open_user_auth_type_1" name="open_user_auth_type" value="1" style='width:30px;height:30px;'/></td>
                <td>1차유효</td>
            </tr>
-->
                    <tr>
                        <td><input type="radio" id="open_user_auth_type_2" name="open_user_auth_type" value="300"
                                style='width:30px;height:30px;' /></td>
                        <td>5분유효</td>
                    </tr>
                    <tr>
                        <td><input type="radio" id="open_user_auth_type_3" name="open_user_auth_type" value="600"
                                style='width:30px;height:30px;' /></td>
                        <td>10분유효</td>
                    </tr>
                    <tr>
                        <td><input type="radio" id="open_user_auth_type_4" name="open_user_auth_type" value="900"
                                style='width:30px;height:30px;' /></td>
                        <td>30분유효</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td id="open_user_auth_type_msg"></td>
                    </tr>
                </table>
                </p>
                <br />
                <div style='border-bottom: 2px solid #eee;margin-left:-40px;margin-right:-40px;'>
                </div>
                <br />
                <div style="width:100%;text-align:center;"><input type="button" id="open_user_auth_submit"
                        name="open_user_auth_submit" value="인증" /></div>
    </div>
    <script>

        function open_user_auth_modal(callback, link, fun_code) {
            document.getElementById('user_auth_overlay').style.display = 'block';
            document.getElementById('user_auth_modal').style.display = 'block';
            //callback(link);
            $('#open_user_auth_submit').click(function () {
                var open_user_auth_type = $('input[name="open_user_auth_type"]:checked').val();
                if (open_user_auth_type)
                    callback(link, open_user_auth_type, fun_code);
            });
        }

        function close_user_auth_modal() {
            document.getElementById('user_auth_overlay').style.display = 'none';
            document.getElementById('user_auth_modal').style.display = 'none';
        }

    </script>
    <script src="https://cert.mobile-ok.com/resources/js/index.js"></script>
    <div class="body-overlay"></div>
    <!-- Left panel -->
    <div id="panel-left"></div>
    <!-- Right panel -->
    <div id="panel-right"></div>
    <!-- Social Icons Popup -->
    <div id="popup-social"></div>
    <!-- Alert -->
    <div id="popup-alert"></div>
    <div class="page page--main" data-page="main">
        <!-- HEADER -->
        <header class="header header--page header--fixed bg-info">
            <div class="header__inner">
                <div class="header__icon header__icon--menu open-panel" data-panel="left">
                    <span></span><span></span><span></span><span></span><span></span><span></span></a>
                </div>
                <div class="h5 no-margins">덴비치과</div>
                <div class="header__icon open-panel" data-panel="right"></div>
            </div>
        </header>
        <!-- PAGE CONTENT -->
        <div class="page__content page__content--with-header page__content--with-bottom-nav">
            <!-- Slide Center -->

            <div class='widget bg-success m-b'>
                <div class="row form-row">
                    <div class="col-auto">
                        <button class="btn btn-info btn-circle hidden" type="button"><i class="fa fa-user"></i></button>
                    </div>
                    <div class="col">
                        <ol class="breadcrumb h5">
                            <li class="breadcrumb-item">
                                최지우 님 안녕하세요 ${mypageTokenDto.jsonStr} 
                                ${mypageTokenDto.token}
                            </li>
                        </ol>
                    </div>
                </div>
            </div>

            <!-- 슬러이더 -->

            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="slider_01.jpg" alt="Image 1"></div>
                </div>
                <!-- Add Pagination -->
                <div class="swiper-pagination"></div>
                <!-- Add Navigation -->
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
            <!-- 슬러이더 -->

            <div class="row form-row cards">
                <div class="col-xl-3 col-md-6 col-sm-6 col-6">
                    <div class="widget mb-3 pointer" onclick="location.href='patient_mypage_reserve_form_self.html'">
                        <div class="widget-body">
                            <div class="float-right">
                                <i class="fa fa-reserv fa-2x text-info"></i>
                            </div>
                            <h3 class="text-black font-bold text-info">예약신청 </h3>
                            <h4 class="">
                                <font class='text-bold text-'>1</font> 건
                            </h4>
                            <p class="mb-0 text-muted">
                                <span class="text-nowrap">예약신청하기</span>
                            </p>
                        </div> <!-- end widget-body-->
                    </div>
                </div> <!-- end col-->
                <div class="col-xl-3 col-md-6 col-sm-6 col-6">
                    <div class="widget mb-3 pointer" onclick="location.href='patient_mypage_cure.html'">
                        <div class="widget-body">
                            <div class="float-right">
                                <i class="fa fa-checkin fa-2x text-info"></i>
                            </div>
                            <h3 class="text-black font-bold text-info">접수이력 </h3>
                            <h4 class="">
                                <font class='text-bold text-'>1</font> 건
                            </h4>
                            <p class="mb-0 text-muted">
                                <span class="text-nowrap">접수이력 확인</span>
                            </p>
                        </div> <!-- end widget-body-->
                    </div>
                </div> <!-- end col-->
                <div class="col-xl-3 col-md-6 col-sm-6 col-6">
                    <div class="widget mb-3 pointer" onclick="location.href='patient_mypage_contact.html'">
                        <div class="widget-body">
                            <div class="float-right">
                                <i class="fa fa-hugi fa-2x text-info"></i>
                            </div>
                            <h3 class="text-black font-bold text-info">후기작성</h3>
                            <h4 class="">
                                <font class='text-bold text-'>1</font> 건
                            </h4>
                            <p class="mb-0 text-muted">
                                <span class="text-nowrap">방문내역 확인</span>
                            </p>
                        </div> <!-- end widget-body-->
                    </div>
                </div> <!-- end col-->
                <div class="col-xl-3 col-md-6 col-sm-6 col-6">
                    <div class="widget mb-3 pointer" onclick="location.href='patient_mypage_consulting.html'">
                        <div class="widget-body">
                            <div class="float-right">
                                <i class="fa fa-talks fa-2x text-info"></i>
                            </div>
                            <h3 class="text-black font-bold text-info">내 상담현황</h3>
                            <h4 class="">
                                <font class='text-bold text-'>1</font> 건
                            </h4>
                            <p class="mb-0 text-muted">
                                <span class="text-nowrap">방문내역 확인</span>
                            </p>
                        </div> <!-- end widget-body-->
                    </div>
                </div> <!-- end col-->
                <div class="col-xl-3 col-md-6 col-sm-6 col-6">
                    <div class="widget mb-3 pointer" onclick="location.href='patient_mypage_secretary.html'">
                        <div class="widget-body">
                            <div class="float-right">
                                <i class="fa fa-assistants fa-2x text-info"></i>
                            </div>
                            <h3 class="text-black font-bold text-info">마이비서</h3>
                            <h4 class="">
                                <font class='text-bold text-'>1</font> 건
                            </h4>
                            <p class="mb-0 text-muted">
                                <span class="text-nowrap">방문내역 확인</span>
                            </p>
                        </div> <!-- end widget-body-->
                    </div>
                </div> <!-- end col-->
                <div class="col-xl-3 col-md-6 col-sm-6 col-6">
                    <div class="widget mb-3 pointer" onclick="alert('오픈예정입니다');">
                        <div class="widget-body">
                            <div class="float-right">
                                <i class="fa fa-coupon fa-2x text-info"></i>
                            </div>
                            <h3 class="text-black font-bold text-info">쿠폰함</h3>
                            <h4 class="">
                                <font class='text-bold text-'>1</font> 건
                            </h4>
                            <p class="mb-0 text-muted">
                                <span class="text-nowrap">상담내역 확인</span>
                            </p>
                        </div> <!-- end widget-body-->
                    </div>
                </div> <!-- end col-->
                <!-- <div class="col-xl-3 col-md-12 col-sm-6 col-0">
                    <div class="widget mb-3 pointer" onclick="location.href='patient_mypage_implement.html'">
                        <div class="widget-body">
                            <div class="float-right">
                                <i class="fa fa-pencil fa-2x text-info"></i>
                            </div>
                            <h3 class="text-black font-bold text-info">병원에서 안내자료</h3>
                            <h4 class="">
                                <font class='text-bold text-danger rounded-pill'>1</font> 건
                            </h4>
                            <p class="mb-0 text-muted">
                                <span class="text-nowrap">수행하기</span>
                            </p>
                        </div> 
                    </div>
                </div> -->

            </div>

            <!-- <div class="col-xl-3 col-md-12 col-sm-6 col-0">
                <div class="widget mb-3 pointer" onclick="location.href='patient_mypage_implement.html'">
                    <div class="widget-body">
                        <div class="float-right">
                            <i class="fa fa-pencil fa-2x text-info"></i>
                        </div>
                        <h3 class="text-black font-bold text-info">병원에서 안내자료</h3>
                        <h4 class="">
                            <font class='text-bold text-danger rounded-pill'>1</font> 건
                        </h4>
                        <p class="mb-0 text-muted">
                            <span class="text-nowrap">수행하기</span>
                        </p>
                    </div> 
                </div>
            </div>  -->
            <div class="row form-row">
                <div class="col-6">
                    <div class="widget border-0 bg-info pointer" location.href='patient_mypage_reserve_form_self.html'">
                        <div class="row">
                            <div class="col-4">
                                <i class="fa fa-map-marker fa-3x"></i>
                            </div>
                            <div class="col-8 text-right">
                                <span> Navigation </span>
                                <h3 class="font-bold">오시는 길</h2>
                            </div>
                        </div>
                    </div> 
                </div>
                <div class="col-6">
                    <div class="widget border-0 bg-success pointer" onclick="window.open('http://bonplant.co.kr/#bon6', '_blank')">
                        <div class="row">
                            <div class="col-4">
                                <i class="fa fa-hospital-o -dark fa-3x"></i>
                            </div>
                            <div class="col-8 text-right">
                                <span> About US </span>
                                <h3 class="font-bold">가격확인</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="bottom-toolbar" class="bottom-toolbar hidden ">
        <div class="bottom-navigation ">
            <div class="row no-gutters hei-60 border-top">
                <center class="col align-self-center">
                    <i class="fa fa-home block m-0"></i>
                    <small>HOME</small>
                </center>
                <center class="col align-self-center border-left">
                    <i class="fa fa-calendar block m-0"></i>
                    <small>예약</small>
                </center>
                <center class="col align-self-center border-left">
                    <i class="fa fa-pencil block m-0"></i>
                    <small>수행</small>
                </center>
                <center class="col align-self-center border-left">
                    <i class="fa fa-question-circle block m-0"></i>
                    <small>문의</small>
                </center>
            </div>
        </div>
        <ul class="nav bottom-navigation w-100 board-top justify-content-center">
            <li class=" text-center border-left hei-80 justify-content-center">
                <i class="fa fa-home block m-0 justify-content-center"></i>
                <small>HOME</small>
            </li>
            <li class="col text-center border-left hei-80 align-items-center">
                <a href="../performance/cure_index.php" class="align-items-center">
                    <i class="fa fa-calendar block m-0 align-items-center"></i>
                </a>
            </li>
            <li class="col text-center border-left border-right hei-80">
                <a href="../reserv/reserv_index.php">
                    <i class="fa fa-clock-o block m-0"></i>
                </a>
            </li>
            <li class="col text-center hei-80">
                <a href="../patient/arrange_new.php">
                    <i class="fa fa-question-circle "></i>
                </a>
            </li>
        </ul>
    </div>

    <!-- Social Icons Popup -->
    <div id="popup-social"></div>
    <!-- Alert -->
    <div id="popup-alert"></div>
    <!-- Notifications -->
    <div id="popup-notifications"></div>
    </div>
    </div>
    <!-- end warrper -->
    <!-- 알림팝업창 -->
    <div class="modal fadexxx bd-example-modal-xl" id="modalPopupXl" tabindex="-5" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true" data-hiddenevent="" data-trigger="">
        <div class="modal-dialog modal-xl" id="modalContentXl">
        </div>
    </div>
    <div class="modal fadexxx bd-example-modal-lg" id="modalPopupLg" tabindex="-4" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true" data-hiddenevent="" data-trigger="">
        <div class="modal-dialog modal-lg" id="modalContentLg">
        </div>
    </div>
    <div class="modal fadexxx bd-example-modal-sm" id="modalPopupSm" tabindex="-2" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true" data-hiddenevent="" data-trigger="">
        <div class="modal-dialog" id="modalContentSm">
        </div>
    </div>
    <div class="modal fadexxx bd-example-modal" id="modalPopup" tabindex="-3" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true" data-hiddenevent="" data-trigger="">
        <div class="modal-dialog" id="modalContent">
        </div>
    </div>


    <!-- denb -->
    <script src="https://denb.co.kr/js/denb-dentist-common.js?v=1716528579"></script>
    <!-- common -->
    <script src="https://denb.co.kr/inspinia/js/popper.min.js?v=1716528579"></script>
    <script src="https://denb.co.kr/inspinia/js/bootstrap.js?v=1716528579"></script>
    <script src="https://denb.co.kr/inspinia/js/plugins/metisMenu/jquery.metisMenu.js?v=1716528579"></script>
    <script src="https://denb.co.kr/inspinia/js/plugins/slimscroll/jquery.slimscroll.min.js?v=1716528579"></script>
    <script src="https://denb.co.kr/inspinia/js/plugins/datapicker/bootstrap-datepicker.min.js?v=1716528579"></script>
    <script
        src="https://denb.co.kr/inspinia/js/plugins/datapicker/bootstrap-datepicker.kr.min.js?v=1716528579"></script>
    <script
        src="https://denb.co.kr/inspinia/js/plugins/touchspin/jquery.bootstrap-touchspin.min.js?v=1716528579"></script>
    <script src="https://denb.co.kr/inspinia/js/plugins/select2/js/select2.full.min.js?v=1716528579"></script>
    <script src="https://denb.co.kr/inspinia/js/plugins/summernote/summernote-bs4.js?v=1716528579"></script>
    <script src="https://denb.co.kr/inspinia/js/plugins/summernote/lang/summernote-ko-KR.min.js?v=1716528579"></script>
    <script
        src="https://denb.co.kr/inspinia/js/plugins/dualListbox/jquery.bootstrap-duallistbox.js?v=1716528579"></script>
    <script src="https://denb.co.kr/inspinia/js/plugins/typehead/bootstrap3-typeahead.min.js?v=1716528579"></script>
    <script
        src="https://denb.co.kr/inspinia/js/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js?v=1716528579"></script>
    <script src="https://denb.co.kr/inspinia/js/plugins/blueimp/jquery.blueimp-gallery.min.js?v=1716528579"></script>
    <!-- Clipboard -->
    <script src="https://denb.co.kr/inspinia/js/plugins/clipboard/clipboard.min.js?v=1716528579"></script>
    <!-- BS custom file -->
    <script
        src="https://denb.co.kr/inspinia/js/plugins/bs-custom-file/bs-custom-file-input.min.js?v=1716528579"></script>
    <!-- iCheck -->
    <!-- parsley Js -->
    <script src="https://denb.co.kr/js/parsley/parsley.extend.js?v=1716528579"></script>
    <script src="https://denb.co.kr/js/parsley/parsley.min.js?v=1716528579"></script>

    <script src="https://denb.co.kr/inspinia/js/inspinia.js?v=1716528579"></script>
    <script src="https://denb.co.kr/inspinia/js/plugins/pace/pace.min.js?v=1716528579"></script>
    <script src="https://denb.co.kr/inspinia/js/plugins/jqueryMask/jquery.mask.min.js?v=1716528579"></script>
    <!-- chart Js -->
    <script src="https://denb.co.kr/inspinia/js/plugins/peity/jquery.peity.min.js?v=1716528579"></script>
    <script src="https://denb.co.kr/inspinia/js/demo/peity-demo.js?v=1716528579"></script>

    <!-- Js Plugin-->
    <script src="https://denb.co.kr/plugin/jquerygrowl-notification/growl-notification.min.js?v=1716528579"></script>
    <script src="https://denb.co.kr/plugin/jquerygrowl-notification/growl-notification.min.js?v=1716528579"></script>
    <script src="https://denb.co.kr/plugin/spectrum-2.0.8/dist/spectrum.min.js?v=1716528579"></script>

    <!-- Input mask Js -->
    <script src="https://denb.co.kr/assets/plugins/inputmask/js/inputmask.min.js?v=1716528579"></script>
    <script src="https://denb.co.kr/assets/plugins/inputmask/js/jquery.inputmask.min.js?v=1716528579"></script>
    <script src="https://denb.co.kr/assets/plugins/inputmask/js/autoNumeric.js?v=1716528579"></script>
    <script src="https://denb.co.kr/assets/js/pages/form-masking-custom.js?v=1716528579"></script>
    <script src="https://denb.co.kr/assets/js/pages/form-select-custom.js?v=1716528579"></script>
    <script src="https://denb.co.kr/inspinia/js/plugins/sweetalert/sweetalert.min.js?v=1716528579"></script>
    <script src="../assets/js/pages/form-select-custom.js"></script>

    <script src="https://denb.co.kr/inspinia/noticejs/dist/notice.js?v=1716528579"></script>
    <script src="https://denb.co.kr/js/im.js?v=1716528579"></script>
    <script src="https://denb.co.kr/js/app.js?v=1716528579"></script>

    <script>
        $(document).ready(function () {
            try {
                swal.close();
            } catch (error) {
                console.error("An error occurred:", error.message);
            }
        });
        // Open close small chat

        function focusImage(imgId) {
            document.getElementById(imgId).focus();
        }

        $('.open-small-chat, .open-small-chat-x').on('click', function (e) {
            $('#pateint_memo_log_cnt').html(0);
            $('#pateint_memo_log_cnt').removeClass("badge-danger");
            $('#pateint_memo_log_cnt').addClass("badge-white");
            fnLoadWidget("widget_patient_memo_chatting_list_small");
            e.preventDefault();
            $(this).children().toggleClass('fa-comments').toggleClass('fa-times');
            $('.small-chat-box').toggleClass('active');
        });

        $('#modalPopup, #modalPopupSm, #modalPopupLg, #modalPopupXl').on('hidden.bs.modal', function () {
            var hiddenevent = $(this).find('div').attr('data-hiddenevent');
            var trigger = $(this).find('div').attr('data-trigger');
            hiddenevent && eval(hiddenevent);
            trigger && $(trigger).trigger("click");
            console.log("trigger:" + trigger);
            $(this).find('.modal-dialog').html('');
            log_modal_reset();
            document.body.style.overflow = "";
            $('.sp-container').remove();
            $.each($("div.modal"), function (i, e) {
                if ($(this).hasClass('show')) {
                    $(document.body).addClass('modal-open');
                }
            });
            alert_popup_auto = "n";

        }).on('show.bs.modal', function () {
            var modal = $(this);
            $('.popover').remove();
            var renameInput = modal.find('#or_search_text');
            renameInput.focus();
            alert_popup_auto = "y";
        }).on('shown.bs.modal', function () {
            setTimeout(function () {
                swal.close()
            }, 500); // 1초후 로딩화면닫기
        })

        function modal_close() {
            $('#modalPopupXl, #modalPopupLg, #modalPopup, #modalPopupSm').modal('hide');
            $('#modalContentXl, #modalContentLg, #modalContent, #modalContentSm').html('');
            log_modal_reset();
        }

        function fnSearchModal(obj, type) {
            params = $("#" + obj).serialize()
            switch (type) {
                case 'reserve_list':
                    var url = "https://denb.co.kr/include/patient_reserve_list.php";
                    break;
            }
            url && $.ajax({
                url: url,
                type: "POST",
                data: params,
                dataType: "text",
                success: function (data) {
                    $('#modalContentXl').html(data);
                    $('#modalPopupXl').modal('show');
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }

        //예약하기
        function fnReserv(patient_idx, regist_dt = '', field = '') {
            var params = {
                patient_idx: patient_idx,
                regist_dt: regist_dt,
                field: field,
            };
            $.ajax({
                url: "../reserv/reserv_form.php",
                type: "POST",
                data: params,
                dataType: "text",
                success: function (data) {
                    $('#modalContentXl').html(data);
                    $('#modalPopupXl').modal('show');
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }

        //카카오톡 발송
        function fnKakaoSend(idx, name, tel, type) {
            var params = {
                patient_idx: idx,
                type: type
            };

            if (type == '접수') {
                tmplId = 'order01';

                msg = "[주식회사 덴탈비서]";
                msg += "안녕하세요. " + name + "님!";
                msg += "주식회사 덴탈비서에 접수 완료 되였습니다.";
                msg += "잠시만 기다려 주세요";
                msg += "감사합니다.";
            }

            var request_url = "https://alimtalk-api.bizmsg.kr/v2/sender/send";
            var request_isAsync = false;
            var request;

            var sendArray = [];
            var sendObj = {};

            sendObj['message_type'] = 'at';
            sendObj['phn'] = tel;
            sendObj['profile'] = 'c7e3194c1837cb3e14bfbc997e24b437ff58a4f6';
            sendObj['tmplId'] = tmplId;
            sendObj['msg'] = msg;

            sendArray.push(sendObj);
            var sendData = JSON.stringify(sendArray);

            $.ajax({
                type: "POST",
                //dataType : "json",
                dataType: "text",
                headers: {
                    'Content-Type': 'application/json',
                    'userid': 'dentalseed'
                },
                url: request_url,
                data: sendData,
                success: function (data) {
                    //document.getElementById("response").value = JSON.stringify(data);
                    $.each(JSON.parse(data), function (index, entry) {
                        if (entry["code"] == 'success') {
                            fnKakaoResult(idx, type, entry["code"]);
                        }
                    });
                },
                error: function (request, status, error) {
                    var msg = "ERROR : " + request.status + "<br>"
                    msg += +"내용 : " + request.responseText + "<br>" + error;
                    console.log(msg);
                }
            });
        }

        //카카오톡 발송결과 저장
        function fnKakaoResult(idx, type, result) {
            var params = {
                patient_idx: idx,
                type: type,
                result: result
            };

            $.ajax({
                url: "../kakao/send_proc.php",
                type: "POST",
                data: params,
                //contentType: "application/json; charset=utf-8;",
                dataType: "text",
                success: function (data) {

                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }

        /* ### 문자전송 ### */
        function fnSms(smsmode, sms_target = 'user') {
            var form = $("#searchform");
            var smsmode = smsmode ? smsmode : "template";
            var params = {
                smsmode: smsmode,
                sms_target: sms_target
            };
            url = "../sms/send_form.php";
            console.log(params);
            $.ajax({
                url: url,
                type: "POST",
                data: params,
                dataType: "text",
                success: function (data) {

                    $('#modalContentXl').html(data);
                    $('#modalPopupXl').modal('show');
                    $('#writeFormModal').parsley();
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }

        $("#todo").sortable({
            connectWith: ".connectList",
            update: function (event, ui) {
                var todo = $("#todo").sortable("toArray");
                console.log(todo);
                var json_str = window.JSON.stringify(todo);
                // $('.output').html(json_str);
            }
        })

        Date.prototype.format = function (fmt) {
            var o = {
                "M+": this.getMonth() + 1, //月份 
                "d+": this.getDate(), //日 
                "h+": this.getHours(), //小时 
                "m+": this.getMinutes(), //分 
                "s+": this.getSeconds(), //秒 
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
                "S": this.getMilliseconds() //毫秒 
            };
            if (/(y+)/.test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            }
            for (var k in o) {
                if (new RegExp("(" + k + ")").test(fmt)) {
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                }
            }
            return fmt;
        }

        function im_notify(data) {
            var toast = $('.toast');
            $('.toast .toast-body').html("새로운 알림 " + data + "건")
            setTimeout(function () {
                toast.toast({
                    delay: 5000,
                    animation: true
                });
                toast.toast('show');
                var audio = $("#audio")[0];
                // audio.play();
                /* if (media != null) {
                    media.pause();
                    media = null;
                }
                if (window.HTMLAudioElement) {
                    media.src = "../img/notify.wav";
                    media.play();
                } */
            }, 1000);

        }

        // 스크롤 따라 다니기
        $(window).bind("scroll", function () {
            let toast = $('.toast');
            toast.css("top", window.pageYOffset + 20);
        });


        function fnLoadWidget(taget, type, filter_key = '', page = 1) {
            var $this = $("#" + taget),
                val, data, form, params = {},
                event, event_param, $form, container, filter_key;
            container = $this.attr('id');
            if (container) {
                val = $this.val(),
                    data = $this.data(),
                    form = $this.data('form'),
                    !type && (type = taget),
                    !filter_key && (filter_key = "")
                form && $(form) && ($form = $(form).serializeArray());
                switch (type) {
                    case "multi_search": // 검색
                        var url = "https://denb.co.kr/dailynote/multi_search.php";
                        break;
                    case "static": // 통계바
                        var url = "https://denb.co.kr/dailynote/static.ajax.php";
                        break;
                    case "patient_invoice_form": // 현금영수증발급
                        var url = "https://denb.co.kr/patient/patient_invoice_form.php";
                        break;
                    case "item_form_re_m":
                        var url = "https://denb.co.kr/consulting/item_form_re_m.php";
                        break;
                    case "item_form_su":
                        var url = "https://denb.co.kr/consulting/item_form_su.php";
                        break;
                    case "reserv_form":
                        var url = "https://denb.co.kr/reserv/reserv_form.php";
                        break;
                    case "inc_toothlist_check":
                        var url = "https://denb.co.kr/include/inc_toothlist_check.php";
                        break;
                    case "dentist_form_data_list":
                        var url = "https://denb.co.kr/widget/widget_df_data_list.php";
                        break;
                    // 덴비폼
                    case "patient_arrange_form":
                        var url = "https://denb.co.kr/patient/arrange_form.php";
                        break;
                    case "dentist_form_data_form":
                        var url = "https://denb.co.kr/widget/dentist_form_data_list.php";
                        break;
                    // 덴비옵션
                    case "dentist_cf_option_list": // 옵션
                        var url = "https://denb.co.kr/dentist/dentist_cf_option_list.php";
                        break
                    case "arrange_list_new_push": // 
                        var url = "https://denb.co.kr/patient/arrange_list_new_push.php";
                        break
                    case "arrange_list_new": // 
                        var url = "https://denb.co.kr/patient/arrange_list_new.php";
                        break
                    case "arrange_list_new_pro": // 
                        var url = "https://denb.co.kr/patient/arrange_list_new_pro.php";
                        break
                    case "arrange_list_doctor": // 
                        var url = "https://denb.co.kr/patient/arrange_list_doctor.php";
                        break
                    case "arrange_list_cure": // 
                        var url = "https://denb.co.kr/patient/arrange_list_cure.php";
                        break
                    case "arrange_list_consulting": // 
                        var url = "https://denb.co.kr/patient/arrange_list_consulting.php";
                        break
                    case "arrange_list_complain": // 
                        var url = "https://denb.co.kr/patient/arrange_list_complain.php";
                        break
                    case "arrange_list_cura_plan": // 
                        var url = "https://denb.co.kr/patient/arrange_list_cura_plan.php";
                        break
                    case "arrange_list_cure": // 
                        var url = "https://denb.co.kr/patient/arrange_list_cure.php";
                        break
                    case "arrange_list_reserve": // 
                        var url = "https://denb.co.kr/patient/arrange_list_reserve.php";
                        break
                    case "patient_interview": // 
                        var url = "https://denb.co.kr/interview/tab01.php";
                        break;
                    case "plan_view":
                    case "briefing_view":
                        var url = "https://denb.co.kr/consulting/consulting_print.php";
                        break;
                    case "cure": // 신환문의
                        var url = "https://denb.co.kr/consulting/item_form_cure_m.php";
                        break;
                    case "consulting_form_modal":
                        var url = "https://denb.co.kr/consulting/consulting_form_modal.php"; // 빠른상담관리
                        break;
                    case "cure_order_form_modal":
                        var url = "https://denb.co.kr/performance/cure_order_form_modal.php"; // 기공의뢰
                        break;
                    case "consulting_list":
                        var url = "https://denb.co.kr/consulting/consulting_list.php"; // 상담비서 리스트
                        break;
                    case "consulting_form1":
                    case "consulting_form2":
                    case "consulting_form3":
                        var url = "https://denb.co.kr/consulting/" + type + ".php";
                        break;
                    case "cure_list":
                        var url = "https://denb.co.kr/performance/cure_list.php";
                        break;
                    case "patient_pay_plan":
                    case "patient_reserver_plan":
                    case "patient_pay_form":
                    case "patient_payment":
                    case "patient_payment_self":
                    case "patient_invoice_form":
                    case "patient_consulting_amt":
                    case "patient_cure_label": //환자진료라벨
                    case "patient_consulting_label": //환자상담라벨
                        var url = "https://denb.co.kr/performance/arrange_order_form.php";
                        break;
                    case "arrange_postit":
                        var url = "https://denb.co.kr/performance/arrange_postit.php";
                        break;
                    case "arrange_postit_push": // 포스트잇 푸시
                        var url = "https://denb.co.kr/performance/arrange_postit_push.php";
                        break;
                    case "patient_action_plenment":
                        var url = "https://denb.co.kr/patient/implement_action_form.php";
                        break;
                    case "patient_action_plenment_consulting":
                        var url = "https://denb.co.kr/consulting/implement_action_form.php";
                        break;
                    case "widget_cure_list":
                        var url = "https://denb.co.kr/widget/widget_cure_list.php";
                        break;
                    case "arrange_chair_item":
                        var url = "https://denb.co.kr/patient/arrange_item_ajax.php";
                        break;
                    case 'chair_info':
                    case "chair":
                        var is_scrap = $this.find('input:radio[name="is_scrap"]:checked').val();
                        is_scrap && (data['is_scrap'] = is_scrap);
                        console.log(is_scrap);
                        var url = "https://denb.co.kr/patient/arrange_chair_info_new.php";
                        break;
                    case "widget_board_list":
                        var url = "https://denb.co.kr/widget/widget_board_list.php";
                        break;
                    case "call_tiem_form":
                        var url = "https://denb.co.kr/widget/widget_tab_patient_call.php";
                        break;
                    case "patient_file":
                        var url = "https://denb.co.kr/widget/widget_patient_file.php";
                        break;
                    case "patient_memo":
                        var url = "https://denb.co.kr/widget/widget_patient_memo.php";
                        break;
                    case "patient_memo_charting":
                        // params['memo_field'] = "charting";
                        var url = "https://denb.co.kr/widget/widget_patient_memo_chatting.php";
                        break;
                    case "patient_memo_next":
                        params['memo_field'] = "next";
                        var url = "https://denb.co.kr/widget/widget_patient_memo.php";
                        break;
                    case "ag_list":
                        var url = "https://denb.co.kr/widget/widget_ag_list.php";
                        break;
                    case "plan_list":
                        var url = "https://denb.co.kr/widget/widget_plan_list.php";
                        break;
                    case "plan_form": // 치료계획
                        var url = "https://denb.co.kr/consulting/plan_form.php";
                        break;
                    case "plan_formBody": // 치료계획
                        var url = "https://denb.co.kr/consulting/plan_formBody.php";
                        break;
                    case "work_index": // 치료계획
                        var url = "https://denb.co.kr/work/list_new.php";
                        break;
                    case "stock_cate_select": // 치료계획
                        var url = "https://denb.co.kr/order/stock_cate_select.php";
                        break;
                    case "work_item_view": // 협업보기
                        var url = "https://denb.co.kr/work/item_view_ajax.php";
                        break;
                    case "work_tiem_latest": // 업무리스트
                        var url = "https://denb.co.kr/work/item_latest.php";
                        break;
                    case "work_tiem_latest_share": // 외부공유 업무리스트
                        var url = "https://denb.co.kr/work/item_latest_share.php";
                        break;
                    case "work_cate_select": // 협업보기
                        var url = "https://denb.co.kr/work/work_cate_select.php";
                        break;
                    case "widget_tab_work": // 업무리스트
                        var url = "https://denb.co.kr/widget/widget_tab_work.php";
                        break;
                    case "widget_work_history": // 업무리스트
                        var url = "https://denb.co.kr/widget/widget_work_history.php";
                        break;
                    case "widget_work_data": // 업무리스트
                        var url = "https://denb.co.kr/widget/widget_work_data.php";
                        break;
                    case "user_select":
                        url = "https://denb.co.kr/user/ajax.user_select.php";
                        break;
                    case "sms_send_form":
                        url = "https://denb.co.kr/sms/send_form.php";
                        break;
                    case "patient_memo_list":
                        url = "https://denb.co.kr/patient/patient_memo_list.php";
                        break;
                    case "widget_patient_memo":
                    case "widget_patient_ag_memo":
                    case "widget_patient_re_memo":
                    case "widget_ag_list_table_memo":
                    case "widget_re_list_table_memo":
                        url = "https://denb.co.kr/widget/widget_patient_memo.php";
                        break;
                    case "toothlist":
                    case "toothlist_re":
                    case "toothlist_ag":
                        url = "https://denb.co.kr/include/inc_toothlist_new.php";
                        break;
                    case "widget_ag_list_table_ops":
                        url = "https://denb.co.kr/widget/widget_re_list_table.php";
                        break;
                    case "widget_sms_temp":
                    case "widget_sms_temp_dentist":
                    case "widget_sms_temp_common":
                        var url = "https://denb.co.kr/widget/widget_sms_temp.php";
                        break;
                    default:
                        var url = "https://denb.co.kr/widget/" + type + ".php";
                        break;
                }
                $this.parent(".loading-container").addClass('sk-loading'); // 로딩추가
                $.each(data, function (i, e) {
                    params[i] = e;
                });
                $form && $.each($form, function () {
                    params[this.name] = this.value;
                });
                params['filter_key'] = filter_key;
                params['page'] = page;
                params['type'] = type;
                params['crudmode'] && (params['crudMode'] = params['crudmode']);
                console.log("fnLoadWidget:" + taget + "url:" + url);
                console.log(params);
                url && $.ajax({
                    url: url,
                    type: "POST",
                    cache: false,
                    dataType: "text",
                    data: params,
                    success: function (data) {
                        $this.html(data);
                        $this.parent(".loading-container").removeClass('sk-loading'); // 로딩삭제
                        switch (type) {
                            case "inc_toothlist_check":
                                /* var ds = new DragSelect({
                                    area: document.getElementById('teechList_check'),
                                    selectables: document.getElementsByClassName('dragitem'),
                                    multiSelectMode: true,
                                    selectedClass: 'active',
                                    callback: function(elements) {
                                        fnAddtooth_new();
                                    },
                                }); */
                                break;
                        }
                    },
                    error: function (request, status, error) {
                        var msg = "ERROR : " + request.status + "<br>"
                        msg += +"내용 : " + request.responseText + "<br>" + error;
                        console.log(msg);
                    }
                });
            } else {
                return false;
            }
        }

        function fnModalForm(obj) {
            var params = {};
            params = obj;
            params.is_modal = true;
            //#######
            switch (obj.toggle) {
                case 'fnChangeUp':
                    switch (obj.type) {
                        case 'arrange_status': // 상태변경
                            switch (obj.data) {
                                case '접수':
                                    params.type = "widget_tab_patient_order";
                                    break;
                                case '환자호출':
                                    params.type = "chair_info";
                                    break;
                            }
                            break;
                        default:
                            break;
                    }
                    break;
                default:
                    break;
            }
            //#######
            switch (params.type) {
                case "widget_tab_patient_order": // 포스트잇
                    var url = "https://denb.co.kr/widget/widget_tab_patient_order.php";
                    break;
                case 'chair_info':
                    url = "https://denb.co.kr/patient/arrange_chair_info_new.php";
                    break;
                case 'chair_info':
                    url = "https://denb.co.kr/patient/arrange_chair_info_new.php";
                    break;
                case 'widget_edit_form':
                    url = "https://denb.co.kr/widget/widget_edit_form.php";
                    break;
            }
            console.log(params.type);
            console.log(url);
            console.log(params);
            url && $.ajax({
                url: url,
                type: "POST",
                cache: false,
                dataType: "text",
                data: params,
                success: function (data) {
                    var mc = $('#modalContentXl');
                    var mp = $('#modalPopupXl');
                    mc.attr("data-trigger", params.trigger);
                    mc.attr("data-hiddenevent", params.event);
                    mc.html(data);
                    mp.modal('show');
                },
                error: function (request, status, error) {
                    var msg = "ERROR : " + request.status + "<br>"
                    msg += +"내용 : " + request.responseText + "<br>" + error;
                    console.log(msg);
                }
            });
        }

        // 입력폼  MODAL 파업창
        $(document).on('click change', '[data-toggle="fnModalForm"], .fnModalForm', function (e) {
            var $this = $(this),
                url, $form,
                params = {},
                hiddenevent = $this.attr("data-hiddenevent"),
                trigger = $this.data('trigger'),
                data = $this.data(),
                type = $this.data('type'),
                container = $this.data('container'),
                form = $this.data('form');
            w = $this.data('w'),
                is_dual = $this.data('is_dual'),
                val = $this.val();
            var modalPopup = $this.parents(".modal").attr('id');
            var modalConten = $this.parents(".modal-dialog").attr('id');
            form && $(form) && ($form = $(form).serializeArray());
            hiddenevent = hiddenevent ? hiddenevent : "";
            trigger = trigger ? trigger : "";
            switch (type) {
                case "callcenter_form": // 콜센터 수정
                    var url = "https://denb.co.kr/call/callcenter_form.php";
                    break;
                case "callcenter_form": // 콜센터 수정
                    var url = "https://denb.co.kr/call/callcenter_form.php";
                    break;
                case "callcenter_popup": // 콜센터 수행전 팝업
                    var url = "https://denb.co.kr/call/callcenter_popup.php";
                    break;
                case "commission_keyword_setting_form":
                    var url = "https://denb.co.kr/commission/commission_keyword_setting_form.php";
                    break;
                case "dentist_holiday_form":
                    var url = "https://denb.co.kr/dentist/dentist_holiday_form.php";
                    // var url = "../dentist/dentist_holiday_form.php";
                    break;
                case "kakao_template_send_form":
                    var url = "https://denb.co.kr/kakaoSend/kakao_template_send_form.php";
                    sweetLoding('발송 데이터 분석중입니다...');
                    break;
                case "filter_form":
                    var url = "https://denb.co.kr/user/filter_form.php";
                    break;
                case "df_write_view":
                    var url = "https://denb.co.kr/dentist_form/df_write_view.php";
                    break;
                case "template_form_pro":
                    var url = "https://denb.co.kr/sms/template_form_pro.php";
                    break;
                case "template_form":
                    var url = "https://denb.co.kr/sms/template_form.php";
                    break;
                case "patient_search_list":
                    var url = "https://denb.co.kr/include/patient_search_list.php";
                    break;
                case "patient_payment_item_form":
                    var url = "https://denb.co.kr/patient/patient_payment_item_form.php";
                    break;
                case "patient_invoice":
                    var url = "https://denb.co.kr/patient/patient_invoice_form.php";
                    break;
                case "patient_invoice_form":
                    var url = "https://denb.co.kr/patient/patient_invoice_form.php";
                    break;
                case "denb_menu_form":
                    var url = "https://denb.co.kr/adm/denb_menu_form.php";
                    break;
                case "dentist_group_form":
                    var url = "https://denb.co.kr/adm/dentist_group_form.php";
                    break;
                case "denb_cash_cart_form":
                    var url = "https://denb.co.kr/finance/denb_cash_cart_form.php";
                    break;
                case "dentist_self_payment_form":
                    var url = "https://denb.co.kr/finance/dentist_self_payment_form.php";
                    break;
                case "incentive_item_form":
                    var url = "https://denb.co.kr/commission/incentive_item_form.php";
                    break;
                case "patient_mypage_requests_form":
                    var url = "https://denb.co.kr/patient/patient_mypage_requests_form.php";
                    break;
                case "user_reserv_lock_form":
                    var url = "https://denb.co.kr/user/user_reserv_lock_form.php";
                    break;
                case "item_list_sort":
                    hiddenevent = "location.reload()";
                    var url = "https://denb.co.kr/item/item_list_sort.php";
                    break;
                case "requests_self_form":
                    var url = "https://denb.co.kr/call/requests_self_form.php";
                    break;
                case "chair_form":
                    hiddenevent = "location.reload()";
                    var url = "https://denb.co.kr/chair/chair_form.php";
                    break;
                case "chair_sort_form":
                    hiddenevent = "location.reload()";
                    var url = "https://denb.co.kr/chair/chair_sort_form.php";
                    break;
                case "fnPatientOrder":
                    var url = "https://denb.co.kr/performance/order.php";
                    break;
                case "arrange_postit": // 신환문의
                    var url = "https://denb.co.kr/performance/arrange_postit.php";
                    break;
                case "arrange_postit_push": // 포스트잇 푸시
                    var url = "https://denb.co.kr/performance/arrange_postit_push.php";
                    break;
                case "call_requests_form": // 신환문의
                    var url = "https://denb.co.kr/call/requests_form.php";
                    break;
                case "patient_arrange_form": // 접수현황수정
                    var url = "https://denb.co.kr/patient/arrange_form.php";
                    break;
                case "patient_menu":
                    var url = "https://denb.co.kr/patient/patient_menu.php";
                    break;
                case "dentist_form_data_list":
                    var url = "https://denb.co.kr/widget/widget_df_data_list.php";
                    break;
                case "dentist_form_data_form":
                    var url = "https://denb.co.kr/widget/dentist_form_data_list.php";
                    break;
                case "happycall":
                case "recall":
                    var url = "https://denb.co.kr/call/item_form.php";
                    break;
                case "common_code_group":
                    var url = "https://denb.co.kr/common/code_group_form.php";
                    break;
                case "item_info_user":
                    var url = "https://denb.co.kr/item/item_form_user.php";
                    break;
                case "user_schedules":
                    var url = "https://denb.co.kr/personnel/schedules_form.php";
                    break;
                case "user_overtime":
                    var url = "https://denb.co.kr/personnel/overtime_form.php";
                    break;
                case "patient_implement_check":
                case 'implement_form': // 수행
                    var url = "https://denb.co.kr/patient/implement_form.php";
                    break;
                case "product_stock":
                    var url = "https://denb.co.kr/order/stock_form.php";
                    break;
                case "call":
                    var url = "https://denb.co.kr/call/item_form.php";
                    break;
                case 'commute_form': // 수행
                    url = "https://denb.co.kr/personnel/commute_form.php";
                    break;
                case 'consulting_form': // 수행
                    url = "https://denb.co.kr/consulting/consulting_form_modal.php";
                    break;
                case 'patient_complain': // 수행
                    url = "https://denb.co.kr/call/complain_form.php";
                    break;
                case 'stock': // 사이트맵
                    url = "https://denb.co.kr/order/stock_form.php";
                    break;
                case 'stock_log': // 사이트맵
                    url = "https://denb.co.kr/order/stock_item_form.php";
                    break;
                case 'sitemap': // 사이트맵
                    url = "https://denb.co.kr/include/sitemap.php";
                    break;
                case 'statistics_downlaod_form': // 일일보고
                    url = "https://denb.co.kr/statistics/download_form.php";
                    break;
                case 'df_form': // 덴비폼
                    url = "https://denb.co.kr/dentist_form/df_group_form.php";
                    break;
                case 'dd_form': // 덴비폼
                    url = "https://denb.co.kr/dentist_display/dd_group_form.php";
                    break;
                case 'df_item_form': // 덴비폼
                    url = "https://denb.co.kr/dentist_form/df_item_form.php";
                    break;
                case 'dd_item_form': // 덴비폼
                    url = "https://denb.co.kr/dentist_display/dd_item_form.php";
                    break;
                case 'chat':
                    url = "https://denb.co.kr/patient/chat_form.php";
                    break;
                case 'chair_info':
                    url = "https://denb.co.kr/patient/arrange_chair_info_new.php";
                    break;
                case 'widget_tab_patient_order':
                case 'result_amt': // 결정금액 설정
                    url = "https://denb.co.kr/widget/widget_tab_patient_order.php";
                    break;
                case 'widget_patient_introducer':
                    url = "https://denb.co.kr/widget/widget_patient_introducer.php";
                    break;
                case 'patient_form':
                    url = "https://denb.co.kr/patient/patient_form.php";
                    break;
                case 'cure':
                    if (is_dual) {
                        url = "https://denb.co.kr/consulting/item_form_cure_m.php";
                    } else {
                        url = "https://denb.co.kr/consulting/item_form_cure.php";
                    }
                    break;
                case 'cure_primary':
                    url = "https://denb.co.kr/consulting/item_form_cure_primary.php";
                    break;
                case 'cure_order': // 기공의뢰
                    url = "https://denb.co.kr/consulting/item_form_cure_order.php";
                    break;
                case 'recommendation': // 진단추가
                    url = "https://denb.co.kr/consulting/item_form_re.php";
                    break;
                case 'recommendation_m': // 진단추가
                    url = "https://denb.co.kr/consulting/item_form_re_m.php";
                    break;
                case 'agree': // 동의설정
                    url = "https://denb.co.kr/consulting/item_form_ag_m.php";
                    break;
                case 'finance_item': // 상담
                    url = "https://denb.co.kr/finance/item_form.php";
                    break;
                case 're_to_call': // 콜
                case 'arrange_to_call': // 접수TO해피콜
                case 'consulting_to_call': // 상담TO 리콜
                    url = "https://denb.co.kr/call/item_form.php";
                    break;
                case 'requests': // 상담
                    var url = "https://denb.co.kr/call/requests_form.php";
                    break;
                case 'patient_search': // 환자조회
                    var url = "../include/patient_search_list.php";
                    break;
                case "plan":
                case "plan_item":
                    switch (w) {
                        case 'u':
                        case 'cw':
                            url = "https://denb.co.kr/consulting/plan_form_modal.php";
                            break;
                        default:
                            url = "https://denb.co.kr/consulting/item_form_plan.php";
                            break;
                    }
                    break;
                case "plan_step":
                    url = "https://denb.co.kr/consulting/plan_form_step.php";
                    break;
                case "plan_step_common":
                    url = "https://denb.co.kr/consulting/plan_form_step_common.php";
                    break;
                case "plan_list":
                    url = "https://denb.co.kr/widget/widget_plan.php";
                    break;
                case "plan_sort":
                    url = "https://denb.co.kr/consulting/plan_sort.php";
                    break;
                case "plan_user": // 계획생성
                    url = "https://denb.co.kr/consulting/plan_user_form.php";
                    break;
                case "plan_user_list": // 내계획함
                    url = "https://denb.co.kr/consulting/plan_user_list.php";
                    break;
                case "patient_item_value_reset": // 진료행위 리셋팅
                    url = "https://denb.co.kr/dentist/dentist_cf_form.php";
                    break;
                case "reserve_list":
                    url = "https://denb.co.kr/include/patient_reserve_list.php";
                    break;
                case "reserve":
                case "reserve_form":
                    url = "https://denb.co.kr/reserv/reserv_form.php";
                    is_dual = true;
                    break;
                case "reserv_form_action":
                    url = "https://denb.co.kr/reserv/reserv_form_action.php";
                    break;
                case "reserv_kakao_form":
                    url = "https://denb.co.kr/reserv/reserv_kakao_form.php";
                    break;
                case "board":
                    url = "https://denb.co.kr/notice/form.php";
                    break;
                case "board_view":
                    url = "https://denb.co.kr/notice/view.php";
                    break;
                case "patient_mypage_board_view":
                    url = "https://denb.co.kr/patient/patient_mypage_board_view.php";
                    break;
                case "mypage_board_view":
                    url = "https://denb.co.kr/notice/view.php";
                    break;
                case "agreement":
                    url = "https://denb.co.kr/login/register_agreement.php";
                    break;
                case "agreement_dentist":
                    url = "https://denb.co.kr/login/register_agreement_dentist.php";
                    break;
                // WORK 프로젝트 ##########################################
                case "work":
                    url = "https://denb.co.kr/work/form_modal.php";
                    break;
                case "work_item":
                case "work_item_patient":
                    url = "https://denb.co.kr/work/item_form.php";
                    break;
                case "work_cate":
                    url = "https://denb.co.kr/work/work_cate_form.php";
                    break;
                case "work_item_view":
                    url = "https://denb.co.kr/work/item_view.php";
                    break;
                case "work_share_form":
                    url = "https://denb.co.kr/work/work_share_form.php";
                    break;
                case "work_report_view": // 일일보고서 출력
                    var url = "https://denb.co.kr/work/work_report_print.php";
                    break;
                case "stock_cate":
                    url = "https://denb.co.kr/order/stock_cate_form.php";
                    break;
                case "stock_group_form":
                    url = "https://denb.co.kr/order/stock_group_form.php";
                    break;
                //병원 옵션설정 @@@@ 리셋필요
                case "dentist_cf_option":
                    !trigger && (hiddenevent = "location.reload()");
                    url = "https://denb.co.kr/dentist/dentist_cf_option_form.php";
                    break;
                case "company_info":
                    url = "https://denb.co.kr/widget/widget_tab_company.php";
                    break;
                case "company_list":
                    url = "https://denb.co.kr/widget/widget_company_list.php";
                    break;
                case "sms":
                    url = "https://denb.co.kr/sms/send_form.php";
                    break;
                case "profile":
                    url = "https://denb.co.kr/user/profile.php";
                    break;
                case "commute":
                    url = "https://denb.co.kr/personnel/commute_user_form.php";
                    break;
                case "incentive_form_insert":
                    url = "https://denb.co.kr/commission/incentive_form_insert.php";
                    break;
                default:
                    url = "https://denb.co.kr/widget/" + type + ".php";
                    break;
            }
            $form && $.each($form, function () {
                params[this.name] = this.value;
            });
            $.each(data, function (i, e) {
                params[i] = e;
            });
            val && (params['val'] = val);
            params['field'] = $this.data('field') || val,
                params['get_title'] = $this.attr('title'),
                params['crudmode'] && (params['crudMode'] = params['crudmode']);
            params['is_modal'] = 1;

            if (val == "column_sort") {
                params['data_filter_key'] = $this.attr('data-filter_key');
            }



            var mc = $('#modalContentXl');
            var mp = $('#modalPopupXl');
            switch (type) {
                case "reserv_kakao_form":
                case "kakao_template_send_form":
                    modalPopup = false;
                    mc = $('#modalContentLg');
                    mp = $('#modalPopupLg');
                    break;
                case "patient_payment_item_form":
                    modalPopup = false;
                    mc = $('#modalContent');
                    mp = $('#modalPopup');
                    break;
                case "chair_sort_form":
                    mp = $('#modalPopup');
                    mc = $('#modalContent');
                    break;
                case "work_item":
                    /* fnReloadWorkC();
                    fnReloadWorkR(); */
                    break;
            }
            url && $.ajax({
                url: url,
                type: "POST",
                cache: false,
                dataType: "text",
                data: params,
                success: function (data) {
                    if (modalPopup) {
                        $('#' + modalConten).attr("data-trigger", trigger);
                        $('#' + modalConten).attr("data-hiddenevent", hiddenevent);
                        $('#' + modalConten).html(data);
                    } else {
                        mc.attr("data-trigger", trigger);
                        mc.attr("data-hiddenevent", hiddenevent);
                        mc.html(data);
                        mp.modal('show');
                    }
                },
                error: function (request, status, error) {
                    var msg = "ERROR : " + request.status + "<br>"
                    msg += +"내용 : " + request.responseText + "<br>" + error;
                    console.log(msg);
                }
            });
        }).on('click', "[data-toggle='fnAdmCf']", function (e) {
            var $this = $(this),
                params = {},
                data = $this.data(),
                type = $this.data('type'),
                field = $this.data('field'),
                val = $this.val(),
                url = "https://denb.co.kr/dentist/dentist_cf_form.php";
            $.each(data, function (i, e) {
                params[i] = e;
            });
            val && (params['set_type'] = val);
            console.log(params);
            $.ajax({
                url: url,
                type: "POST",
                data: params,
                dataType: "text",
                success: function (data) {
                    $('#modalContentXl').html(data);
                    $('#modalPopupXl').modal('show');
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }).on('click', '[data-toggle="fnFormUp"], .fnFormUp', function (e) {
            var $this = $(this),
                $title = $(this).attr('title'),
                form = $this.data('form'),
                params = {},
                data = $this.data(),
                type = $this.data('type'),
                $target = $this.data('target') || $this.attr('href'),
                val = $this.val(),
                event = $this.data('event'),
                trigger = "",
                triggers = [],
                crudmode = $this.data('crudmode');

            trigger = $this.data('trigger');
            $eval = $this.data('eval'); // 실행전 처리 함수
            $eval && ($eval = $eval + "()"); // 실행전 처리 함수
            form = form ? form : type;
            form && ($form = $("form#" + form).serializeArray());
            $form && $.each($form, function () {
                params[this.name] = this.value;
            });
            $.each(data, function (i, e) {
                params[i] = e;
            });
            params['crudmode'] && (params['crudMode'] = params['crudmode']);
            console.log(params);
            if (crudmode) {
                switch (crudmode) {
                    case 'C':
                        $title = "";
                        break;
                    case 'U':
                        $title = " 수정 하시겠습니까?";
                        break;
                    case 'D':
                    case 'AD':
                        $title = " 삭제 하시겠습니까?";
                        break;
                    case 'AUS':
                        $title = " 보류 하시겠습니까?";
                        break;
                    case 'RS':
                        $title = $title + ' 하시겠습니까? 리셋 하시기 전 주의사항을 한번더 확인 하시길 바랍니다. ';
                        break;
                    default:
                        break;
                }
                if ($title) {
                    if (!confirm($title))
                        return false;
                }
            }
            switch (type) {
                case "dd_item": // 디스플레이
                    var url = "../dentist_display/dd_item_form_update.php";
                    break;
                case "dentist_holiday": // 치과휴무 변경,삭제
                    var url = "https://denb.co.kr/dentist/dentist_holiday_form_update.php";
                    break;
                case "kakao_template":
                    var url = "https://denb.co.kr/kakaoSend/kakao_template_update.php";
                    break;
                case "dentist_form":
                    var url = "https://denb.co.kr/dentist_form/df_group_form_update.php";
                    break;
                case "dentist_form_data":
                    var url = "https://denb.co.kr/dentist_form/df_wrete_form_update.php";
                    break;
                case "dentist_form_item":
                    var url = "https://denb.co.kr/dentist_form/df_item_form_update.php";
                    break;
                case "patient_implement_check":
                    var url = "https://denb.co.kr/patient/implement_form_update.php";
                    break;
                case "call":
                    var url = "https://denb.co.kr/call/item_form_update.php";
                    break;
                case "complain":
                    var url = "https://denb.co.kr/call/complain_form_update.php";
                    break;
                case "reserve_form":
                    var url = "https://denb.co.kr/reserv/reserv_form_update.php";
                    break;
                case "patient_interview":
                    var url = "https://denb.co.kr/interview/form_update.php";
                    break;
                case "consulting_form1": // 상담관리
                case "consulting_form3":
                    var url = "https://denb.co.kr/consulting/form_update.php";
                    break;
                case "consulting_form2": //치료수납계획
                    var url = "https://denb.co.kr/patient/patient_form_update.php";
                    break;
                case "df_item":
                    var url = "https://denb.co.kr/dentist_form/df_item_form_update.php";
                    break;
                case "patient":
                    var url = "https://denb.co.kr/patient/form_update.php";
                    break;
                case "consulting_chk":
                case "consulting_chk_all":
                case "performance_chk":
                case "performance_chk_all":
                    if (!confirm('[' + $title + '] 하시겠습니까?')) return false;
                    var url = "https://denb.co.kr/performance/order_form_update.php";
                    break;
                case "result_cut_amt":
                    var url = "https://denb.co.kr/performance/order_form_update.php";
                    break;
                case "cure":
                case "plan":
                case "plan_item":
                case "plan_order":
                case "plan_item_order":
                case "recommendation_m":
                case "recommendation": // 
                case "agree": // 
                case "batch_item": // 
                    var url = "https://denb.co.kr/consulting/item_form_update.php";
                    break;
                case "work":
                    url = "https://denb.co.kr/work/form_update.php";
                    break;
                case "work_item":
                case "work_item_view":
                case "work_item_re":
                case "work_item_log": // 모두읽음설정
                    url = "https://denb.co.kr/work/item_form_update.php";
                    break;
                case "work_cate": // 진단항목 우선순
                    url = "https://denb.co.kr/work/work_cate_form_update.php";
                    break;
                case "item_info_plan_sort": // 진단항목 우선순
                    url = "https://denb.co.kr/item/item_form_update.php";
                    break;
                case "stock_cate": // 진단항목 우선순
                    url = "https://denb.co.kr/order/stock_cate_form_update.php";
                    break;
                case "stock_group_item": // 추가
                    url = "https://denb.co.kr/order/stock_group_form_update.php";
                    break;
                case "dentist_cf_option_reset": // 리셋
                case "cf_option": // 병원옵션 삭제
                    url = im_dentist_url + "/dentist_cf_option_form_update.php";
                    break;
                case "patient_memo":
                case "patient_memo_charting":
                case "patient_memo_next":
                case "patient_memo_re_memo":
                case "patient_memo_ag_memo":
                case "widget_patient_memo":
                case "widget_patient_re_memo": // 진단메모
                case "widget_patient_ag_memo": // 상담메모
                case "widget_patient_memo_chatting": // 어랜지메모
                case "widget_ag_list_table_memo":
                case "widget_re_list_table_memo":
                    if (!params['patient_memo']) {
                        alert("메모를 입력해 주세요!");
                        return false;
                    }
                    url = "https://denb.co.kr/patient/patient_memo_form_update.php";
                    break;
                case "widget_user_memo":
                    url = "https://denb.co.kr/user/user_memo_form_update.php";
                    break;
                case "widget_dentist_memo":
                    url = "https://denb.co.kr/dentist/dentist_memo_form_update.php";
                    break;
                case "patient_reserv_lock":
                    if (!confirm('[' + $title + '] 하시겠습니까?')) return false;
                    url = "https://denb.co.kr/reserv/reserv_list_update.php";
                    break;
                default:
                    url = "https://denb.co.kr/performance/order_form_update.php";
                    break;
            }
            params['is_ajax'] = true;
            console.log(url);
            console.log(params);
            url && $.ajax({
                url: url,
                type: "POST",
                cache: false,
                dataType: "text",
                data: params,
                success: function (data) {
                    console.log(data);
                    if (data) {
                        switch (type) {
                            case "df_item":
                            case "dentist_holiday":
                                location.reload();
                                break;
                            case "reserve_form":
                                switch (crudmode) {
                                    case "D":
                                        if (params.is_dynamic == 'Y') {
                                            try {
                                                var reserve_idx = params.idx;
                                                $("[data-reserve-idx='" + reserve_idx + "']").remove();
                                                modal_close();
                                            } catch (error) { }
                                        } else {
                                            location.reload();
                                        }
                                        break;
                                }
                                break;
                            case "patient_memo":
                            case "patient_memo_charting":
                            case "patient_memo_next":
                            case "patient_memo_re_memo":
                            case "patient_memo_ag_memo":
                            case "widget_patient_memo":
                            case "widget_patient_re_memo": // 진단메모
                            case "widget_patient_ag_memo": // 상담메모
                            case "widget_ag_list_table_memo":
                            case "widget_re_list_table_memo":
                            case "widget_patient_memo_chatting": // 어랜지메모
                                im_notice("save");
                                $("#" + type + " #patient_memo").val("");
                                try {
                                    $("#" + form + " .note-editable").html("");
                                    $("#" + form + " .note-placeholder").show();
                                } catch (e) {
                                    console.log("편집기 입력폼 리셋 실패!")
                                }
                                break;
                            case "patient_implement_check":
                            case "consulting":
                            case "consulting_form1":
                            case "consulting_form2":
                            case "patient_interview":
                                fnAlert();
                                break;
                            case "cure":
                                im_notice("delete");
                                break;
                            case "plan":
                            case "plan_item":
                            case "plan_order":
                            case "plan_item_order":
                                fnLoadWidget("widget_plan_list"); // 계획재로드
                                break;
                            case "item_info_plan_sort":
                                fnSectionAddtooth(); // 계획재로드
                                break;
                            case "stock_group_item":
                                fnLoadWidget("widget_stock_group_item"); // 계획재로드
                                fnLoadWidget("widget_stock_list"); // 계획재로드
                                break;
                            case "work":
                                switch (crudmode) {
                                    case 'D':
                                        location.href = data;
                                        break;
                                    default:
                                        location.reload();
                                        break;
                                }
                                break;
                            case "call":
                                switch (crudmode) {
                                    case 'D':
                                        location.reload();
                                        break;
                                }
                                break;
                            case "stock_cate":
                                location.reload();
                                break;
                            case "work_item":
                            case "work_item_view":
                            case "work_item_re":
                                fnLoadWidget("work_tiem_latest", 'work_tiem_latest');
                                fnLoadWidget("widget_tab_work", 'widget_tab_work');
                                fnLoadWidget("work_item_view", 'work_item_view');
                                fnLoadWidget("share_load_container", 'work_tiem_latest');
                                break;
                            case "work_item_log":
                                fnLoadWidget("widget_work_history_new", 'widget_work_history_new');
                                break;
                            case "recommendation_m":
                                fnLoadWidget("widget_re_list_m");
                                break;
                            case "batch_item": // 간편상담 진단 진료저장
                                fnLoadWidget("widget_re_list_s");
                                break;
                            case "result_amt":
                                im_notice('저장 되였습니다.');
                                break;
                            default:
                                if (event && typeof (eval(event)) == "function") {
                                    console.log("이벤트 실행")
                                    eval(event);
                                } else {
                                    if (!trigger) {
                                        // location.reload();
                                    }
                                }
                                break;
                        }
                        event && (eval(event));
                        if (trigger) {
                            triggers = trigger.split(',');
                            if (triggers.length) {
                                $.each(triggers, function (index, value) {
                                    $(triggers[index]).trigger("click");
                                });
                            }
                        }
                        // trigger && (triggers = trigger.split(','));
                        // triggers && triggers.length && $.each(triggers, function(index, value) {
                        //     $(triggers[index]).trigger("click");
                        // });
                    } else {
                        im_notice("error");
                    }
                },
                error: function (request, status, error) {
                    var msg = "ERROR : " + request.status + "<br>"
                    msg += +"내용 : " + request.responseText + "<br>" + error;
                    console.log(msg);
                }
            });
        }).on('click', '[data-toggle="fnPrint"]', function (e) {
            var $this = $(this),
                params = {},
                data = $this.data(),
                type = $this.data('type'),
                is_modal = $this.data('is_modal'),
                val = $this.val();
            !type && alert('type 없습니다.');
            if (is_modal) { }
            switch (type) {
                case "cure":
                    var url = "https://denb.co.kr/performance/cure_print.php";
                    break;
                case "dailynote_day":
                case "consulting": // 진단,동의 통합
                case "consulting_re": // 진단
                case "consulting_ag": // 진단
                    var url = "https://denb.co.kr/consulting/consulting_print.php";
                    break;
                case "plan":
                case "simple":
                case "simple": //심플 치료계획
                case "plan_ops": //수술 계획
                case "briefing": //안내/브리핑
                case "plan_inform":
                case "plan_ops":
                    var url = "https://denb.co.kr/consulting/consulting_print.php";
                    break;
                case "work_report_view": // 일일보고서 출력
                    var url = "https://denb.co.kr/work/work_report_print.php";
                    break;
                case "board":
                    var url = "https://denb.co.kr/include/inc_print.php";
                    break;
                case "interview": // 접수 문진
                    var url = "https://denb.co.kr/interview/print_interview.php";
                    break;
            }
            $.each(data, function (i, e) {
                params[i] = e;
            });
            params['crudmode'] && (params['crudMode'] = params['crudmode']);
            params['is_modal'] = 1;

            url && $.ajax({
                url: url,
                type: "POST",
                cache: false,
                dataType: "text",
                data: params,
                success: function (data) {
                    if (is_modal) {
                        $('#modalContentXl').html(data);
                        $('#modalPopupXl').modal('show');
                    } else {
                        $('#modalContentXl').html(data);
                        $('#modalPopupXl').modal('show');
                    }
                },
                error: function (request, status, error) {
                    var msg = "ERROR : " + request.status + "<br>"
                    msg += +"내용 : " + request.responseText + "<br>" + error;
                    console.log(msg);
                }
            });
        }).on('click', '[data-toggle="fnSearchModal"]', function (e) {
            var $this = $(this),
                params = {},
                data = $this.data(),
                type = $this.data('type'),
                container = $this.data('container'),
                $target = $this.data('target') || $this.attr('href'),
                val = $this.val();
            $form = "";

            form = $this.data('form');
            form && $(form) && ($form = $(form).serializeArray());
            !type && alert('type 없습니다.');
            console.log(type);
            switch (type) {
                case "company_list":
                    var url = "https://denb.co.kr/widget/widget_company_list.php";
                    break;
                case "patient_item":
                    var url = "https://denb.co.kr/widget/widget_patient_item_value.php";
                    break;
                case "stock_log":
                case "item_value_stock_log": //행위 사용된 소모품
                    var url = "https://denb.co.kr/widget/widget_stock_log.php";
                    break;
                default:
                    var url = "https://denb.co.kr/widget/" + type + ".php";
                    break;
            }
            $form && $.each($form, function () {
                params[this.name] = this.value;
            });
            $.each(data, function (i, e) {
                params[i] = e;
            });
            params['is_modal'] = 1;
            params['crudmode'] && (params['crudMode'] = params['crudmode']);
            console.log(params);
            url && $.ajax({
                url: url,
                type: "POST",
                cache: false,
                dataType: "text",
                data: params,
                success: function (data) {
                    if (container) {
                        $(container).html(data);
                    } else {
                        $('#modalContentXl').html(data);
                        $('#modalPopupXl').modal('show');
                    }
                },
                error: function (request, status, error) {
                    var msg = "ERROR : " + request.status + "<br>"
                    msg += +"내용 : " + request.responseText + "<br>" + error;
                    console.log(msg);
                }
            });
        }).on('click', '[data-toggle="fnSwhich"], fnSwhich', function (e) {
            var $this = $(this),
                val, type, swal, $class, action_str, $target, $tmp, $classes, column, $targets, params = {},
                data = $this.data(),
                val = $this.val(),
                url = "https://denb.co.kr/patient/select_proc.php";
            $this.data('column') && (column = $this.data('column'));
            $this.data('type') && (type = $this.data('type'));
            swal = $this.data('swal')
            if (swal) {
                alert(swal);
                return false;
            }

            !$this.data('toggle') && ($this = $this.closest('[data-toggle="fnSwhich"]'));
            $class = $this.data()['class'];
            $target = $this.data('target') || $this.attr('href');
            $class && ($tmp = $class.split(':')[1]) && ($classes = $tmp.split(','));
            $target && ($targets = $target.split(','));
            $targets && $targets.length && $.each($targets, function (index, value) {
                ($targets[index] != '#') && $($targets[index]).toggleClass($classes[index]);
            });
            $this.toggleClass('active');

            switch (type) {
                case "arrange_status":
                    url = "https://denb.co.kr/patient/select_proc.php";
                    break;
            }

            switch (column) {
                case "next_reserve_cuer_memo":
                    url = "https://denb.co.kr/patient/select_proc.php";
                    data['data'] = $("#" + column).val();
                    break;
            }
            /* 값전달 */
            params['val'] = $this.hasClass('active') ? 'Y' : 'N';
            $.each(data, function (i, e) {
                params[i] = e;
            });
            console.log(params);
            console.log(url);
            console.log(type);
            console.log(column);
            if (type || column) {
                url && $.ajax({
                    url: url,
                    type: "POST",
                    cache: false,
                    dataType: "text",
                    data: params,
                    success: function (data) {
                        console.log(data);
                        if (data) {
                            im_notice("적용 되었습니다.");
                            switch (type) {
                                case "arrange_status":
                                    fnReloadArrange();
                                    break;
                            }
                            return true;
                        } else {
                            im_notice("error");
                            return false;
                        }
                    },
                    error: function (request, status, error) {
                        var msg = "ERROR : " + request.status + "<br>"
                        msg += +"내용 : " + request.responseText + "<br>" + error;
                        console.log(msg);
                    }
                });
            }
        }).on('click', '[data-toggle="fnChangeReload"]', function (e) {
            var $this = $(this),
                params = {},
                data = $this.data(),
                type = $this.data('type'),
                $form = $this.data('form'),
                $target = $this.data('target') || $this.attr('href'),
                val = $this.val();
            var form = $($form).serializeArray();
            !type && alert('type 없습니다.');
            console.log(type);
            switch (type) {
                case "stock_cate_select": // 재고분류카테
                    var url = "https://denb.co.kr/order/stock_cate_select.php";
                    break;
            }
            $.each(data, function (i, e) {
                params[i] = e;
            });
            $.each(form, function () {
                params[this.name] = this.value;
            });
            console.log($target);
            console.log(form);
            console.log(params);
            url && $.ajax({
                url: url,
                type: "POST",
                cache: false,
                dataType: "text",
                data: params,
                success: function (data) {
                    $($target).html(data);
                },
                error: function (request, status, error) {
                    var msg = "ERROR : " + request.status + "<br>"
                    msg += +"내용 : " + request.responseText + "<br>" + error;
                    console.log(msg);
                }
            });
        }).on('click', '.collapse-link', function (e) {
            e.preventDefault();
            var ibox = $(this).closest('div.ibox,section.ibox');
            var button = $(this).find('i');
            var content = ibox.children('.ibox-content');
            content.slideToggle(200);
            button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
            ibox.toggleClass('').toggleClass('border-bottom');
            setTimeout(function () {
                ibox.resize();
                ibox.find('[id^=map-]').resize();
            }, 50);
        }).on('change', '[data-toggle="fnChangeUp"], .fnChangeUp', function (e) {
            var $this = $(this),
                $form = $this.data('form'),
                params = {},
                data = $this.data(),
                type = $this.data('type'),
                column = $this.data('column'),
                $target = $this.data('target') || $this.attr('href'),
                val = $this.val(),
                crudmode = $this.data('crudmode');
            $form && ($form = $($form).serializeArray());
            var ex = ['parsleyField', 'parsleyFieldMultiple']
            $.each(data, function (i, e) {
                if ($.inArray(i, ex) < 0) {
                    params[i] = e;
                }
            });

            params['is_ajax'] = true;
            val && (params['value'] = val);
            $form && $.each($form, function () {
                params[this.name] = this.value;
            });
            params['crudmode'] && (params['crudMode'] = params['crudmode']);
            console.log(params);

            if (!type)
                type = column;

            switch (type) {
                case "work_status": // 상태변경
                    url = "https://denb.co.kr/work/item_form_update.php";
                    break;
                case "next_reserve_cure_order_yn": // 어랜지 기공유무
                case "next_reserve_cure_order_dt": // 어랜지 기공도착예상일
                case "arrange_status": // 상태변경
                case "doctor_tag": // 상태변경
                case "cure_minute": // 예상시간
                case "su_status": // 상담진행상태 변경
                case "income_insurance_yn":
                    url = "https://denb.co.kr/patient/select_proc.php";
                    val && (params['data'] = val);
                    switch (val) {
                        case '접수':
                            if (confirm('접수정보 입력하시겠습니까? \n [취소]하시면 상태만 [' + val + ']로 변경됩니다.')) {
                                fnModalForm(params);
                                if (params.event && typeof (eval(params.event)) == "function") {
                                    eval(params.event);
                                }
                                return false;
                            } else {
                                console.log("취소");
                            }
                            break;
                        case '환자호출':
                            if (params.chair_nm) {
                                console.log("환자호출시 위치:" + params.chair_nm);
                            } else {
                                if (confirm('체어를 선택하시겠습니까?')) {
                                    fnModalForm(params);
                                    if (params.event && typeof (eval(params.event)) == "function") {
                                        eval(params.event);
                                    }
                                    return false;
                                }
                            }
                            break;
                        case '데스크호출':
                            fnModalForm(params);
                            break;
                        default:
                            break;
                    }
                    break;
            }
            console.log("fnChangeUp:");
            console.log(url);
            console.log(params);
            url && $.ajax({
                url: url,
                type: "POST",
                data: params,
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    switch (type) {
                        case "arrange_status": // 상태변경
                        case "next_reserve_cure_order_yn": // 기공유무체크
                        case "doctor_tag": // 상태변경
                            if (data) {
                                if (data.result == 'suc') {
                                    im_notice('저장 되였습니다.');
                                    if (params.event && typeof (eval(params.event)) == "function") {
                                        eval(params.event);
                                    } else {
                                        try {
                                            if (!trigger) { }
                                        } catch (e) { }
                                    }
                                } else {
                                    if (data.error) {
                                        alert(data.error)
                                    } else {
                                        alert("저장실패!")
                                    }
                                    console.log("error:" + data.error);
                                    if (params.event && typeof (eval(params.event)) == "function") {
                                        eval(params.event);
                                    } else {
                                        try {
                                            if (!trigger) { }
                                        } catch (e) { }
                                    }
                                }
                            } else {
                                alert("저장실패!\n data 값이 없습니다.")
                            }
                            break;
                        default: // 항목삭제
                            if (data) {
                                im_notice("save");
                                return true;
                            } else {
                                return false;
                                im_notice("error");
                            }
                            break;
                    }

                },
                error: function (request, status, error) {
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }).on('change', '.changeVaule', function (e) {
            var $val = $(this).data('target');
            var $target = $(this).val();
            console.log($target);
            console.log($val);
            $val && $target && $($target).val($val);
        }).on('close.bs.alert', '.alert-dismissable', function () {
            var $this = $(this),
                url,
                success = false,
                params = {},
                data = $this.data(),
                crudmode = $this.data('crudmode'),
                type = $this.data('type');
            !crudmode && (crudmode = "D");
            console.log($this.data);

            if (type) {
                if (confirm('삭제 하시겠습니까?')) {
                    switch (type) {
                        case "sms_temp":
                            var url = "https://denb.co.kr/sms/template_form_update.php";
                            break;
                        case "kakao_template":
                            var url = "https://denb.co.kr/kakaoSend/kakao_template_update.php";
                            break;
                        case "patient_record_log":
                            var url = "https://denb.co.kr/patient/patient_record_log_update.php";
                            break;
                        case "patient_memo":
                            var url = "https://denb.co.kr/patient/patient_memo_form_update.php";
                            break;
                        case "item_info_user":
                            var url = "https://denb.co.kr/item/item_form_update.php";
                            break;
                        case "cure":
                        case "plan_item":
                        case "plan_user":
                        case "recommendation":
                            url = im_consulting_url + "/item_form_update.php";
                            break;
                        case "board_view_log":
                            url = im_notice_url + "/form_update.php";
                            break;
                        case "work":
                            url = im_work_url + "/form_update.php";
                            break;
                        case "work_item":
                            url = im_work_url + "/item_form_update.php";
                            break;
                        case "stock_cate": // 진단항목 우선순
                            url = im_order_url + "/stock_cata_form_update.php";
                            break;
                        case "cf_option": // 병원옵션 삭제
                            url = im_dentist_url + "/dentist_cf_option_form_update.php";
                            break;
                        case "patient_memo_list":
                            url = "https://denb.co.kr/patient/patient_memo_form_update.php";
                            break;
                        case "widget_user_memo_list":
                            url = "https://denb.co.kr/user/user_memo_form_update.php";
                            break;
                        case "widget_dentist_memo":
                            url = "https://denb.co.kr/dentist/dentist_memo_form_update.php";
                            break;
                        case "board_file": // 파일
                            url = "../board_file/form_update.php";
                            break;
                    }
                } else {
                    return false;
                }
                $.each(data, function (i, e) {
                    params[i] = e;
                });
                crudmode && (params['crudMode'] = crudmode);
                params['is_ajax'] = true;
                console.log("dismiss:");
                console.log("url:" + url);
                console.log(params);
                url && $.ajax({
                    url: url,
                    type: "POST",
                    cache: false,
                    dataType: "text",
                    data: params,
                    async: false,
                    success: function (data) {
                        console.log("data:" + data);
                        success = data;
                        switch (type) {
                            case "stock_cate":
                                location.reload();
                                break;
                            case "recommendation":
                                fnLoadWidget("widget_re_list_s");
                                fnLoadWidget("widget_re_list_m");
                                break;
                            case "cure":
                                fnReloadArrange();
                                break;
                            case "plan":
                            case "plan_item":
                            case "plan_order":
                            case "plan_item_order":
                            case "plan_user":
                                fnLoadWidget("widget_plan_list"); // 계획재로드
                                break;
                            default: // 항목삭제
                                break;
                        }
                    },
                    error: function (request, status, error) {
                        var msg = "ERROR : " + request.status + "<br>"
                        msg += +"내용 : " + request.responseText + "<br>" + error;
                        console.log(msg);
                    }
                });
                console.log("success" + success);
                if (success != '0') {
                    im_notice("delete");
                    return true;
                } else {
                    im_notice("error");
                    return false;
                }
            } else {
                return false;
            }
        }).on('click ', '[data-toggle="fnExcel"]', function (e) {
            var $this = $(this),
                url = $this.data('url'),
                $form,
                serialize,
                params = {},
                data = $this.data(),
                search_date = $this.data('search_date'),
                type = $this.data('type'),
                form = $this.data('form') ? $this.data('form') : "#searchform";
            val = $this.val();
            form && $(form) && ($form = $(form).serializeArray());
            search_date = search_date ? search_date : "";
            val && (params['val'] = val);
            type = type ? type : url;
            serialize = $(form).serialize();
            switch (type) {
                case "overtime_list":
                    url = "https://denb.co.kr/personnel/" + type + ".php?is_excel=Y&search_date=" + search_date + "&" + serialize;
                    break;
                case "introducer_01":
                case "introducer_02":
                    url = "https://denb.co.kr/patient/" + type + ".php?is_excel=Y&search_date=" + search_date + "&" + serialize;
                    break;
                case "requests_list":
                    url = "https://denb.co.kr/call/" + type + ".php?is_excel=Y&search_date=" + search_date + "&" + serialize;
                    break;
                case "deposit_list":
                    url = "https://denb.co.kr/deposit/" + type + ".php?is_excel=Y&search_date=" + search_date + "&" + serialize;
                    break;
                case "dailynote":
                    url = "https://denb.co.kr/deposit/" + type + ".php?is_excel=Y&search_date=" + search_date + "&" + serialize;
                    break;
                default:
                    var strRegex = '^((https|http|ftp|rtsp|mms)?://)';
                    var is_url = new RegExp(strRegex).test(url);
                    console.log(is_url);
                    if (is_url) {
                        url = url + "?is_excel=Y&search_date=" + search_date + "&" + serialize;
                    } else {
                        url = "https://denb.co.kr" + url + "?is_excel=Y&search_date=" + search_date + "&" + serialize;
                    }
                    break;
            }
            $form && $.each($form, function () {
                params[this.name] = this.value;
            });
            params['field'] = $this.data('field') || val,
                params['get_title'] = $this.attr('title'),
                params['crudmode'] && (params['crudMode'] = params['crudmode']);
            params['is_excel'] = 'Y';
            location.href = url;

        }).on('click', '[data-toggle="pill"]', function (e) {
            var $this = $(this),
                $tab_container = $this.parents('.tabs-container').attr('id'),
                $tab_id = $this.data('tab_id'),
                $tab_content = $this.parents('.tabs-container').find('#tabItem');
            $tab_id && $tab_container && $tab_content && fnLoadWidget($tab_container + " #tabItem", $tab_id);
        }).on('click', "[data-toggle='fnSelectChange']", function (e) {
            var data = {},
                url = im_patient_url + "/select_proc.php",
                event, val, event_param;
            val = $(this).val();
            val && (data['data'] = val);
            $.each($(this).data(), function (i, e) {
                data[i] = e;
            });
            event = $(this).data('event');
            event_param = $(this).data('event_param');
            switch (val) {
                case "진료완료":
                    console.log("진료완료 액션을 넣으세요");
                    break;
            }
            // 실행 판단
            switch (data.column) {
                case 'chair_idx':
                    break;
                default:
                    break;
            }
            console.log(data);

            $.ajax({
                url: url,
                type: "POST",
                data: data,
                dataType: "text",
                success: function (data) {
                    console.log(data);
                    im_notice('저장되였습니다.');
                    event && event_param && (eval(event + "(" + event_param + ")"));
                    event && (eval(event));
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }).on('click', '[data-toggle="send_user"]', function (e) {
            var obj = $(this);
            var idx = obj.data('idx');
            var patient_idx = obj.data('patient_idx');
            var no = obj.data('no');
            var params = {
                patient_idx: patient_idx ? patient_idx : '',
                no: no ? no : '',
                is_ajax: 1,
            };
            console.log(params);
            $.ajax({
                url: "../send/send_user_form.php",
                type: "POST",
                data: params,
                dataType: "text",
                success: function (data) {
                    $('#modalContentXl').html(data);
                    $('#modalPopupXl').modal('show');
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }).on('change', '[data-toggle="table_form_select"]', function (e) {
            var $this = $(this),
                form = $this.data('form'),
                params = {},
                data = $this.data(),
                $target = $this.data('target') || $this.attr('href'),
                idx = $this.val(),
                event = $this.data('event'),
                $eval = $this.data('eval'); // 실행전 처리 함수
            $eval && ($eval = $eval + "()"); // 실행전 처리 함수
            form && ($form = $("form#" + form).serializeArray());
            $.each(data, function (i, e) {
                if (jQuery.inArray(i, data_exclude) < 0) {
                    params[i] = e;
                }
            });
            params['idx'] = idx;
            var idx = $(this).val();
            console.log(params);
            $.ajax({
                url: "https://denb.co.kr/notice/ajax.form.json2.php",
                type: "POST",
                cache: false,
                dataType: "json",
                data: params,
                success: function (data) {
                    console.log(data);
                    var contents = data.contents;
                    contents && $("#" + $target).summernote("editor.pasteHTML", contents);
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }).on('click', '[data-toggle="fnSendKakao"]', function (e) {
            // 알림톡 수동발송
            var $this = $(this),
                $form = $this.data('form'),
                params = {},
                data = $this.data(),
                type = $this.data('type'),
                $target = $this.data('target') || $this.attr('href'),
                val = $this.val(),
                crudmode = $this.data('crudmode');
            $form && ($form = $($form).serializeArray());
            $.each(data, function (i, e) {
                params[i] = e;
            });
            params['is_ajax'] = true;
            val && (params['value'] = val);
            $form && $.each($form, function () {
                params[this.name] = this.value;
            });
            var url = "https://denb.co.kr/kakaoSend/ajax.alimtalk.php";
            params['crudmode'] && (params['crudMode'] = params['crudmode']);
            switch (type) {
                case "데스크호출":
                    // 발송내역유무 판단
                    if (params.send_idx > 0) {
                        if (!confirm("재발송 하시겠습니까?")) {
                            return false;
                        }
                    }
                    var pay_area = $('#pay_area').val(); // 마감위치
                    if (!pay_area) {
                        alert("마감위치를 선택하세요");
                        return false;
                    }
                    params['pay_area'] = pay_area;
                    url = "https://denb.co.kr/kakaoSend/ajax.alimtalk.php";
                    break;
                case "설문지알림톡발송":
                    var patient_idx = $this.data('patient_idx'),
                        dentist_idx = $this.data('dentist_idx');
                    params['dentist_form_idx'] = $('#dentist_form_idx').val();
                    url = "https://denb.co.kr/kakaoSend/ajax.alimtalk.php";
                    break;
                default:
                    if (!confirm("알림톡 발송 하시겠습니까?")) {
                        return false;
                    }
                    break;
            }
            console.log("fnSendKakao:");
            console.log(url);
            console.log(params);
            url && $.ajax({
                url: url,
                type: "POST",
                data: params,
                dataType: "json",
                // dataType: "text",
                success: function (data) {
                    console.log(data);
                    switch (type) {
                        case "데스크호출": // 상태변경
                            if (data) {
                                if (data.result == 'suc') {
                                    $this.prop('disabled', true); // 재발송 금지
                                    fnAlert("발송 되였습니다.");
                                    if (params.event && typeof (eval(params.event)) == "function") {
                                        eval(params.event);
                                    } else {
                                        try {
                                            if (!trigger) { }
                                        } catch (e) { }
                                    }
                                } else {
                                    if (data.error) {
                                        alert(data.error)
                                    } else {
                                        alert("저장실패!")
                                    }
                                    console.log("error:" + data.error);
                                    if (params.event && typeof (eval(params.event)) == "function") {
                                        eval(params.event);
                                    } else {
                                        try {
                                            if (!trigger) { }
                                        } catch (e) { }
                                    }
                                }
                            } else {
                                alert("저장실패!\n data 값이 없습니다.")
                            }
                            break;
                        case "설문지알림톡발송": // 설문지알림톡발송
                            if (data) {
                                if (data.result == 'suc') {
                                    $this.prop('disabled', true); // 재발송 금지
                                    fnAlert("발송 되였습니다.");
                                    if (params.event && typeof (eval(params.event)) == "function") {
                                        eval(params.event);
                                    } else {
                                        try {
                                            if (!trigger) { }
                                        } catch (e) { }
                                    }
                                } else {
                                    if (data.error) {
                                        alert(data.error)
                                    } else {
                                        alert("저장실패!")
                                    }
                                    console.log("error:" + data.error);
                                    if (params.event && typeof (eval(params.event)) == "function") {
                                        eval(params.event);
                                    } else {
                                        try {
                                            if (!trigger) { }
                                        } catch (e) { }
                                    }
                                }
                            } else {
                                alert("저장실패!\n data 값이 없습니다.")
                            }
                            break;
                        default: // 항목삭제
                            if (data.result == 'suc') {
                                fnAlert("알림톡 발송 되였습니다.");
                                if (params.event && typeof (eval(params.event)) == "function") {
                                    eval(params.event);
                                } else {
                                    try {
                                        if (!trigger) { }
                                    } catch (e) { }
                                }
                            } else {
                                if (data.error) {
                                    fnAlert(data.error, "error");
                                } else {
                                    alert("발송실패!")
                                }
                                console.log("error:" + data.error);
                                if (params.event && typeof (eval(params.event)) == "function") {
                                    eval(params.event);
                                } else {
                                    try {
                                        if (!trigger) { }
                                    } catch (e) { }
                                }
                            }
                            break;
                    }
                },
                error: function (request, status, error) {
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }).on('click', '[data-toggle="fnItemForm"]', function (e) {
            var $this = $(this);
            var data = $this.data();
            var params = {};
            $.each(data, function (i, e) {
                params[i] = e;
            });
            params.is_ajax = true;

        }).on('click', '.trigger', function (e) {
            var $this = $(this);
            var target = $this.data('target');
            target && $(target).trigger("click");
        }).on('click', '[data-toggle="fnSortForm"], .fnSortForm', function (e) {
            var $this = $(this),
                url, $form,
                params = {},
                hiddenevent = $this.attr("data-hiddenevent"),
                trigger = $this.data('trigger'),
                data = $this.data(),
                type = $this.data('type'),
                container = $this.data('container'),
                form = $this.data('form');
            w = $this.data('w'),
                is_dual = $this.data('is_dual'),
                val = $this.val();
            var modalPopup = $this.parents(".modal").attr('id');
            var modalConten = $this.parents(".modal-dialog").attr('id');
            form && $(form) && ($form = $(form).serializeArray());
            hiddenevent = hiddenevent ? hiddenevent : "";
            trigger = trigger ? trigger : "";
            switch (type) {
                case "denb_menu":
                    var url = "https://denb.co.kr/adm/denb_menu_sort_form.php";
                    break;
                case "agree": // 상담동의 순선변경
                    var url = "https://denb.co.kr/consulting/item_sort_form.php";
                    break;
                default:
                    url = "https://denb.co.kr/widget/" + type + ".php";
                    break;
            }
            $form && $.each($form, function () {
                params[this.name] = this.value;
            });
            $.each(data, function (i, e) {
                params[i] = e;
            });
            val && (params['val'] = val);
            params['field'] = $this.data('field') || val,
                params['get_title'] = $this.attr('title'),
                params['crudmode'] && (params['crudMode'] = params['crudmode']);
            params['is_modal'] = 1;

            url && $.ajax({
                url: url,
                type: "POST",
                cache: false,
                dataType: "text",
                data: params,
                success: function (data) {
                    var mc = $('#modalContentSm');
                    var mp = $('#modalPopupSm');
                    switch (type) {
                        case "work_item":
                            /* fnReloadWorkC();
                            fnReloadWorkR(); */
                            break;
                    }
                    if (modalPopup) {
                        $('#' + modalConten).attr("data-trigger", trigger);
                        $('#' + modalConten).attr("data-hiddenevent", hiddenevent);
                        $('#' + modalConten).html(data);
                    } else {
                        mc.attr("data-trigger", trigger);
                        mc.attr("data-hiddenevent", hiddenevent);
                        mc.html(data);
                        mp.modal('show');
                    }
                },
                error: function (request, status, error) {
                    var msg = "ERROR : " + request.status + "<br>"
                    msg += +"내용 : " + request.responseText + "<br>" + error;
                    console.log(msg);
                }
            });
        }).on('click', '.alert_temp', function (e) {
            alert("개발중 입니다.");
        }).on('click', "[data-toggle='fnModalManual']", function (e) {
            // 매뉴얼
            var $this = $(this),
                params = {},
                data = $this.data(),
                type = $this.data('type'),
                field = $this.data('field'),
                val = $this.val(),
                url = "https://denb.co.kr/include/modal_manual.php";
            $.each(data, function (i, e) {
                params[i] = e;
            });
            var hiddenevent = params['hiddenevent'] ? params['hiddenevent'] : "";
            var trigger = params['trigger'] ? params['trigger'] : "";
            console.log(params);
            $.ajax({
                url: url,
                type: "POST",
                data: params,
                dataType: "text",
                success: function (data) {
                    var mc = $('#modalContentXl');
                    var mp = $('#modalPopupXl');
                    mc.attr("data-trigger", trigger);
                    mc.attr("data-hiddenevent", hiddenevent);
                    mc.html(data);
                    mp.modal('show');
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        });

        $('.navbar-minimalize').on('click', function (e) {
            var cookie_body_class = get_cookie("cookie_body_class");
            console.log(cookie_body_class);
            if (cookie_body_class)
                set_cookie("cookie_body_class", "", 10000);
            else
                set_cookie("cookie_body_class", "mini-navbar", 10000);
        });
        $('#multi_seach_btn').on('click', function (e) {
            var html = $("#multi_search_container").html();
            console.log(html);
            console.log("html");
            if (html == "") {
                fnLoadWidget("multi_search_container", "multi_search");
            }
        });


        function fnAlert(msg, type, text, link, event) {
            var d_text = "3초후 자동 꺼짐";
            var text = text ? text : d_text;
            switch (msg) {
                case "modify":
                    msg = "업데이트 되었습니다.";
                    break;
                case "delete":
                    msg = "삭제 되었습니다.";
                    break;
                case "error":
                    msg = "오류가 있습니다.";
                    type = "error";
                    break;
                default:
                    msg = msg ? msg : "저장 되었습니다."
                    break;
            }
            swal({
                title: msg,
                text: text,
                type: type,
                timer: 3000,
                confirmButtonText: "확인",
                cancelButtonText: "취소",
            },
                function (isConfirm) {
                    console.log(isConfirm);
                    switch (type) {
                        case "success":
                        case "warning":
                            // modal grigger 값이 있으면 실행
                            var modal_show = $("div.modal.show .modal-dialog");
                            if (modal_show.data('trigger')) {
                                modal_close();
                            } else {
                                if (event) {
                                    eval(event);
                                    swal.close();
                                } else if (link) {
                                    location.href = link;
                                } else {
                                    location.reload();
                                }
                            }
                            swal.close();
                            break;
                        case "error":
                            swal.close();
                            break;
                        default:
                            swal.close();
                            break;
                    }
                }
            );
        }

        function fnSweetAlert(userParams) {
            var title = userParams.title;
            switch (userParams.type) {
                case "update":
                    title = "업데이트 되었습니다.";
                    break;
                case "modify":
                    title = "수정 되었습니다.";
                    break;
                case "delete":
                    title = "삭제 되었습니다.";
                    break;
                case "error":
                    title = "저장 실패!";
                    break;
                case "fail":
                    title = "저장 실패!";
                    break;
                default:
                    title = title ? title : "저장 되었습니다."
                    break;
            }

            var defaultParams = {
                title: title,
                text: "3초후 자동 꺼짐",
                type: "",
                timer: 3000,
                confirmButtonText: "확인",
                cancelButtonText: "취소",
            }
            userParams && $.extend(defaultParams, userParams);
            console.log(defaultParams);

            swal(defaultParams,
                function (isConfirm) {
                    swal.close();
                    var type = defaultParams.type;
                    var event = defaultParams.event;
                    var trigger = defaultParams.trigger;
                    var link = defaultParams.link;
                    console.log("event:" + event);
                    console.log("isConfirm:" + isConfirm);
                    console.log("type:" + type);
                    console.log("trigger:" + trigger);
                    if (type != 'error') {
                        console.log("event:" + event);
                        switch (event) {
                            case "reload":
                                location.reload();
                                break;
                            case "modal_close":
                                modal_close();
                                break;
                            case "modal_close()":
                                location.reload();
                                break;
                            default:
                                event && (eval(event));
                                break;
                        }

                        if (trigger) {
                            trigger && (triggers = trigger.split(','));
                            triggers.length && $.each(triggers, function (index, value) {
                                $(triggers[index]).trigger("click");
                            });
                        }

                        if (link) {
                            location.href = link;
                        }
                    }
                }
            );
        }

        // 전체화면 로딩용
        function sweetLoding(msg, event) {
            var title = '로딩중입니다.';
            msg && (title = msg);
            swal({
                title: msg,
                text: "잠시만 기다려 주세요",
                type: "",
                animation: false, // 애니메이션
                showConfirmButton: false,
                showCancelButton: false
            });
        }

        var clipboard = new Clipboard('.clipboard_btn');
        clipboard.on('success', function (e) {
            var $this = $(e.trigger);
            var to = $this.data('clipboard-to');
            if (to) {
                var p = $(to).prop('selectionStart');
                var to_val = $(to).val();
                var text = e.text;
                if (p > 0 && to_val != '')
                    $(to).val(to_val.substr(0, p) + text + to_val.substr(p) + " ");
                else
                    $(to).val(to_val + text + " ");
                $(to).focus();
            } else {
                alert("클립보드에 복사 되었습니다.");
            }
        }).on('error', function (e) {
            alert("복사실패. Ctrl + C 를 눌러서 복사해 주세요.");
        });

        // 회원 근태일정으로 달력 선택일 옵션체인지
        function cfCalendarReserveDate(user_id, taget_obj) {
            // console.log(user_id);
            // console.log(taget_obj);
            var params = {
                user_id: user_id,
                dentist_idx: 1
            };
            $.ajax({
                title: "",
                url: "../user/ajax.get_user_work_week.php",
                type: "POST",
                data: params,
                dataType: "json",
                async: false,
                cache: false,
                success: function (data) {
                    console.log(data);
                    // 특정요일 disabled 
                    if (data.off_week_key) {
                        $(taget_obj).datepicker("setDaysOfWeekDisabled", data.off_week_key);
                    } else {
                        $(taget_obj).datepicker("setDaysOfWeekDisabled", "");
                    }
                    // 특정일 disabled 
                    if (data.off_dates) {
                        $(taget_obj).datepicker("setDatesDisabled", data.off_dates);
                    } else {
                        $(taget_obj).datepicker("setDatesDisabled", "");
                    }
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }
    </script>
    <script src="https://denb.co.kr/inspinia/js/plugins/slick/slick.min.js"></script>
    <script src="https://denb.co.kr/app/vendor/swiper/swiper.min.js"></script>
    <script src="https://denb.co.kr/app/demos/main/js/jquery.custom.js"></script>
    <!-- https://www.jq22.com/yanshi406 -->
    <script>
        $(document).ready(function () {
            $('.slick_demo_1').slick({
                // autoplay: false,
                autoplay: true,
                autoplaySpeed: 5000,
                dots: true,
            });
            $('.slick_demo_2').slick({
                infinite: true,
                slidesToShow: 2,
                slidesToScroll: 2,
                centerMode: false,
                responsive: [{
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2,
                        infinite: true,
                        dots: true
                    }
                },
                {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1
                    }
                }
                ]
            });
        });
    </script>
    <script>
        document.querySelector(".page__content").style.paddingLeft = "0";
        document.querySelector(".page__content").style.paddingRight = "0";
        document.querySelector(".page__content").style.overflowX = "hidden";
        document.querySelector(".page__content").style.paddingTop = "50px";

        document.querySelector(".page__content--with-bottom-nav").style.height = "100%";

        document.getElementsByClassName("slick_demo_1")[0].style.padding = "0";
        document.getElementsByClassName("slick_demo_1")[1].style.padding = "0";

        document.querySelector(".cards").style.paddingLeft = "10px";
        document.querySelector(".cards").style.paddingRight = "10px";
        document.querySelector(".breadcrumb-item").style.color = "#706cd5";
        document.querySelector(".m-b").style.setProperty("background-color", "#f8f9fa", "important");
        document.querySelector(".m-b").style.border = "0";
        document.querySelector(".m-b").style.boxShadow = "none";
        document.querySelector(".m-b").style.padding = "5px";


        function resolveAfterSeconds() {
            return new Promise(resolve => {
                setTimeout(() => {
                    resolve('resolved');
                }, 500);
            });
        }

        async function asyncCall() {
            const result = await resolveAfterSeconds();
            var slickdots = document.querySelectorAll(".slick-dots");
            for (var i = 0; i < slickdots.length; i++) {
                slickdots[i].setAttribute("style", "position: absolute; bottom: -20px; display: block; width: 100%; padding: 19px; margin: 0; list-style: none; text-align: center;");
                for (var j = 0; j < slickdots[i].children.length; j++) {
                    slickdots[i].children[j].style.margin = "-3px";
                }
            }
        }
        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 인증부분
        // Check if the user is on a mobile device
        function isMobileDevice() {
            return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
        }



        function user_auth_01(link, fun_code) {
            open_user_auth_modal(user_auth_callback, link, fun_code);
        }

        var call_link = "";
        function user_auth_callback(link, type, fun_code) {
            call_link = link;
            var param = get_user_auth_param('1', '1427795', type, fun_code);
            var url = "https://denb.co.kr/api/user_auth/mok3.0/auth_request.php?" + param + "&next_url=" + encodeURIComponent(link);

            if (isMobileDevice()) {
                url = url + "&is_mobile=Y";
                //console.log("mobile");
                MOBILEOK.process(url, "WB", "");
            } else {
                //console.log("pc");
                MOBILEOK.process(url, "WB", "user_auth_mok_result");
            }
        }

        function user_auth_mok_result(data) {
            //console.log(data);
            var result = JSON.parse(data);
            if (result.status == "success") {
                document.location.href = call_link;
            }
            else {
                alert(result.msg);
            }

        }

        function get_user_auth_param(dentist_idx, patient_idx, type, fun_code) {
            return "dentist_idx=" + dentist_idx + "&patient_idx=" + patient_idx + "&type=" + type + "&fun_code=" + fun_code;
        }
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 인증부분
        asyncCall();
    </script>