<?php
/*
 * @Author: your name
 * @Date: 2022-02-08 19:20:09
 * @LastEditTime: 2022-02-08 19:36:42
 * @LastEditors: your name
 * @Description: 
 * @FilePath: \denb\plugin\KTsms\SendKakao.php
 * 
 */
	include 'Common_kakao.php';
	//개별,동보 SMS 발송
    $dt = date("YmdHis");
	$time = $dt.uniqid();
	try {
		$msgParam = array(		
			"custMsgSn"=> $time,							
			"senderKey"=> "fea989c58e2068669d507d4fab9eb53b1a9a3679",							
			"phoneNum"=> "01054500556",		//(String) 회신번호
			"message"=> "안녕하요 테스트 입니다.",		//(String) 회신번호
		);
		$result = $Message->executeMessage($apiUrl,$msgParam);
		print_r($result);
	} catch(Exception $e) {
		echo $e->getMessage();
		echo $e->getCode();
	}
	
?>