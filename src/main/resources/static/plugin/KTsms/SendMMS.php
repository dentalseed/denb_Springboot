<?php
/*
 * @Author: your name
 * @Date: 2021-09-03 11:01:11
 * @LastEditTime: 2023-04-12 15:43:17
 * @LastEditors: OTTO
 * @Description: In User Settings Edit
 * @FilePath: \denb\plugin\KTsms\SendMMS.php
 */
include 'Common.php';
//MMS 발송
try {
	$apiUrl = "/send/mms";
	$msgParam = array(
		"MessageType" => 4,
		"MessageSubType" => 3,					//(Int) 1->일반텍스트, 2->URL, 3->포토메시지, 
		"CallbackNumber" => "0316182804",		//(String) 회신번호
		"SenNumber" => "0316182804",			//(String) 발신과근번호 (Option)
		"ReserveType" => 1,					//(String) 예약타입 1->즉시발송(defualt) , 2->예약발송 (Option)
		//"ReserveTime" => "20230108091300",		//(String) 예약시간 YYYYMMDDHHMMSS (Option)
		//"ReserveDTime" => "20230108190000",	//(String) 만료시간 YYYYMMDDHHMMSS 예약 만료시간 초과한 경우 발송이 안됩니다.(Option)
		// "CustomMessageID"=> "DFKJLAFKHD_011",	//(String) SP Client 에서 지정한 메시지 ID (Option)	
		// "CDRID" => "TEST",					//(String) CDR_ID에 입력된 특정 아이디로 과금하는 기능 (Option)
		//"CDRTime" => "20191231000000",		//(String) 과금 정산 시간 YYYYMMDDHHMMSS 지정하지 않는경우 발송시간 기준으로 과금 (Option)		
		//"CallbackURL" => "www.test.com/?ddd=",		//(String) 회신 URL 콜백 URL SMS 전송에만 사용 가능 (Option)
		"Bundle" => array(
			array(
				"Seq" => 1,						//(Int) 수신리스트 Sequence
				"Subject" => "제목",				//(String) 메시지 제목 (Option)
				"Content" => "
구강검진 문진표
설문지 링크
					",			//(String) 메시지 내용
				"Number" => "01054500556"			//(String) 수신번호
			)
		)
	);
	echo __FILE__ . "<pre>";
	print_r($msgParam);
	echo "</pre>";
	// 포토메시지 파일 첨부
	 $fileParam = array();
	 $fileParam[] = "photo_sample2.jpg";
	$result = $Message->executeMultiMessage($apiUrl, $msgParam, $fileParam);

	print_r($result);
} catch (Exception $e) {
	echo $e->getMessage();
	echo $e->getCode();
}
