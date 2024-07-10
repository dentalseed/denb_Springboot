<?php
/*
 * @Author: your name
 * @Date: 2021-09-03 11:01:11
 * @LastEditTime: 2023-06-26 00:18:33
 * @LastEditors: OTTO
 * @Description: In User Settings Edit
 * @FilePath: \denb\plugin\KTsms\SendSMS.php
 */
	include 'Common.php';
	//개별,동보 SMS 발송
	try {
		$apiUrl = "/send/sms";
		$msgParam = array(							
			"MessageType"=>1,							
			"MessageSubType"=> 1,					//(Int) 1->일반텍스트(SMS)
			"CallbackNumber"=> "0316182804",		//(String) 회신번호
			//"SenNumber" => "01000000000",			//(String) 발신과근번호 (Option)
			//"ReserveType" => "1"					//(String) 예약타입 1->즉시발송(defualt) , 2->예약발송 (Option)
			//"ReserveTime" => "20191210000000"		//(String) 예약시간 YYYYMMDDHHMMSS (Option)
			//"ReserveDTime" => "20191210000000"	//(String) 만료시간 YYYYMMDDHHMMSS 예약 만료시간 초과한 경우 발송이 안됩니다.(Option)
			//"CustomMessageID"=> "DFKJLAFKHD_011",	//(String) SP Client 에서 지정한 메시지 ID (Option)	
			//"CDRID" => "TEST",					//(String) CDR_ID에 입력된 특정 아이디로 과금하는 기능 (Option)
			//"CDRTime" => "20191231000000",		//(String) 과금 정산 시간 YYYYMMDDHHMMSS 지정하지 않는경우 발송시간 기준으로 과금 (Option)			
			"Message"=>array(
				"Content"=>"<진료안내> {환자이름}님 안녕하세요. 오늘은(6/6일(화)) 공휴일이나 정상진료가 있습안녕하세요. 오늘은(6/안녕하세요. 오늘은(6/sdfsdfsd",				//(String) 메시지 내용
				"Subject"=>"전송내용",					//(String) 메시지 제목 (Option)
				"Receivers"=>						//(Array) 수신번호 리스트
				array(
					array(
						"Seq"=>1,					//(Int) 수신리스트 Sequence
						"Number"=>"01054500556"		//(String) 수신번호
					)
				),
			)
		);
		$result = $Message->executeMessage($apiUrl,$msgParam);
		print_r($result);
	} catch(Exception $e) {
		echo $e->getMessage();
		echo $e->getCode();
	}
	
?>