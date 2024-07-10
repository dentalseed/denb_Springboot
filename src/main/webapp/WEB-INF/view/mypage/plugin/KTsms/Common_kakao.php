<?php
	require_once 'class/Message_kakao.php';
	$apiKey = "2B066E6B4C616F1B64FF6ABC1A1957FB0A032E9460BE218E6E898322C71987BF";		//발급받은 api key
	$apiID = "dentalseed1";		//발급받은 api password
	$apiCenter = "C";		//1센터 -> 1 , 2센터 -> 2 , 차세대 -> 3
	$isDev = false;		//개발용 사용 여부 true / false
	$Message = new Message($apiKey, $apiID, $senderKey, $isDev, $apiCenter);
?>