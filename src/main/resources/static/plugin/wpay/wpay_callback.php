<?php
session_start();
header('Set-Cookie: PHPSESSID=' . session_id() . '; Path=/; SameSite=None; Secure; Content-type: text/html; charset=utf-8');
include_once('../../config.php');
include_once(IM_ORDER_PATH . '/lib.php');
include_once(IM_ORDER_PATH . '/lib.pay.php');

require_once('libs/INIStdPayUtil.php');
$SignatureUtil = new INIStdPayUtil();

$mid 			= "welcometst";  								// 상점아이디			
$signKey 		= "QjZXWDZDRmxYUXJPYnMvelEvSjJ5QT09"; 			// 웹 결제 signkey

$mKey 	= $SignatureUtil->makeHash($signKey, "sha256");

$timestamp 		= $SignatureUtil->getTimestamp();   			// util에 의해서 자동생성

// 취소할 주문정보
$tid = $_REQUEST["tid"];
$price = $_REQUEST["price"];
$cpid = $_REQUEST["cpid"];
$wmode = $_REQUEST["wmode"];

$params = array(
    "mid" => $mid,
    "mkey" => $mKey,
    "timestamp" => $timestamp
);

$sign   = $SignatureUtil->makeSignature($params);

?><xmp><? echo var_dump($params); ?></xmp><?
?><xmp><? echo var_dump($sign); ?></xmp><?


?>
<p>wpay_callback</p>

<?php
	//$url = "https://payapi.paywelcome.co.kr/cancel/cancel";       // LIVE
	$url = "https://tpayapi.paywelcome.co.kr/cancel/cancel";        // TEST
	
	$headers = array();
	$headers[] = "Content-Type: application/x-www-form-urlencoded; charset=UTF-8";
	
	$request_body = "";
	$request_body .= "payType=card";
	$request_body .= "&mid=".$mid;
	$request_body .= "&tid=".$tid;
	$request_body .= "&price=".$price;
	$request_body .= "&currency=WON";
	$request_body .= "&timestamp=".$timestamp;
	$request_body .= "&signature=".$sign;

?><xmp><? echo var_dump($request_body); ?></xmp><?

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_POST, true);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	//SSL 이슈가 있을 경우 하단에 주석 해제 후 확인
//curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $request_body);
	
	$response = curl_exec($ch);
	$status_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	curl_close ($ch);
	
	echo "Status_code: ".$status_code."<br>";
	
	if($status_code == 200) {
		echo $response;

        // 결제 성공시 저장
        $qry   = " update pay_tran_h set ";
        $qry  .= "   tr_stat = 'E' ";
        $qry  .= " where cpid = '{$cpid}' ";
        $result = sql_query($qry, false);

        $qry   = " update product_order set ";
        $qry  .= "   status = '결제취소' ";
        $qry  .= " where appr_idx = '{$cpid}' ";
        $result = sql_query($qry, false);

        $qry   = " update product_approval set ";
        $qry  .= "   status = '결제취소' ";
        $qry  .= " where appr_idx = '{$cpid}' ";
        $result = sql_query($qry, false);

	} else {
		echo "Error 내용:".$response."<br>";
	}
?>
