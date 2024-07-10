<?php
	//$url = "https://payapi.paywelcome.co.kr/cancel/cancel";
	$url = "https://tpayapi.paywelcome.co.kr/cancel/cancel";
	
	$headers = array();
	$headers[] = "Content-Type: application/x-www-form-urlencoded; charset=UTF-8";
	
	$request_body = "";
	$request_body .= "payType=card&";
	$request_body .= "mid=welcometst&";
	$request_body .= "tid=StdpayCARDINIWelTest20190904115758995708&";
	$request_body .= "price=1000&";
	$request_body .= "currency=WON&";
	$request_body .= "timestamp=&";
	$request_body .= "signature=&";
	
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
	} else {
		echo "Error 내용:".$response."<br>";
	}
?>
