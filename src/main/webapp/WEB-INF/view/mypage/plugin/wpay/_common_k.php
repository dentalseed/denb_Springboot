<?php
/*
 * @Date: 2022-08-29 19:46:29
 * @LastEditors: error: error: git config user.name & please set dead value or install git && error: git config user.email & please set dead value or install git & please set dead value or install git
 * @LastEditTime: 2023-02-07 10:22:09
 * @FilePath: \denb\kiosk\_common.php
 */
include_once('../../commonNon.php');
include_once(IM_INCLUDE_PATH . '/add_lib.php');

## QR 접속 여부 ##
if ($_GET['is_qr']) {
    set_cookie("cook_is_qr", "Y", time() + 3600 * 24); //24시간 유효
}

$body_class              = "gray-bg";
$get_dentist_idx         = $_GET['dentist_idx'];
$cook_dentist_idx        = get_cookie("cook_dentist_idx");
$is_kiosk                = get_cookie("cook_is_qr") ? "QR" : "Y";



if ($get_dentist_idx) {
    set_cookie("cook_dentist_idx", $_GET['dentist_idx'], time() + 3600 * 24 * 365);
    goto_url(IM_URL . "/kiosk");
}

if ($cook_dentist_idx != $get_dentist_idx && $get_dentist_idx) {
    goto_url(IM_URL . "/kiosk");
}

## 업체체크 ##
$dentist = get_dentist_view($cook_dentist_idx);
$im['dentist_nm'] = $dentist['dentist_nm'];

if (!$cook_dentist_idx || !$dentist)
    alert("잘못된 접근입니다.", "../login/login_new.php?url=kiosk");

$dentist_idx         = $_SESSION['session_dentist_idx'] = $im['dentist_idx'] = $cook_dentist_idx;
$cf_kiosk_payment_yn = $dentist['cf_kiosk_payment_yn'];

// 공통사용 부분
$키오스크메인화면 = im_btn(array('type' => "button", "str" => "처음으로 돌아가기", "ico" => "mail-reply", "get" => "../kiosk/", "class" => "btn btn-secondary btn-block hei-40 w-100"));
$개이정보보호방침 = im_link("개인정보 처리방침", '', '', 'data-toggle="fnModalForm" data-type="agreement"'); //개인정보 처리방침

/* $c = im_link("©dentalbseo", "https://denb.co.kr/");
$y = date("Y");

$copyright = <<<EOT
<div class="row m-t text-muted">
    <div class="col-auto mr-auto">
        {$c}
    </div>
    <div class="col-auto">
        <small>© 2021-{$y}</small>
    </div>
</div>
EOT;
 */

$retrun_tip = im_tip("60초동안 동작이 없으면 첫 화면으로 돌아갑니다.", "warning");

// 디바이스 판단
function get_device_type()
{
    $agent = strtolower($_SERVER['HTTP_USER_AGENT']);
    $type = 'pc';
    if (strpos($agent, 'iphone') || strpos($agent, 'ipad')) {
        $type = 'ios';
    }
    if (strpos($agent, 'android')) {
        $type = 'android';
    }
    return $type;
}
$is_device = get_device_type();
