<?php

include_once('./_common.php');

// $it_id = $_GET['it_id'];
$it_id = $_GET['it_id'];
$qnew = $_GET['qnew'];
$qstr = $_GET['qstr'];

//set it to writable location, a place for temp generated PNG files
$PNG_TEMP_DIR = dirname(__FILE__) . DIRECTORY_SEPARATOR . 'temp' . DIRECTORY_SEPARATOR;

//html PNG location prefix
$PNG_WEB_DIR = 'temp/';

include "qrlib.php";

//ofcourse we need rights to create temp dir
if (!file_exists($PNG_TEMP_DIR))
    mkdir($PNG_TEMP_DIR);

$filename = $PNG_TEMP_DIR . 'test.png';


$idx = $_GET['idx'];
$homepage = urldecode($_GET['homepage']);
$subject = urldecode($_GET['subject']);
$dentist_idx = $_GET['dentist_idx'];
$p1 = $_GET['p1'];


$sql21 = "UPDATE {$im_table} SET";
$sql21 .= " option03 = '{$p1}' ";
$sql21 .= " where idx = '" . $idx . "'  ";
if ($p1 != '' || isset($p1)) mysqli_query($connect, $sql21);



//processing form input
//remember to sanitize user input in real-life solution !!!
$errorCorrectionLevel = 'H';

$matrixPointSize = 8;

if (strstr($homepage, '?')) {
    echo "홈페이지주소를 그대로 사용합니다. ";
    $qrdata = $homepage . "&event=" . $idx . "&dentist_idx=" . $dentist_idx; // 상품 보기 url
} else {
    echo "일치하는 패턴이 없습니다.";
    $qrdata = $homepage . "?event=" . $idx . "&dentist_idx=" . $dentist_idx . $p1; // 상품 보기 url
}
// user data

//@chmod($PNG_TEMP_DIR, "0755");
$filename = $PNG_TEMP_DIR . 'event' . $idx . '.png';

$name = 'event' . $idx . '.png';
QRcode::png($qrdata, $filename, $errorCorrectionLevel, $matrixPointSize, 2);


if (!$qstr) {

    echo "<script>
        window.resizeTo(500, 500);
        alert('QR 코드를 성공적으로 생성했습니다.');
	

    setTimeout(function (){
    $('#event_button').trigger('click');
    }, 5000);

    </script>";
    echo "<div style='text-align:center;'><img src='temp/{$name}'>";
    echo "<div><a href='download.php?folder=temp/&file={$name}&ori_file={$name}'>{$subject} QR코드 다운로드</a></div></div>";
}

echo "<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">";
